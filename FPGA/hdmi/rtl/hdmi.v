`timescale 1 ns / 1 ps

module hdmi (
  input wire        rstbtn_n,    //The pink reset button
  input wire        clk25,
  input wire [3:0]  RX0_TMDS,
  input wire [3:0]  RX0_TMDSB,

  output wire [3:0] TX0_TMDS,
  output wire [3:0] TX0_TMDSB,

  output wire [23:0] received_pixel,
  output wire tx0_pclk,

  input wire [23:0] processed_pixel
);


  /////////////////////////
  //
  // HDMI Input
  //
  /////////////////////////
  wire rx0_pclk, rx0_pclkx2, rx0_pclkx10, rx0_pllclk0;
  wire rx0_plllckd;
  wire rx0_reset;
  wire rx0_serdesstrobe;
  wire rx0_hsync;          // hsync data
  wire rx0_vsync;          // vsync data
  wire rx0_de;             // data enable
  wire rx0_psalgnerr;      // channel phase alignment error
  wire [7:0] rx0_red;      // pixel data out
  wire [7:0] rx0_green;    // pixel data out
  wire [7:0] rx0_blue;     // pixel data out
  wire [29:0] rx0_sdata;
  wire rx0_blue_vld;
  wire rx0_green_vld;
  wire rx0_red_vld;
  wire rx0_blue_rdy;
  wire rx0_green_rdy;
  wire rx0_red_rdy;

  dvi_decoder dvi_rx0 (
    //These are input ports
    .tmdsclk_p   (RX0_TMDS[3]),
    .tmdsclk_n   (RX0_TMDSB[3]),
    .blue_p      (RX0_TMDS[0]),
    .green_p     (RX0_TMDS[1]),
    .red_p       (RX0_TMDS[2]),
    .blue_n      (RX0_TMDSB[0]),
    .green_n     (RX0_TMDSB[1]),
    .red_n       (RX0_TMDSB[2]),
    .exrst       (~rstbtn_n),

    //These are output ports
    .reset       (rx0_reset),
    .pclk        (rx0_pclk),
    .pclkx2      (rx0_pclkx2),
    .pclkx10     (rx0_pclkx10),
    .pllclk0     (rx0_pllclk0), // PLL x10 output
    .pllclk1     (rx0_pllclk1), // PLL x1 output
    .pllclk2     (rx0_pllclk2), // PLL x2 output
    .pll_lckd    (rx0_plllckd),
    .tmdsclk     (rx0_tmdsclk),
    .serdesstrobe(rx0_serdesstrobe),
    .hsync       (rx0_hsync),
    .vsync       (rx0_vsync),
    .de          (rx0_de),

    .blue_vld    (rx0_blue_vld),
    .green_vld   (rx0_green_vld),
    .red_vld     (rx0_red_vld),
    .blue_rdy    (rx0_blue_rdy),
    .green_rdy   (rx0_green_rdy),
    .red_rdy     (rx0_red_rdy),

    .psalgnerr   (rx0_psalgnerr),

    .sdout       (rx0_sdata),
    .red         (rx0_red),
    .green       (rx0_green),
    .blue        (rx0_blue));


    wire [26:0] data_from_fifo; 
    wire [26:0] fifo_data;
	 
pixel_fifo rx_fifo (
	.wr_clk(rx0_pclk),
	.rd_clk(tx0_pclk),
	.din(fifo_data), // Bus [26 : 0] 
	.wr_en(1),
	.rd_en(1),
	.dout(data_from_fifo),
	.full(full_lol),
	.empty(empty_lol)// Bus [26 : 0] 
	);

  assign fifo_data = {rx0_de, rx0_vsync, rx0_hsync, rx0_blue, rx0_green, rx0_red};


  /////////////////
  //
  // HDMI Output
  //
  /////////////////


  wire         tx0_pclkx2;
  wire         tx0_pclkx10;
  wire         tx0_serdesstrobe;
  wire         tx0_reset;
  wire [7:0]   tx0_blue;
  wire [7:0]   tx0_green;
  wire [7:0]   tx0_red;
  wire         tx0_hsync;
  wire         tx0_vsync;
  wire         tx0_pll_reset;

  assign tx0_pll_reset    = rx0_reset;

  //////////////////////////////////////////////////////////////////
  // Instantiate a dedicate PLL for output port
  //////////////////////////////////////////////////////////////////
  wire tx0_clkfbout, tx0_clkfbin, tx0_plllckd;
  wire tx0_pllclk0, tx0_pllclk2;

  PLL_BASE # (
    .CLKIN_PERIOD(10),
    .CLKFBOUT_MULT(10), //set VCO to 10x of CLKIN
    .CLKOUT0_DIVIDE(1),
    .CLKOUT1_DIVIDE(10),
    .CLKOUT2_DIVIDE(5),
    .COMPENSATION("SOURCE_SYNCHRONOUS")
  ) PLL_OSERDES_0 (
    .CLKFBOUT(tx0_clkfbout),
    .CLKOUT0(tx0_pllclk0),
    .CLKOUT1(),
    .CLKOUT2(tx0_pllclk2),
    .CLKOUT3(),
    .CLKOUT4(),
    .CLKOUT5(),
    .LOCKED(tx0_plllckd),
    .CLKFBIN(tx0_clkfbin),
    .CLKIN(tx0_pclk),
    .RST(tx0_pll_reset)
  );

  // This BUFGMUX directly selects between two RX PLL pclk outputs
  // This way we have a matched skew between the RX pclk clocks and the TX pclk
  BUFG tx0_bufg_pclk (.I(rx0_pllclk1), .O(tx0_pclk));

  // This BUFG is needed in order to deskew between PLL clkin and clkout
  // So the tx0 pclkx2 and pclkx10 will have the same phase as the pclk input
  BUFG tx0_clkfb_buf (.I(tx0_clkfbout), .O(tx0_clkfbin));

  // regenerate pclkx2 for TX
  BUFG tx0_pclkx2_buf (.I(tx0_pllclk2), .O(tx0_pclkx2));

  // regenerate pclkx10 for TX
  wire tx0_bufpll_lock;
  BUFPLL #(.DIVIDE(5)) tx0_ioclk_buf (.PLLIN(tx0_pllclk0), .GCLK(tx0_pclkx2), .LOCKED(tx0_plllckd),
           .IOCLK(tx0_pclkx10), .SERDESSTROBE(tx0_serdesstrobe), .LOCK(tx0_bufpll_lock));


  // Actual output
  assign tx0_reset = ~tx0_bufpll_lock;
  assign received_pixel = data_from_fifo[23:0];


  dvi_encoder_top dvi_tx0 (
    .pclk        (tx0_pclk),
    .pclkx2      (tx0_pclkx2),
    .pclkx10     (tx0_pclkx10),
    .serdesstrobe(tx0_serdesstrobe),
    .rstin       (tx0_reset),
	.blue_din	(processed_pixel[23:16]),
	.green_din	(processed_pixel[15:8]),
	.red_din	(processed_pixel[7:0]),
    .hsync       (data_from_fifo[24]),
    .vsync       (data_from_fifo[25]),
    .de          (data_from_fifo[26]),
    .TMDS        (TX0_TMDS),
    .TMDSB       (TX0_TMDSB));

endmodule
