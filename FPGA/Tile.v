module Tile(input clk, input reset,
    input [23:0] io_hdmi_data_in,
    output[23:0] io_data_out
);

  reg [23:0] pipe4;
  wire[23:0] T0;
  reg [23:0] pipe3;
  wire[23:0] T1;
  reg [23:0] pipe2;
  wire[23:0] T2;
  reg [23:0] pipe1;
  wire[23:0] T3;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    pipe4 = {1{$random}};
    pipe3 = {1{$random}};
    pipe2 = {1{$random}};
    pipe1 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_data_out = pipe4;
  assign T0 = reset ? 24'h0 : pipe3;
  assign T1 = reset ? 24'h0 : pipe2;
  assign T2 = reset ? 24'h0 : pipe1;
  assign T3 = reset ? 24'h0 : io_hdmi_data_in;

  always @(posedge clk) begin
    if(reset) begin
      pipe4 <= 24'h0;
    end else begin
      pipe4 <= pipe3;
    end
    if(reset) begin
      pipe3 <= 24'h0;
    end else begin
      pipe3 <= pipe2;
    end
    if(reset) begin
      pipe2 <= 24'h0;
    end else begin
      pipe2 <= pipe1;
    end
    if(reset) begin
      pipe1 <= 24'h0;
    end else begin
      pipe1 <= io_hdmi_data_in;
    end
  end
endmodule

