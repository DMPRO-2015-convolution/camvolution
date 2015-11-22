`timescale 1 ns / 1 ps

module camvolution(
	input wire        clk120,      //120 MHz osicallator
   input wire [3:0]  RX0_TMDS,
   input wire [3:0]  RX0_TMDSB,

   output wire [3:0] TX0_TMDS,
   output wire [3:0] TX0_TMDSB
   );





hdmi inputoutput(
  //input wire        RSTBTN,    //The pink reset button
  .clk120	 (SYS_CLK), //120 MHz osicallator
  .RX0_TMDS	 (RX0_TMDS),
  .RX0_TMDSB (RX0_TMDSB),

  .TX0_TMDS  (TX0_TMDS),
  .TX0_TMDSB (TX0_TMDSB));



endmodule
