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

  output wire led,

  input wire daisy_clock,
  input wire io_output_valid,
  output wire full_processed_fifo,
  output wire fifo_valid,
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


	
  // Generate correct control signals

  //640x480@59.94HZ
  parameter HPIXELS_VGA = 11'd640; //Horizontal Live Pixels
  parameter VLINES_VGA  = 11'd480; //Vertical Live ines
  parameter HSYNCPW_VGA = 11'd96;  //HSYNC Pulse Width
  parameter VSYNCPW_VGA = 11'd2;   //VSYNC Pulse Width
  parameter HFNPRCH_VGA = 11'd16;  //Horizontal Front Portch
  parameter VFNPRCH_VGA = 11'd12;  //Vertical Front Portch
  parameter HBKPRCH_VGA = 11'd48;  //Horizontal Front Portch
  parameter VBKPRCH_VGA = 11'd31;  //Vertical Front Portch

  wire VGA_HSYNC_INT, VGA_VSYNC_INT;
  wire   [10:0] bgnd_hcount;
  wire          bgnd_hsync;
  wire          bgnd_hblnk;
  wire   [10:0] bgnd_vcount;
  wire          bgnd_vsync;
  wire          bgnd_vblnk;
 // wire		    fifo_valid;

  reg started = 1'd0;
  reg valid = 1'd0;

  assign led = started;

 // always @ (posedge rx0_pclk)
 // begin
//	started <= started || (rx0_vsync && rx0_hsync && (rx0_red_vld | rx0_green_vld | rx0_blue_vld));
 // end

  always @ (posedge tx0_pclk)
  begin
	valid <= valid || fifo_valid;
  end
  
  

	 
pixel_fifo rx_fifo (
	.wr_clk(rx0_pclk),
	.rd_clk(daisy_clock),
	.din(fifo_data), // Bus [26 : 0] 
	.wr_en(started && rx0_de),
	.rd_en(!bgnd_hblnk && !bgnd_vblnk),
	.dout(data_from_fifo),
	.valid(fifo_valid)
	);

  timing timing_inst (
	// inputs
    .clk(tx0_pclk),
    .restart(!valid),
    .tc_hsblnk(HPIXELS_VGA - 11'd1),
    .tc_hssync(HPIXELS_VGA - 11'd1 + HFNPRCH_VGA),
    .tc_hesync(HPIXELS_VGA - 11'd1 + HFNPRCH_VGA + HSYNCPW_VGA),
    .tc_heblnk(HPIXELS_VGA - 11'd1 + HFNPRCH_VGA + HSYNCPW_VGA + HBKPRCH_VGA),
    .tc_vsblnk(VLINES_VGA - 11'd1),
    .tc_vssync(VLINES_VGA - 11'd1 + VFNPRCH_VGA),
    .tc_vesync(VLINES_VGA - 11'd1 + VFNPRCH_VGA + VSYNCPW_VGA),
    .tc_veblnk(VLINES_VGA - 11'd1 + VFNPRCH_VGA + VSYNCPW_VGA + VBKPRCH_VGA),
	// outputs
    .hcount(bgnd_hcount),
    .hsync(VGA_HSYNC_INT),
    .hblnk(bgnd_hblnk),
    .vcount(bgnd_vcount),
    .vsync(VGA_VSYNC_INT),
    .vblnk(bgnd_vblnk));


  // Actual output
  assign tx0_reset = ~tx0_bufpll_lock;
  assign received_pixel = data_from_fifo[23:0];
  wire [23:0] processed_pixel_from_fifo;
  //wire full_processed_fifo;

processed_pixel_fifo processed_fifo (
	.wr_clk(daisy_clock),
	.rd_clk(tx0_pclk),
	.din(processed_pixel), // Bus [23 : 0] 
	.wr_en(io_output_valid),
	.rd_en(!bgnd_hblnk && !bgnd_vblnk),
	.dout(processed_pixel_from_fifo), // Bus [23 : 0] 
	.full(full_processed_fifo),
	.empty(emptylolol),
	.valid(validlolol));

  dvi_encoder_top dvi_tx0 (
    .pclk        (tx0_pclk),
    .pclkx2      (tx0_pclkx2),
    .pclkx10     (tx0_pclkx10),
    .serdesstrobe(tx0_serdesstrobe),
    .rstin       (tx0_reset),
	.blue_din	(processed_pixel_from_fifo[23:16]),
	.green_din	(processed_pixel_from_fifo[15:8]),
	.red_din	(processed_pixel_from_fifo[7:0]),
    .hsync       (VGA_HSYNC_INT),
    .vsync       (VGA_VSYNC_INT),
    .de          (!bgnd_hblnk && !bgnd_vblnk),
	 //.hsync		(rx0_hsync),
	 //.vsync		(rx0_vsync),
	 //.de			(rx0_de),
    .TMDS        (TX0_TMDS),
    .TMDSB       (TX0_TMDSB));

endmodule
