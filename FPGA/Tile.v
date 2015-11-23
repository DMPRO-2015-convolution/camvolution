module PixelReg(input clk, input reset,
    input [23:0] io_pixel_in,
    input  io_enable_in,
    input  io_stall,
    output[23:0] io_data_out,
    output io_enable_out
);

  reg  enable;
  wire T3;
  wire T0;
  wire T1;
  reg [23:0] data;
  wire[23:0] T4;
  wire[23:0] T2;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    enable = {1{$random}};
    data = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_enable_out = enable;
  assign T3 = reset ? 1'h0 : T0;
  assign T0 = T1 ? io_enable_in : enable;
  assign T1 = io_stall ^ 1'h1;
  assign io_data_out = data;
  assign T4 = reset ? 24'h0 : T2;
  assign T2 = enable ? io_pixel_in : data;

  always @(posedge clk) begin
    if(reset) begin
      enable <= 1'h0;
    end else if(T1) begin
      enable <= io_enable_in;
    end
    if(reset) begin
      data <= 24'h0;
    end else if(enable) begin
      data <= io_pixel_in;
    end
  end
endmodule

module Mux(input clk, input reset,
    input [23:0] io_pixel_in_2,
    input [23:0] io_pixel_in_1,
    input [23:0] io_pixel_in_0,
    input  io_enable_in,
    input  io_stall,
    output[23:0] io_data_out,
    output io_enable_out,
    output[7:0] io_dbg_enable
);

  reg [7:0] state;
  wire[7:0] T19;
  wire[7:0] T0;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire[7:0] T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  reg [23:0] selected;
  wire[23:0] T13;
  wire[23:0] T14;
  wire[23:0] T15;
  wire T16;
  wire T17;
  wire T18;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    selected = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_enable = state;
  assign T19 = reset ? 8'h0 : T0;
  assign T0 = T9 ? T8 : T1;
  assign T1 = T4 ? T3 : T2;
  assign T2 = io_enable_in ? 8'h0 : state;
  assign T3 = state + 8'h1;
  assign T4 = T7 & T5;
  assign T5 = T6 ^ 1'h1;
  assign T6 = state == 8'h3;
  assign T7 = io_stall ^ 1'h1;
  assign T8 = state + 8'h1;
  assign T9 = T4 & T10;
  assign T10 = T11 ^ 1'h1;
  assign T11 = state == 8'h2;
  assign io_enable_out = T12;
  assign T12 = T4 & T11;
  assign io_data_out = selected;
  assign T13 = T18 ? io_pixel_in_2 : T14;
  assign T14 = T17 ? io_pixel_in_1 : T15;
  assign T15 = T16 ? io_pixel_in_0 : selected;
  assign T16 = state == 8'h0;
  assign T17 = state == 8'h1;
  assign T18 = state == 8'h2;

  always @(posedge clk) begin
    if(reset) begin
      state <= 8'h0;
    end else if(T9) begin
      state <= T8;
    end else if(T4) begin
      state <= T3;
    end else if(io_enable_in) begin
      state <= 8'h0;
    end
    if(T18) begin
      selected <= io_pixel_in_2;
    end else if(T17) begin
      selected <= io_pixel_in_1;
    end else if(T16) begin
      selected <= io_pixel_in_0;
    end
  end
endmodule

module PixelArray(input clk, input reset,
    input [23:0] io_pixel_in_2,
    input [23:0] io_pixel_in_1,
    input [23:0] io_pixel_in_0,
    input  io_ping_read,
    input  io_ping_mux,
    input  io_stall,
    output[23:0] io_data_out_2,
    output[23:0] io_data_out_1,
    output[23:0] io_data_out_0,
    output[23:0] io_dbg_reg_contents_8,
    output[23:0] io_dbg_reg_contents_7,
    output[23:0] io_dbg_reg_contents_6,
    output[23:0] io_dbg_reg_contents_5,
    output[23:0] io_dbg_reg_contents_4,
    output[23:0] io_dbg_reg_contents_3,
    output[23:0] io_dbg_reg_contents_2,
    output[23:0] io_dbg_reg_contents_1,
    output[23:0] io_dbg_reg_contents_0
);

  wire[23:0] PixelReg_io_data_out;
  wire PixelReg_io_enable_out;
  wire[23:0] PixelReg_1_io_data_out;
  wire PixelReg_1_io_enable_out;
  wire[23:0] PixelReg_2_io_data_out;
  wire PixelReg_2_io_enable_out;
  wire[23:0] PixelReg_3_io_data_out;
  wire PixelReg_3_io_enable_out;
  wire[23:0] PixelReg_4_io_data_out;
  wire PixelReg_4_io_enable_out;
  wire[23:0] PixelReg_5_io_data_out;
  wire PixelReg_5_io_enable_out;
  wire[23:0] PixelReg_6_io_data_out;
  wire PixelReg_6_io_enable_out;
  wire[23:0] PixelReg_7_io_data_out;
  wire PixelReg_7_io_enable_out;
  wire[23:0] PixelReg_8_io_data_out;
  wire[23:0] Mux_io_data_out;
  wire Mux_io_enable_out;
  wire[23:0] Mux_1_io_data_out;
  wire Mux_1_io_enable_out;
  wire[23:0] Mux_2_io_data_out;


  assign io_dbg_reg_contents_0 = PixelReg_io_data_out;
  assign io_dbg_reg_contents_1 = PixelReg_1_io_data_out;
  assign io_dbg_reg_contents_2 = PixelReg_2_io_data_out;
  assign io_dbg_reg_contents_3 = PixelReg_3_io_data_out;
  assign io_dbg_reg_contents_4 = PixelReg_4_io_data_out;
  assign io_dbg_reg_contents_5 = PixelReg_5_io_data_out;
  assign io_dbg_reg_contents_6 = PixelReg_6_io_data_out;
  assign io_dbg_reg_contents_7 = PixelReg_7_io_data_out;
  assign io_dbg_reg_contents_8 = PixelReg_8_io_data_out;
  assign io_data_out_0 = Mux_io_data_out;
  assign io_data_out_1 = Mux_1_io_data_out;
  assign io_data_out_2 = Mux_2_io_data_out;
  PixelReg PixelReg(.clk(clk), .reset(reset),
       .io_pixel_in( io_pixel_in_0 ),
       .io_enable_in( io_ping_read ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_io_data_out ),
       .io_enable_out( PixelReg_io_enable_out )
  );
  PixelReg PixelReg_1(.clk(clk), .reset(reset),
       .io_pixel_in( io_pixel_in_0 ),
       .io_enable_in( PixelReg_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_1_io_data_out ),
       .io_enable_out( PixelReg_1_io_enable_out )
  );
  PixelReg PixelReg_2(.clk(clk), .reset(reset),
       .io_pixel_in( io_pixel_in_0 ),
       .io_enable_in( PixelReg_1_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_2_io_data_out ),
       .io_enable_out( PixelReg_2_io_enable_out )
  );
  PixelReg PixelReg_3(.clk(clk), .reset(reset),
       .io_pixel_in( io_pixel_in_1 ),
       .io_enable_in( PixelReg_2_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_3_io_data_out ),
       .io_enable_out( PixelReg_3_io_enable_out )
  );
  PixelReg PixelReg_4(.clk(clk), .reset(reset),
       .io_pixel_in( io_pixel_in_1 ),
       .io_enable_in( PixelReg_3_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_4_io_data_out ),
       .io_enable_out( PixelReg_4_io_enable_out )
  );
  PixelReg PixelReg_5(.clk(clk), .reset(reset),
       .io_pixel_in( io_pixel_in_1 ),
       .io_enable_in( PixelReg_4_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_5_io_data_out ),
       .io_enable_out( PixelReg_5_io_enable_out )
  );
  PixelReg PixelReg_6(.clk(clk), .reset(reset),
       .io_pixel_in( io_pixel_in_2 ),
       .io_enable_in( PixelReg_5_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_6_io_data_out ),
       .io_enable_out( PixelReg_6_io_enable_out )
  );
  PixelReg PixelReg_7(.clk(clk), .reset(reset),
       .io_pixel_in( io_pixel_in_2 ),
       .io_enable_in( PixelReg_6_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_7_io_data_out ),
       .io_enable_out( PixelReg_7_io_enable_out )
  );
  PixelReg PixelReg_8(.clk(clk), .reset(reset),
       .io_pixel_in( io_pixel_in_2 ),
       .io_enable_in( PixelReg_7_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_8_io_data_out )
       //.io_enable_out(  )
  );
  Mux Mux(.clk(clk), .reset(reset),
       .io_pixel_in_2( PixelReg_2_io_data_out ),
       .io_pixel_in_1( PixelReg_1_io_data_out ),
       .io_pixel_in_0( PixelReg_io_data_out ),
       .io_enable_in( io_ping_mux ),
       .io_stall( io_stall ),
       .io_data_out( Mux_io_data_out ),
       .io_enable_out( Mux_io_enable_out )
       //.io_dbg_enable(  )
  );
  Mux Mux_1(.clk(clk), .reset(reset),
       .io_pixel_in_2( PixelReg_5_io_data_out ),
       .io_pixel_in_1( PixelReg_4_io_data_out ),
       .io_pixel_in_0( PixelReg_3_io_data_out ),
       .io_enable_in( Mux_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( Mux_1_io_data_out ),
       .io_enable_out( Mux_1_io_enable_out )
       //.io_dbg_enable(  )
  );
  Mux Mux_2(.clk(clk), .reset(reset),
       .io_pixel_in_2( PixelReg_8_io_data_out ),
       .io_pixel_in_1( PixelReg_7_io_data_out ),
       .io_pixel_in_0( PixelReg_6_io_data_out ),
       .io_enable_in( Mux_1_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( Mux_2_io_data_out )
       //.io_enable_out(  )
       //.io_dbg_enable(  )
  );
endmodule

module ShiftMux_0(input clk, input reset,
    input [23:0] io_pixel_in_2,
    input [23:0] io_pixel_in_1,
    input [23:0] io_pixel_in_0,
    input  io_shift,
    input  io_stall,
    input  io_reset,
    output[23:0] io_data_out,
    output[7:0] io_dbg_state
);

  reg [7:0] state;
  wire[7:0] T18;
  wire[7:0] T0;
  wire[7:0] T1;
  wire[7:0] T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire[7:0] T9;
  wire T10;
  wire T11;
  reg [23:0] selected;
  wire[23:0] T12;
  wire[23:0] T13;
  wire[23:0] T14;
  wire T15;
  wire T16;
  wire T17;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    selected = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_state = state;
  assign T18 = reset ? 8'h0 : T0;
  assign T0 = T10 ? T9 : T1;
  assign T1 = T3 ? 8'h0 : T2;
  assign T2 = io_reset ? 8'h0 : state;
  assign T3 = T5 & T4;
  assign T4 = state == 8'h2;
  assign T5 = T6 & io_shift;
  assign T6 = T8 & T7;
  assign T7 = io_stall ^ 1'h1;
  assign T8 = io_reset ^ 1'h1;
  assign T9 = state + 8'h1;
  assign T10 = T5 & T11;
  assign T11 = T4 ^ 1'h1;
  assign io_data_out = selected;
  assign T12 = T17 ? io_pixel_in_2 : T13;
  assign T13 = T16 ? io_pixel_in_1 : T14;
  assign T14 = T15 ? io_pixel_in_0 : selected;
  assign T15 = state == 8'h0;
  assign T16 = state == 8'h1;
  assign T17 = state == 8'h2;

  always @(posedge clk) begin
    if(reset) begin
      state <= 8'h0;
    end else if(T10) begin
      state <= T9;
    end else if(T3) begin
      state <= 8'h0;
    end else if(io_reset) begin
      state <= 8'h0;
    end
    if(T17) begin
      selected <= io_pixel_in_2;
    end else if(T16) begin
      selected <= io_pixel_in_1;
    end else if(T15) begin
      selected <= io_pixel_in_0;
    end
  end
endmodule

module ShiftMux_1(input clk, input reset,
    input [23:0] io_pixel_in_2,
    input [23:0] io_pixel_in_1,
    input [23:0] io_pixel_in_0,
    input  io_shift,
    input  io_stall,
    input  io_reset,
    output[23:0] io_data_out,
    output[7:0] io_dbg_state
);

  reg [7:0] state;
  wire[7:0] T18;
  wire[7:0] T0;
  wire[7:0] T1;
  wire[7:0] T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire[7:0] T9;
  wire T10;
  wire T11;
  reg [23:0] selected;
  wire[23:0] T12;
  wire[23:0] T13;
  wire[23:0] T14;
  wire T15;
  wire T16;
  wire T17;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    selected = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_state = state;
  assign T18 = reset ? 8'h1 : T0;
  assign T0 = T10 ? T9 : T1;
  assign T1 = T3 ? 8'h0 : T2;
  assign T2 = io_reset ? 8'h1 : state;
  assign T3 = T5 & T4;
  assign T4 = state == 8'h2;
  assign T5 = T6 & io_shift;
  assign T6 = T8 & T7;
  assign T7 = io_stall ^ 1'h1;
  assign T8 = io_reset ^ 1'h1;
  assign T9 = state + 8'h1;
  assign T10 = T5 & T11;
  assign T11 = T4 ^ 1'h1;
  assign io_data_out = selected;
  assign T12 = T17 ? io_pixel_in_2 : T13;
  assign T13 = T16 ? io_pixel_in_1 : T14;
  assign T14 = T15 ? io_pixel_in_0 : selected;
  assign T15 = state == 8'h0;
  assign T16 = state == 8'h1;
  assign T17 = state == 8'h2;

  always @(posedge clk) begin
    if(reset) begin
      state <= 8'h1;
    end else if(T10) begin
      state <= T9;
    end else if(T3) begin
      state <= 8'h0;
    end else if(io_reset) begin
      state <= 8'h1;
    end
    if(T17) begin
      selected <= io_pixel_in_2;
    end else if(T16) begin
      selected <= io_pixel_in_1;
    end else if(T15) begin
      selected <= io_pixel_in_0;
    end
  end
endmodule

module ShiftMux_2(input clk, input reset,
    input [23:0] io_pixel_in_2,
    input [23:0] io_pixel_in_1,
    input [23:0] io_pixel_in_0,
    input  io_shift,
    input  io_stall,
    input  io_reset,
    output[23:0] io_data_out,
    output[7:0] io_dbg_state
);

  reg [7:0] state;
  wire[7:0] T18;
  wire[7:0] T0;
  wire[7:0] T1;
  wire[7:0] T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire[7:0] T9;
  wire T10;
  wire T11;
  reg [23:0] selected;
  wire[23:0] T12;
  wire[23:0] T13;
  wire[23:0] T14;
  wire T15;
  wire T16;
  wire T17;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    selected = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_state = state;
  assign T18 = reset ? 8'h2 : T0;
  assign T0 = T10 ? T9 : T1;
  assign T1 = T3 ? 8'h0 : T2;
  assign T2 = io_reset ? 8'h2 : state;
  assign T3 = T5 & T4;
  assign T4 = state == 8'h2;
  assign T5 = T6 & io_shift;
  assign T6 = T8 & T7;
  assign T7 = io_stall ^ 1'h1;
  assign T8 = io_reset ^ 1'h1;
  assign T9 = state + 8'h1;
  assign T10 = T5 & T11;
  assign T11 = T4 ^ 1'h1;
  assign io_data_out = selected;
  assign T12 = T17 ? io_pixel_in_2 : T13;
  assign T13 = T16 ? io_pixel_in_1 : T14;
  assign T14 = T15 ? io_pixel_in_0 : selected;
  assign T15 = state == 8'h0;
  assign T16 = state == 8'h1;
  assign T17 = state == 8'h2;

  always @(posedge clk) begin
    if(reset) begin
      state <= 8'h2;
    end else if(T10) begin
      state <= T9;
    end else if(T3) begin
      state <= 8'h0;
    end else if(io_reset) begin
      state <= 8'h2;
    end
    if(T17) begin
      selected <= io_pixel_in_2;
    end else if(T16) begin
      selected <= io_pixel_in_1;
    end else if(T15) begin
      selected <= io_pixel_in_0;
    end
  end
endmodule

module PixelGrid(input clk, input reset,
    input [23:0] io_pixel_in,
    input  io_read_row_2,
    input  io_read_row_1,
    input  io_read_row_0,
    input  io_mux_row_2,
    input  io_mux_row_1,
    input  io_mux_row_0,
    input  io_shift_mux,
    //input  io_reset
    input  io_stall,
    output[23:0] io_data_out_2,
    output[23:0] io_data_out_1,
    output[23:0] io_data_out_0
);

  reg [23:0] input_tree_0;
  wire[23:0] T0;
  reg [23:0] input_tree_1;
  wire[23:0] T1;
  reg [23:0] input_tree_2;
  wire[23:0] T2;
  wire[23:0] ShiftMux_io_data_out;
  wire[23:0] ShiftMux_1_io_data_out;
  wire[23:0] ShiftMux_2_io_data_out;
  wire[23:0] PixelArray_io_data_out_2;
  wire[23:0] PixelArray_io_data_out_1;
  wire[23:0] PixelArray_io_data_out_0;
  wire[23:0] PixelArray_1_io_data_out_2;
  wire[23:0] PixelArray_1_io_data_out_1;
  wire[23:0] PixelArray_1_io_data_out_0;
  wire[23:0] PixelArray_2_io_data_out_2;
  wire[23:0] PixelArray_2_io_data_out_1;
  wire[23:0] PixelArray_2_io_data_out_0;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    input_tree_0 = {1{$random}};
    input_tree_1 = {1{$random}};
    input_tree_2 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = reset ? 24'h0 : io_pixel_in;
  assign T1 = reset ? 24'h0 : io_pixel_in;
  assign T2 = reset ? 24'h0 : io_pixel_in;
  assign io_data_out_0 = ShiftMux_io_data_out;
  assign io_data_out_1 = ShiftMux_1_io_data_out;
  assign io_data_out_2 = ShiftMux_2_io_data_out;
  PixelArray PixelArray(.clk(clk), .reset(reset),
       .io_pixel_in_2( input_tree_2 ),
       .io_pixel_in_1( input_tree_1 ),
       .io_pixel_in_0( input_tree_0 ),
       .io_ping_read( io_read_row_0 ),
       .io_ping_mux( io_mux_row_0 ),
       .io_stall( io_stall ),
       .io_data_out_2( PixelArray_io_data_out_2 ),
       .io_data_out_1( PixelArray_io_data_out_1 ),
       .io_data_out_0( PixelArray_io_data_out_0 )
       //.io_dbg_reg_contents_8(  )
       //.io_dbg_reg_contents_7(  )
       //.io_dbg_reg_contents_6(  )
       //.io_dbg_reg_contents_5(  )
       //.io_dbg_reg_contents_4(  )
       //.io_dbg_reg_contents_3(  )
       //.io_dbg_reg_contents_2(  )
       //.io_dbg_reg_contents_1(  )
       //.io_dbg_reg_contents_0(  )
  );
  PixelArray PixelArray_1(.clk(clk), .reset(reset),
       .io_pixel_in_2( PixelArray_io_data_out_2 ),
       .io_pixel_in_1( PixelArray_io_data_out_1 ),
       .io_pixel_in_0( PixelArray_io_data_out_0 ),
       .io_ping_read( io_read_row_1 ),
       .io_ping_mux( io_mux_row_1 ),
       .io_stall( io_stall ),
       .io_data_out_2( PixelArray_1_io_data_out_2 ),
       .io_data_out_1( PixelArray_1_io_data_out_1 ),
       .io_data_out_0( PixelArray_1_io_data_out_0 )
       //.io_dbg_reg_contents_8(  )
       //.io_dbg_reg_contents_7(  )
       //.io_dbg_reg_contents_6(  )
       //.io_dbg_reg_contents_5(  )
       //.io_dbg_reg_contents_4(  )
       //.io_dbg_reg_contents_3(  )
       //.io_dbg_reg_contents_2(  )
       //.io_dbg_reg_contents_1(  )
       //.io_dbg_reg_contents_0(  )
  );
  PixelArray PixelArray_2(.clk(clk), .reset(reset),
       .io_pixel_in_2( PixelArray_1_io_data_out_2 ),
       .io_pixel_in_1( PixelArray_1_io_data_out_1 ),
       .io_pixel_in_0( PixelArray_1_io_data_out_0 ),
       .io_ping_read( io_read_row_2 ),
       .io_ping_mux( io_mux_row_2 ),
       .io_stall( io_stall ),
       .io_data_out_2( PixelArray_2_io_data_out_2 ),
       .io_data_out_1( PixelArray_2_io_data_out_1 ),
       .io_data_out_0( PixelArray_2_io_data_out_0 )
       //.io_dbg_reg_contents_8(  )
       //.io_dbg_reg_contents_7(  )
       //.io_dbg_reg_contents_6(  )
       //.io_dbg_reg_contents_5(  )
       //.io_dbg_reg_contents_4(  )
       //.io_dbg_reg_contents_3(  )
       //.io_dbg_reg_contents_2(  )
       //.io_dbg_reg_contents_1(  )
       //.io_dbg_reg_contents_0(  )
  );
  ShiftMux_0 ShiftMux(.clk(clk), .reset(reset),
       .io_pixel_in_2( PixelArray_io_data_out_2 ),
       .io_pixel_in_1( PixelArray_io_data_out_1 ),
       .io_pixel_in_0( PixelArray_io_data_out_0 ),
       .io_shift( io_shift_mux ),
       .io_stall( io_stall ),
       .io_reset( io_stall ),
       .io_data_out( ShiftMux_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux_1 ShiftMux_1(.clk(clk), .reset(reset),
       .io_pixel_in_2( PixelArray_1_io_data_out_2 ),
       .io_pixel_in_1( PixelArray_1_io_data_out_1 ),
       .io_pixel_in_0( PixelArray_1_io_data_out_0 ),
       .io_shift( io_shift_mux ),
       .io_stall( io_stall ),
       .io_reset( io_stall ),
       .io_data_out( ShiftMux_1_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux_2 ShiftMux_2(.clk(clk), .reset(reset),
       .io_pixel_in_2( PixelArray_2_io_data_out_2 ),
       .io_pixel_in_1( PixelArray_2_io_data_out_1 ),
       .io_pixel_in_0( PixelArray_2_io_data_out_0 ),
       .io_shift( io_shift_mux ),
       .io_stall( io_stall ),
       .io_reset( io_stall ),
       .io_data_out( ShiftMux_2_io_data_out )
       //.io_dbg_state(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      input_tree_0 <= 24'h0;
    end else begin
      input_tree_0 <= io_pixel_in;
    end
    if(reset) begin
      input_tree_1 <= 24'h0;
    end else begin
      input_tree_1 <= io_pixel_in;
    end
    if(reset) begin
      input_tree_2 <= 24'h0;
    end else begin
      input_tree_2 <= io_pixel_in;
    end
  end
endmodule

module Orchestrator(input clk, input reset,
    input  io_reset,
    output io_read_row_2,
    output io_read_row_1,
    output io_read_row_0,
    output io_mux_row_2,
    output io_mux_row_1,
    output io_mux_row_0,
    output io_shift_mux,
    output io_accumulator_flush,
    output io_ALU_shift,
    output[7:0] io_dbg_counter
);

  reg [7:0] time_;
  wire[7:0] T60;
  wire[7:0] T0;
  wire[7:0] T1;
  wire[7:0] T2;
  wire T3;
  wire T4;
  wire T5;
  wire[7:0] T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    time_ = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_counter = time_;
  assign T60 = reset ? 8'h0 : T0;
  assign T0 = T7 ? T6 : T1;
  assign T1 = T3 ? 8'h0 : T2;
  assign T2 = io_reset ? 8'h0 : time_;
  assign T3 = T5 & T4;
  assign T4 = time_ == 8'h8;
  assign T5 = io_reset ^ 1'h1;
  assign T6 = time_ + 8'h1;
  assign T7 = T5 & T8;
  assign T8 = T4 ^ 1'h1;
  assign io_ALU_shift = T9;
  assign T9 = T16 ? 1'h1 : T10;
  assign T10 = T14 ? 1'h1 : T11;
  assign T11 = T13 & T12;
  assign T12 = time_ == 8'h0;
  assign T13 = io_reset ^ 1'h1;
  assign T14 = T13 & T15;
  assign T15 = time_ == 8'h3;
  assign T16 = T13 & T17;
  assign T17 = time_ == 8'h6;
  assign io_accumulator_flush = T18;
  assign T18 = time_ == 8'h3;
  assign io_shift_mux = T19;
  assign T19 = T25 ? 1'h1 : T20;
  assign T20 = T23 ? 1'h1 : T21;
  assign T21 = T13 & T22;
  assign T22 = time_ == 8'h0;
  assign T23 = T13 & T24;
  assign T24 = time_ == 8'h3;
  assign T25 = T13 & T26;
  assign T26 = time_ == 8'h6;
  assign io_mux_row_0 = T27;
  assign T27 = T31 ? 1'h0 : T28;
  assign T28 = T30 & T29;
  assign T29 = time_ == 8'h5;
  assign T30 = io_reset ^ 1'h1;
  assign T31 = T30 & T32;
  assign T32 = T29 ^ 1'h1;
  assign io_mux_row_1 = T33;
  assign T33 = T37 ? 1'h0 : T34;
  assign T34 = T36 & T35;
  assign T35 = time_ == 8'h2;
  assign T36 = io_reset ^ 1'h1;
  assign T37 = T36 & T38;
  assign T38 = T35 ^ 1'h1;
  assign io_mux_row_2 = T39;
  assign T39 = T43 ? 1'h0 : T40;
  assign T40 = T42 & T41;
  assign T41 = time_ == 8'h8;
  assign T42 = io_reset ^ 1'h1;
  assign T43 = T42 & T44;
  assign T44 = T41 ^ 1'h1;
  assign io_read_row_0 = T45;
  assign T45 = T48 ? 1'h0 : T46;
  assign T46 = T30 & T47;
  assign T47 = time_ == 8'h0;
  assign T48 = T30 & T49;
  assign T49 = T47 ^ 1'h1;
  assign io_read_row_1 = T50;
  assign T50 = T53 ? 1'h0 : T51;
  assign T51 = T36 & T52;
  assign T52 = time_ == 8'h6;
  assign T53 = T36 & T54;
  assign T54 = T52 ^ 1'h1;
  assign io_read_row_2 = T55;
  assign T55 = T58 ? 1'h0 : T56;
  assign T56 = T42 & T57;
  assign T57 = time_ == 8'h3;
  assign T58 = T42 & T59;
  assign T59 = T57 ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      time_ <= 8'h0;
    end else if(T7) begin
      time_ <= T6;
    end else if(T3) begin
      time_ <= 8'h0;
    end else if(io_reset) begin
      time_ <= 8'h0;
    end
  end
endmodule

module Mapper(input clk, input reset,
    input [23:0] io_pixel_in,
    input [7:0] io_kernel_in,
    output[7:0] io_red_out,
    output[7:0] io_green_out,
    output[7:0] io_blue_out,
    output[7:0] io_kernel_out
);

  wire[7:0] T11;
  wire[24:0] T0;
  wire[24:0] T1;
  reg [23:0] kernel;
  wire[23:0] T12;
  wire[15:0] T13;
  wire T14;
  wire[7:0] T15;
  wire[8:0] T2;
  wire[8:0] T3;
  reg [7:0] blue;
  wire[7:0] T16;
  wire[7:0] T4;
  wire[7:0] T17;
  wire[8:0] T5;
  wire[8:0] T6;
  reg [7:0] green;
  wire[7:0] T18;
  wire[7:0] T7;
  wire[7:0] T19;
  wire[8:0] T8;
  wire[8:0] T9;
  reg [7:0] red;
  wire[7:0] T20;
  wire[7:0] T10;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    kernel = {1{$random}};
    blue = {1{$random}};
    green = {1{$random}};
    red = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_kernel_out = T11;
  assign T11 = T0[3'h7:1'h0];
  assign T0 = T1;
  assign T1 = {1'h0, kernel};
  assign T12 = {T13, io_kernel_in};
  assign T13 = T14 ? 16'hffff : 16'h0;
  assign T14 = io_kernel_in[3'h7:3'h7];
  assign io_blue_out = T15;
  assign T15 = T2[3'h7:1'h0];
  assign T2 = T3;
  assign T3 = {1'h0, blue};
  assign T16 = reset ? 8'h0 : T4;
  assign T4 = io_pixel_in[5'h17:5'h10];
  assign io_green_out = T17;
  assign T17 = T5[3'h7:1'h0];
  assign T5 = T6;
  assign T6 = {1'h0, green};
  assign T18 = reset ? 8'h0 : T7;
  assign T7 = io_pixel_in[4'hf:4'h8];
  assign io_red_out = T19;
  assign T19 = T8[3'h7:1'h0];
  assign T8 = T9;
  assign T9 = {1'h0, red};
  assign T20 = reset ? 8'h0 : T10;
  assign T10 = io_pixel_in[3'h7:1'h0];

  always @(posedge clk) begin
    kernel <= T12;
    if(reset) begin
      blue <= 8'h0;
    end else begin
      blue <= T4;
    end
    if(reset) begin
      green <= 8'h0;
    end else begin
      green <= T7;
    end
    if(reset) begin
      red <= 8'h0;
    end else begin
      red <= T10;
    end
  end
endmodule

module ReductionUnit(input clk, input reset,
    input [7:0] io_red_in,
    input [7:0] io_green_in,
    input [7:0] io_blue_in,
    output[7:0] io_red_out,
    output[7:0] io_green_out,
    output[7:0] io_blue_out,
    input  io_flush
);

  reg [7:0] blue;
  wire[7:0] T10;
  wire[7:0] T0;
  wire[7:0] T1;
  wire[7:0] T2;
  wire T3;
  reg [7:0] green;
  wire[7:0] T11;
  wire[7:0] T4;
  wire[7:0] T5;
  wire[7:0] T6;
  reg [7:0] red;
  wire[7:0] T12;
  wire[7:0] T7;
  wire[7:0] T8;
  wire[7:0] T9;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    blue = {1{$random}};
    green = {1{$random}};
    red = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_blue_out = blue;
  assign T10 = reset ? 8'h0 : T0;
  assign T0 = T3 ? T2 : T1;
  assign T1 = io_flush ? io_blue_in : blue;
  assign T2 = io_blue_in + blue;
  assign T3 = io_flush ^ 1'h1;
  assign io_green_out = green;
  assign T11 = reset ? 8'h0 : T4;
  assign T4 = T3 ? T6 : T5;
  assign T5 = io_flush ? io_green_in : green;
  assign T6 = io_green_in + green;
  assign io_red_out = red;
  assign T12 = reset ? 8'h0 : T7;
  assign T7 = T3 ? T9 : T8;
  assign T8 = io_flush ? io_red_in : red;
  assign T9 = io_red_in + red;

  always @(posedge clk) begin
    if(reset) begin
      blue <= 8'h0;
    end else if(T3) begin
      blue <= T2;
    end else if(io_flush) begin
      blue <= io_blue_in;
    end
    if(reset) begin
      green <= 8'h0;
    end else if(T3) begin
      green <= T6;
    end else if(io_flush) begin
      green <= io_green_in;
    end
    if(reset) begin
      red <= 8'h0;
    end else if(T3) begin
      red <= T9;
    end else if(io_flush) begin
      red <= io_red_in;
    end
  end
endmodule

module ALUrow(input clk, input reset,
    input [23:0] io_pixel_in_2,
    input [23:0] io_pixel_in_1,
    input [23:0] io_pixel_in_0,
    input [7:0] io_kernel_in,
    input  io_accumulator_flush,
    input  io_selector_shift,
    output[23:0] io_data_out,
    output[7:0] io_kernel_out
);

  reg  shift_enablers_6;
  reg  shift_enablers_5;
  reg  shift_enablers_4;
  reg  shift_enablers_3;
  reg  shift_enablers_2;
  reg  shift_enablers_1;
  reg  shift_enablers_0;
  reg  flush_signals_6;
  reg  flush_signals_5;
  reg  flush_signals_4;
  reg  flush_signals_3;
  reg  flush_signals_2;
  reg  flush_signals_1;
  reg  flush_signals_0;
  wire[7:0] T196;
  wire[1:0] T0;
  wire[5:0] T197;
  wire T198;
  wire[7:0] T199;
  wire[1:0] T1;
  wire[5:0] T200;
  wire T201;
  wire[7:0] T202;
  wire[1:0] T2;
  wire[5:0] T203;
  wire T204;
  wire[7:0] T205;
  wire[1:0] T3;
  wire[5:0] T206;
  wire T207;
  wire[7:0] T208;
  wire[1:0] T4;
  wire[5:0] T209;
  wire T210;
  wire[7:0] T211;
  wire[1:0] T5;
  wire[5:0] T212;
  wire T213;
  wire[7:0] T214;
  wire[1:0] T6;
  wire[5:0] T215;
  wire T216;
  wire[23:0] T7;
  wire[23:0] T8;
  wire[23:0] T9;
  wire[23:0] T10;
  wire[23:0] T11;
  wire[23:0] T12;
  wire[23:0] T13;
  wire[23:0] T14;
  wire[23:0] T15;
  wire[23:0] T16;
  wire[23:0] T17;
  wire[23:0] T18;
  wire[23:0] T19;
  wire[23:0] T20;
  wire[23:0] T21;
  wire[23:0] T22;
  wire[23:0] T23;
  wire[23:0] T24;
  wire[23:0] T25;
  wire[23:0] T26;
  wire[23:0] T27;
  wire[23:0] T28;
  wire[23:0] T29;
  wire[7:0] T30;
  wire[23:0] T31;
  wire[23:0] T32;
  wire[23:0] T33;
  wire[23:0] T34;
  wire[23:0] T35;
  wire[23:0] T217;
  wire[15:0] T36;
  wire[7:0] T37;
  wire[7:0] T218;
  wire T219;
  wire[23:0] T38;
  wire[23:0] T39;
  wire[23:0] T40;
  wire[23:0] T41;
  wire[23:0] T42;
  wire[23:0] T220;
  wire[7:0] T43;
  wire[7:0] T44;
  wire[15:0] T221;
  wire T222;
  wire[23:0] T45;
  wire[23:0] T46;
  wire[23:0] T47;
  wire[23:0] T48;
  wire[23:0] T49;
  wire[23:0] T223;
  wire[7:0] T50;
  wire[7:0] T51;
  wire[15:0] T224;
  wire T225;
  wire[23:0] T52;
  wire[23:0] T53;
  wire[23:0] T54;
  wire[23:0] T55;
  wire[23:0] T56;
  wire[23:0] T226;
  wire[15:0] T57;
  wire[7:0] T58;
  wire[7:0] T227;
  wire T228;
  wire[23:0] T59;
  wire[23:0] T60;
  wire[23:0] T61;
  wire[23:0] T62;
  wire[23:0] T63;
  wire[23:0] T64;
  wire[7:0] T65;
  wire[23:0] T66;
  wire[23:0] T67;
  wire[23:0] T68;
  wire[23:0] T69;
  wire[23:0] T70;
  wire[23:0] T229;
  wire[7:0] T71;
  wire[7:0] T72;
  wire[15:0] T230;
  wire T231;
  wire[23:0] T73;
  wire[23:0] T74;
  wire[23:0] T75;
  wire[23:0] T76;
  wire[23:0] T77;
  wire[23:0] T232;
  wire[15:0] T78;
  wire[7:0] T79;
  wire[7:0] T233;
  wire T234;
  wire[23:0] T80;
  wire[23:0] T81;
  wire[23:0] T82;
  wire[23:0] T83;
  wire[23:0] T84;
  wire[23:0] T85;
  wire[7:0] T86;
  wire[23:0] T87;
  wire[23:0] T88;
  wire[23:0] T89;
  wire[23:0] T90;
  wire[23:0] T91;
  wire[23:0] T235;
  wire[7:0] T92;
  wire[7:0] T93;
  wire[15:0] T236;
  wire T237;
  wire[23:0] T94;
  wire[23:0] T95;
  wire[23:0] T96;
  wire[23:0] T97;
  wire[23:0] T98;
  wire[23:0] T238;
  wire[15:0] T99;
  wire[7:0] T100;
  wire[7:0] T239;
  wire T240;
  wire[23:0] T101;
  wire[23:0] T102;
  wire[23:0] T103;
  wire[23:0] T104;
  wire[23:0] T105;
  wire[23:0] T106;
  wire[7:0] T107;
  wire[23:0] T108;
  wire[23:0] T109;
  wire[23:0] T110;
  wire[23:0] T111;
  wire[23:0] T112;
  wire[23:0] T241;
  wire[7:0] T113;
  wire[7:0] T114;
  wire[15:0] T242;
  wire T243;
  wire[23:0] T115;
  wire[23:0] T116;
  wire[23:0] T117;
  wire[23:0] T118;
  wire[23:0] T119;
  wire[23:0] T244;
  wire[15:0] T120;
  wire[7:0] T121;
  wire[7:0] T245;
  wire T246;
  wire[23:0] T122;
  wire[23:0] T123;
  wire[23:0] T124;
  wire[23:0] T125;
  wire[23:0] T126;
  wire[23:0] T127;
  wire[7:0] T128;
  wire[23:0] T129;
  wire[23:0] T130;
  wire[23:0] T131;
  wire[23:0] T132;
  wire[23:0] T133;
  wire[23:0] T247;
  wire[7:0] T134;
  wire[7:0] T135;
  wire[15:0] T248;
  wire T249;
  wire[23:0] T136;
  wire[23:0] T137;
  wire[23:0] T138;
  wire[23:0] T139;
  wire[23:0] T140;
  wire[23:0] T250;
  wire[15:0] T141;
  wire[7:0] T142;
  wire[7:0] T251;
  wire T252;
  wire[23:0] T143;
  wire[23:0] T144;
  wire[23:0] T145;
  wire[23:0] T146;
  wire[23:0] T147;
  wire[23:0] T148;
  wire[7:0] T149;
  wire[23:0] T150;
  wire[23:0] T151;
  wire[23:0] T152;
  wire[23:0] T153;
  wire[23:0] T154;
  wire[23:0] T253;
  wire[7:0] T155;
  wire[7:0] T156;
  wire[15:0] T254;
  wire T255;
  wire[23:0] T157;
  wire[23:0] T158;
  wire[23:0] T159;
  wire[23:0] T160;
  wire[23:0] T161;
  wire[23:0] T256;
  wire[15:0] T162;
  wire[7:0] T163;
  wire[7:0] T257;
  wire T258;
  wire[23:0] T164;
  wire[23:0] T165;
  wire[23:0] T166;
  wire[23:0] T167;
  wire[23:0] T168;
  wire[23:0] T169;
  wire[7:0] T170;
  wire[23:0] T171;
  wire[23:0] T172;
  wire[23:0] T173;
  wire[23:0] T174;
  wire[23:0] T175;
  wire[23:0] T259;
  wire[7:0] T176;
  wire[7:0] T177;
  wire[15:0] T260;
  wire T261;
  wire[23:0] T178;
  wire[23:0] T179;
  wire[23:0] T180;
  wire[23:0] T181;
  wire[23:0] T182;
  wire[23:0] T262;
  wire[15:0] T183;
  wire[7:0] T184;
  wire[7:0] T263;
  wire T264;
  wire[23:0] T185;
  wire[23:0] T186;
  wire[23:0] T187;
  wire[23:0] T188;
  wire[23:0] T189;
  wire[23:0] T190;
  wire[7:0] T191;
  wire[23:0] T192;
  wire[23:0] T193;
  wire[23:0] T194;
  wire[23:0] T195;
  wire[7:0] Mapper_io_red_out;
  wire[7:0] Mapper_io_green_out;
  wire[7:0] Mapper_io_blue_out;
  wire[7:0] Mapper_1_io_red_out;
  wire[7:0] Mapper_1_io_green_out;
  wire[7:0] Mapper_1_io_blue_out;
  wire[7:0] Mapper_2_io_red_out;
  wire[7:0] Mapper_2_io_green_out;
  wire[7:0] Mapper_2_io_blue_out;
  wire[7:0] Mapper_3_io_red_out;
  wire[7:0] Mapper_3_io_green_out;
  wire[7:0] Mapper_3_io_blue_out;
  wire[7:0] Mapper_4_io_red_out;
  wire[7:0] Mapper_4_io_green_out;
  wire[7:0] Mapper_4_io_blue_out;
  wire[7:0] Mapper_5_io_red_out;
  wire[7:0] Mapper_5_io_green_out;
  wire[7:0] Mapper_5_io_blue_out;
  wire[7:0] Mapper_6_io_red_out;
  wire[7:0] Mapper_6_io_green_out;
  wire[7:0] Mapper_6_io_blue_out;
  wire[7:0] Mapper_6_io_kernel_out;
  wire[7:0] ReductionUnit_io_red_out;
  wire[7:0] ReductionUnit_io_green_out;
  wire[7:0] ReductionUnit_io_blue_out;
  wire[7:0] ReductionUnit_1_io_red_out;
  wire[7:0] ReductionUnit_1_io_green_out;
  wire[7:0] ReductionUnit_1_io_blue_out;
  wire[7:0] ReductionUnit_2_io_red_out;
  wire[7:0] ReductionUnit_2_io_green_out;
  wire[7:0] ReductionUnit_2_io_blue_out;
  wire[7:0] ReductionUnit_3_io_red_out;
  wire[7:0] ReductionUnit_3_io_green_out;
  wire[7:0] ReductionUnit_3_io_blue_out;
  wire[7:0] ReductionUnit_4_io_red_out;
  wire[7:0] ReductionUnit_4_io_green_out;
  wire[7:0] ReductionUnit_4_io_blue_out;
  wire[7:0] ReductionUnit_5_io_red_out;
  wire[7:0] ReductionUnit_5_io_green_out;
  wire[7:0] ReductionUnit_5_io_blue_out;
  wire[7:0] ReductionUnit_6_io_red_out;
  wire[7:0] ReductionUnit_6_io_green_out;
  wire[7:0] ReductionUnit_6_io_blue_out;
  wire[23:0] ShiftMux_io_data_out;
  wire[23:0] ShiftMux_1_io_data_out;
  wire[23:0] ShiftMux_2_io_data_out;
  wire[23:0] ShiftMux_3_io_data_out;
  wire[23:0] ShiftMux_4_io_data_out;
  wire[23:0] ShiftMux_5_io_data_out;
  wire[23:0] ShiftMux_6_io_data_out;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    shift_enablers_6 = {1{$random}};
    shift_enablers_5 = {1{$random}};
    shift_enablers_4 = {1{$random}};
    shift_enablers_3 = {1{$random}};
    shift_enablers_2 = {1{$random}};
    shift_enablers_1 = {1{$random}};
    shift_enablers_0 = {1{$random}};
    flush_signals_6 = {1{$random}};
    flush_signals_5 = {1{$random}};
    flush_signals_4 = {1{$random}};
    flush_signals_3 = {1{$random}};
    flush_signals_2 = {1{$random}};
    flush_signals_1 = {1{$random}};
    flush_signals_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T196 = {T197, T0};
  assign T0 = 2'h1;
  assign T197 = T198 ? 6'h3f : 6'h0;
  assign T198 = T0[1'h1:1'h1];
  assign T199 = {T200, T1};
  assign T1 = 2'h1;
  assign T200 = T201 ? 6'h3f : 6'h0;
  assign T201 = T1[1'h1:1'h1];
  assign T202 = {T203, T2};
  assign T2 = 2'h1;
  assign T203 = T204 ? 6'h3f : 6'h0;
  assign T204 = T2[1'h1:1'h1];
  assign T205 = {T206, T3};
  assign T3 = 2'h1;
  assign T206 = T207 ? 6'h3f : 6'h0;
  assign T207 = T3[1'h1:1'h1];
  assign T208 = {T209, T4};
  assign T4 = 2'h1;
  assign T209 = T210 ? 6'h3f : 6'h0;
  assign T210 = T4[1'h1:1'h1];
  assign T211 = {T212, T5};
  assign T5 = 2'h1;
  assign T212 = T213 ? 6'h3f : 6'h0;
  assign T213 = T5[1'h1:1'h1];
  assign T214 = {T215, T6};
  assign T6 = 2'h1;
  assign T215 = T216 ? 6'h3f : 6'h0;
  assign T216 = T6[1'h1:1'h1];
  assign io_kernel_out = Mapper_6_io_kernel_out;
  assign io_data_out = T7;
  assign T7 = flush_signals_6 ? T189 : T8;
  assign T8 = flush_signals_6 ? T182 : T9;
  assign T9 = flush_signals_6 ? T175 : T10;
  assign T10 = flush_signals_5 ? T168 : T11;
  assign T11 = flush_signals_5 ? T161 : T12;
  assign T12 = flush_signals_5 ? T154 : T13;
  assign T13 = flush_signals_4 ? T147 : T14;
  assign T14 = flush_signals_4 ? T140 : T15;
  assign T15 = flush_signals_4 ? T133 : T16;
  assign T16 = flush_signals_3 ? T126 : T17;
  assign T17 = flush_signals_3 ? T119 : T18;
  assign T18 = flush_signals_3 ? T112 : T19;
  assign T19 = flush_signals_2 ? T105 : T20;
  assign T20 = flush_signals_2 ? T98 : T21;
  assign T21 = flush_signals_2 ? T91 : T22;
  assign T22 = flush_signals_1 ? T84 : T23;
  assign T23 = flush_signals_1 ? T77 : T24;
  assign T24 = flush_signals_1 ? T70 : T25;
  assign T25 = flush_signals_0 ? T63 : T26;
  assign T26 = flush_signals_0 ? T56 : T27;
  assign T27 = flush_signals_0 ? T49 : T28;
  assign T28 = T31 | T29;
  assign T29 = T30 << 5'h10;
  assign T30 = ReductionUnit_io_blue_out & 8'hff;
  assign T31 = T35 & T32;
  assign T32 = ~ T33;
  assign T33 = 24'hff0000 | T34;
  assign T34 = io_data_out ^ io_data_out;
  assign T35 = T38 | T217;
  assign T217 = {T218, T36};
  assign T36 = T37 << 4'h8;
  assign T37 = ReductionUnit_io_green_out & 8'hff;
  assign T218 = T219 ? 8'hff : 8'h0;
  assign T219 = T36[4'hf:4'hf];
  assign T38 = T42 & T39;
  assign T39 = ~ T40;
  assign T40 = 24'hff00 | T41;
  assign T41 = io_data_out ^ io_data_out;
  assign T42 = T45 | T220;
  assign T220 = {T221, T43};
  assign T43 = T44 << 1'h0;
  assign T44 = ReductionUnit_io_red_out & 8'hff;
  assign T221 = T222 ? 16'hffff : 16'h0;
  assign T222 = T43[3'h7:3'h7];
  assign T45 = 24'h51615 & T46;
  assign T46 = ~ T47;
  assign T47 = 24'hff | T48;
  assign T48 = io_data_out ^ io_data_out;
  assign T49 = T52 | T223;
  assign T223 = {T224, T50};
  assign T50 = T51 << 1'h0;
  assign T51 = ReductionUnit_io_red_out & 8'hff;
  assign T224 = T225 ? 16'hffff : 16'h0;
  assign T225 = T50[3'h7:3'h7];
  assign T52 = T28 & T53;
  assign T53 = ~ T54;
  assign T54 = 24'hff | T55;
  assign T55 = io_data_out ^ io_data_out;
  assign T56 = T59 | T226;
  assign T226 = {T227, T57};
  assign T57 = T58 << 4'h8;
  assign T58 = ReductionUnit_io_green_out & 8'hff;
  assign T227 = T228 ? 8'hff : 8'h0;
  assign T228 = T57[4'hf:4'hf];
  assign T59 = T27 & T60;
  assign T60 = ~ T61;
  assign T61 = 24'hff00 | T62;
  assign T62 = io_data_out ^ io_data_out;
  assign T63 = T66 | T64;
  assign T64 = T65 << 5'h10;
  assign T65 = ReductionUnit_io_blue_out & 8'hff;
  assign T66 = T26 & T67;
  assign T67 = ~ T68;
  assign T68 = 24'hff0000 | T69;
  assign T69 = io_data_out ^ io_data_out;
  assign T70 = T73 | T229;
  assign T229 = {T230, T71};
  assign T71 = T72 << 1'h0;
  assign T72 = ReductionUnit_1_io_red_out & 8'hff;
  assign T230 = T231 ? 16'hffff : 16'h0;
  assign T231 = T71[3'h7:3'h7];
  assign T73 = T25 & T74;
  assign T74 = ~ T75;
  assign T75 = 24'hff | T76;
  assign T76 = io_data_out ^ io_data_out;
  assign T77 = T80 | T232;
  assign T232 = {T233, T78};
  assign T78 = T79 << 4'h8;
  assign T79 = ReductionUnit_1_io_green_out & 8'hff;
  assign T233 = T234 ? 8'hff : 8'h0;
  assign T234 = T78[4'hf:4'hf];
  assign T80 = T24 & T81;
  assign T81 = ~ T82;
  assign T82 = 24'hff00 | T83;
  assign T83 = io_data_out ^ io_data_out;
  assign T84 = T87 | T85;
  assign T85 = T86 << 5'h10;
  assign T86 = ReductionUnit_1_io_blue_out & 8'hff;
  assign T87 = T23 & T88;
  assign T88 = ~ T89;
  assign T89 = 24'hff0000 | T90;
  assign T90 = io_data_out ^ io_data_out;
  assign T91 = T94 | T235;
  assign T235 = {T236, T92};
  assign T92 = T93 << 1'h0;
  assign T93 = ReductionUnit_2_io_red_out & 8'hff;
  assign T236 = T237 ? 16'hffff : 16'h0;
  assign T237 = T92[3'h7:3'h7];
  assign T94 = T22 & T95;
  assign T95 = ~ T96;
  assign T96 = 24'hff | T97;
  assign T97 = io_data_out ^ io_data_out;
  assign T98 = T101 | T238;
  assign T238 = {T239, T99};
  assign T99 = T100 << 4'h8;
  assign T100 = ReductionUnit_2_io_green_out & 8'hff;
  assign T239 = T240 ? 8'hff : 8'h0;
  assign T240 = T99[4'hf:4'hf];
  assign T101 = T21 & T102;
  assign T102 = ~ T103;
  assign T103 = 24'hff00 | T104;
  assign T104 = io_data_out ^ io_data_out;
  assign T105 = T108 | T106;
  assign T106 = T107 << 5'h10;
  assign T107 = ReductionUnit_2_io_blue_out & 8'hff;
  assign T108 = T20 & T109;
  assign T109 = ~ T110;
  assign T110 = 24'hff0000 | T111;
  assign T111 = io_data_out ^ io_data_out;
  assign T112 = T115 | T241;
  assign T241 = {T242, T113};
  assign T113 = T114 << 1'h0;
  assign T114 = ReductionUnit_3_io_red_out & 8'hff;
  assign T242 = T243 ? 16'hffff : 16'h0;
  assign T243 = T113[3'h7:3'h7];
  assign T115 = T19 & T116;
  assign T116 = ~ T117;
  assign T117 = 24'hff | T118;
  assign T118 = io_data_out ^ io_data_out;
  assign T119 = T122 | T244;
  assign T244 = {T245, T120};
  assign T120 = T121 << 4'h8;
  assign T121 = ReductionUnit_3_io_green_out & 8'hff;
  assign T245 = T246 ? 8'hff : 8'h0;
  assign T246 = T120[4'hf:4'hf];
  assign T122 = T18 & T123;
  assign T123 = ~ T124;
  assign T124 = 24'hff00 | T125;
  assign T125 = io_data_out ^ io_data_out;
  assign T126 = T129 | T127;
  assign T127 = T128 << 5'h10;
  assign T128 = ReductionUnit_3_io_blue_out & 8'hff;
  assign T129 = T17 & T130;
  assign T130 = ~ T131;
  assign T131 = 24'hff0000 | T132;
  assign T132 = io_data_out ^ io_data_out;
  assign T133 = T136 | T247;
  assign T247 = {T248, T134};
  assign T134 = T135 << 1'h0;
  assign T135 = ReductionUnit_4_io_red_out & 8'hff;
  assign T248 = T249 ? 16'hffff : 16'h0;
  assign T249 = T134[3'h7:3'h7];
  assign T136 = T16 & T137;
  assign T137 = ~ T138;
  assign T138 = 24'hff | T139;
  assign T139 = io_data_out ^ io_data_out;
  assign T140 = T143 | T250;
  assign T250 = {T251, T141};
  assign T141 = T142 << 4'h8;
  assign T142 = ReductionUnit_4_io_green_out & 8'hff;
  assign T251 = T252 ? 8'hff : 8'h0;
  assign T252 = T141[4'hf:4'hf];
  assign T143 = T15 & T144;
  assign T144 = ~ T145;
  assign T145 = 24'hff00 | T146;
  assign T146 = io_data_out ^ io_data_out;
  assign T147 = T150 | T148;
  assign T148 = T149 << 5'h10;
  assign T149 = ReductionUnit_4_io_blue_out & 8'hff;
  assign T150 = T14 & T151;
  assign T151 = ~ T152;
  assign T152 = 24'hff0000 | T153;
  assign T153 = io_data_out ^ io_data_out;
  assign T154 = T157 | T253;
  assign T253 = {T254, T155};
  assign T155 = T156 << 1'h0;
  assign T156 = ReductionUnit_5_io_red_out & 8'hff;
  assign T254 = T255 ? 16'hffff : 16'h0;
  assign T255 = T155[3'h7:3'h7];
  assign T157 = T13 & T158;
  assign T158 = ~ T159;
  assign T159 = 24'hff | T160;
  assign T160 = io_data_out ^ io_data_out;
  assign T161 = T164 | T256;
  assign T256 = {T257, T162};
  assign T162 = T163 << 4'h8;
  assign T163 = ReductionUnit_5_io_green_out & 8'hff;
  assign T257 = T258 ? 8'hff : 8'h0;
  assign T258 = T162[4'hf:4'hf];
  assign T164 = T12 & T165;
  assign T165 = ~ T166;
  assign T166 = 24'hff00 | T167;
  assign T167 = io_data_out ^ io_data_out;
  assign T168 = T171 | T169;
  assign T169 = T170 << 5'h10;
  assign T170 = ReductionUnit_5_io_blue_out & 8'hff;
  assign T171 = T11 & T172;
  assign T172 = ~ T173;
  assign T173 = 24'hff0000 | T174;
  assign T174 = io_data_out ^ io_data_out;
  assign T175 = T178 | T259;
  assign T259 = {T260, T176};
  assign T176 = T177 << 1'h0;
  assign T177 = ReductionUnit_6_io_red_out & 8'hff;
  assign T260 = T261 ? 16'hffff : 16'h0;
  assign T261 = T176[3'h7:3'h7];
  assign T178 = T10 & T179;
  assign T179 = ~ T180;
  assign T180 = 24'hff | T181;
  assign T181 = io_data_out ^ io_data_out;
  assign T182 = T185 | T262;
  assign T262 = {T263, T183};
  assign T183 = T184 << 4'h8;
  assign T184 = ReductionUnit_6_io_green_out & 8'hff;
  assign T263 = T264 ? 8'hff : 8'h0;
  assign T264 = T183[4'hf:4'hf];
  assign T185 = T9 & T186;
  assign T186 = ~ T187;
  assign T187 = 24'hff00 | T188;
  assign T188 = io_data_out ^ io_data_out;
  assign T189 = T192 | T190;
  assign T190 = T191 << 5'h10;
  assign T191 = ReductionUnit_6_io_blue_out & 8'hff;
  assign T192 = T8 & T193;
  assign T193 = ~ T194;
  assign T194 = 24'hff0000 | T195;
  assign T195 = io_data_out ^ io_data_out;
  Mapper Mapper(.clk(clk), .reset(reset),
       .io_pixel_in( ShiftMux_io_data_out ),
       .io_kernel_in( T214 ),
       .io_red_out( Mapper_io_red_out ),
       .io_green_out( Mapper_io_green_out ),
       .io_blue_out( Mapper_io_blue_out )
       //.io_kernel_out(  )
  );
  Mapper Mapper_1(.clk(clk), .reset(reset),
       .io_pixel_in( ShiftMux_1_io_data_out ),
       .io_kernel_in( T211 ),
       .io_red_out( Mapper_1_io_red_out ),
       .io_green_out( Mapper_1_io_green_out ),
       .io_blue_out( Mapper_1_io_blue_out )
       //.io_kernel_out(  )
  );
  Mapper Mapper_2(.clk(clk), .reset(reset),
       .io_pixel_in( ShiftMux_2_io_data_out ),
       .io_kernel_in( T208 ),
       .io_red_out( Mapper_2_io_red_out ),
       .io_green_out( Mapper_2_io_green_out ),
       .io_blue_out( Mapper_2_io_blue_out )
       //.io_kernel_out(  )
  );
  Mapper Mapper_3(.clk(clk), .reset(reset),
       .io_pixel_in( ShiftMux_3_io_data_out ),
       .io_kernel_in( T205 ),
       .io_red_out( Mapper_3_io_red_out ),
       .io_green_out( Mapper_3_io_green_out ),
       .io_blue_out( Mapper_3_io_blue_out )
       //.io_kernel_out(  )
  );
  Mapper Mapper_4(.clk(clk), .reset(reset),
       .io_pixel_in( ShiftMux_4_io_data_out ),
       .io_kernel_in( T202 ),
       .io_red_out( Mapper_4_io_red_out ),
       .io_green_out( Mapper_4_io_green_out ),
       .io_blue_out( Mapper_4_io_blue_out )
       //.io_kernel_out(  )
  );
  Mapper Mapper_5(.clk(clk), .reset(reset),
       .io_pixel_in( ShiftMux_5_io_data_out ),
       .io_kernel_in( T199 ),
       .io_red_out( Mapper_5_io_red_out ),
       .io_green_out( Mapper_5_io_green_out ),
       .io_blue_out( Mapper_5_io_blue_out )
       //.io_kernel_out(  )
  );
  Mapper Mapper_6(.clk(clk), .reset(reset),
       .io_pixel_in( ShiftMux_6_io_data_out ),
       .io_kernel_in( T196 ),
       .io_red_out( Mapper_6_io_red_out ),
       .io_green_out( Mapper_6_io_green_out ),
       .io_blue_out( Mapper_6_io_blue_out ),
       .io_kernel_out( Mapper_6_io_kernel_out )
  );
  ReductionUnit ReductionUnit(.clk(clk), .reset(reset),
       .io_red_in( Mapper_io_red_out ),
       .io_green_in( Mapper_io_green_out ),
       .io_blue_in( Mapper_io_blue_out ),
       .io_red_out( ReductionUnit_io_red_out ),
       .io_green_out( ReductionUnit_io_green_out ),
       .io_blue_out( ReductionUnit_io_blue_out ),
       .io_flush( flush_signals_0 )
  );
  ReductionUnit ReductionUnit_1(.clk(clk), .reset(reset),
       .io_red_in( Mapper_1_io_red_out ),
       .io_green_in( Mapper_1_io_green_out ),
       .io_blue_in( Mapper_1_io_blue_out ),
       .io_red_out( ReductionUnit_1_io_red_out ),
       .io_green_out( ReductionUnit_1_io_green_out ),
       .io_blue_out( ReductionUnit_1_io_blue_out ),
       .io_flush( flush_signals_1 )
  );
  ReductionUnit ReductionUnit_2(.clk(clk), .reset(reset),
       .io_red_in( Mapper_2_io_red_out ),
       .io_green_in( Mapper_2_io_green_out ),
       .io_blue_in( Mapper_2_io_blue_out ),
       .io_red_out( ReductionUnit_2_io_red_out ),
       .io_green_out( ReductionUnit_2_io_green_out ),
       .io_blue_out( ReductionUnit_2_io_blue_out ),
       .io_flush( flush_signals_2 )
  );
  ReductionUnit ReductionUnit_3(.clk(clk), .reset(reset),
       .io_red_in( Mapper_3_io_red_out ),
       .io_green_in( Mapper_3_io_green_out ),
       .io_blue_in( Mapper_3_io_blue_out ),
       .io_red_out( ReductionUnit_3_io_red_out ),
       .io_green_out( ReductionUnit_3_io_green_out ),
       .io_blue_out( ReductionUnit_3_io_blue_out ),
       .io_flush( flush_signals_3 )
  );
  ReductionUnit ReductionUnit_4(.clk(clk), .reset(reset),
       .io_red_in( Mapper_4_io_red_out ),
       .io_green_in( Mapper_4_io_green_out ),
       .io_blue_in( Mapper_4_io_blue_out ),
       .io_red_out( ReductionUnit_4_io_red_out ),
       .io_green_out( ReductionUnit_4_io_green_out ),
       .io_blue_out( ReductionUnit_4_io_blue_out ),
       .io_flush( flush_signals_4 )
  );
  ReductionUnit ReductionUnit_5(.clk(clk), .reset(reset),
       .io_red_in( Mapper_5_io_red_out ),
       .io_green_in( Mapper_5_io_green_out ),
       .io_blue_in( Mapper_5_io_blue_out ),
       .io_red_out( ReductionUnit_5_io_red_out ),
       .io_green_out( ReductionUnit_5_io_green_out ),
       .io_blue_out( ReductionUnit_5_io_blue_out ),
       .io_flush( flush_signals_5 )
  );
  ReductionUnit ReductionUnit_6(.clk(clk), .reset(reset),
       .io_red_in( Mapper_6_io_red_out ),
       .io_green_in( Mapper_6_io_green_out ),
       .io_blue_in( Mapper_6_io_blue_out ),
       .io_red_out( ReductionUnit_6_io_red_out ),
       .io_green_out( ReductionUnit_6_io_green_out ),
       .io_blue_out( ReductionUnit_6_io_blue_out ),
       .io_flush( flush_signals_6 )
  );
  ShiftMux_2 ShiftMux(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_0 ),
       //.io_stall(  )
       //.io_reset(  )
       .io_data_out( ShiftMux_io_data_out )
       //.io_dbg_state(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign ShiftMux.io_stall = {1{$random}};
    assign ShiftMux.io_reset = {1{$random}};
// synthesis translate_on
`endif
  ShiftMux_2 ShiftMux_1(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_1 ),
       //.io_stall(  )
       //.io_reset(  )
       .io_data_out( ShiftMux_1_io_data_out )
       //.io_dbg_state(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign ShiftMux_1.io_stall = {1{$random}};
    assign ShiftMux_1.io_reset = {1{$random}};
// synthesis translate_on
`endif
  ShiftMux_2 ShiftMux_2(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_2 ),
       //.io_stall(  )
       //.io_reset(  )
       .io_data_out( ShiftMux_2_io_data_out )
       //.io_dbg_state(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign ShiftMux_2.io_stall = {1{$random}};
    assign ShiftMux_2.io_reset = {1{$random}};
// synthesis translate_on
`endif
  ShiftMux_2 ShiftMux_3(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_3 ),
       //.io_stall(  )
       //.io_reset(  )
       .io_data_out( ShiftMux_3_io_data_out )
       //.io_dbg_state(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign ShiftMux_3.io_stall = {1{$random}};
    assign ShiftMux_3.io_reset = {1{$random}};
// synthesis translate_on
`endif
  ShiftMux_2 ShiftMux_4(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_4 ),
       //.io_stall(  )
       //.io_reset(  )
       .io_data_out( ShiftMux_4_io_data_out )
       //.io_dbg_state(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign ShiftMux_4.io_stall = {1{$random}};
    assign ShiftMux_4.io_reset = {1{$random}};
// synthesis translate_on
`endif
  ShiftMux_2 ShiftMux_5(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_5 ),
       //.io_stall(  )
       //.io_reset(  )
       .io_data_out( ShiftMux_5_io_data_out )
       //.io_dbg_state(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign ShiftMux_5.io_stall = {1{$random}};
    assign ShiftMux_5.io_reset = {1{$random}};
// synthesis translate_on
`endif
  ShiftMux_2 ShiftMux_6(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_6 ),
       //.io_stall(  )
       //.io_reset(  )
       .io_data_out( ShiftMux_6_io_data_out )
       //.io_dbg_state(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign ShiftMux_6.io_stall = {1{$random}};
    assign ShiftMux_6.io_reset = {1{$random}};
// synthesis translate_on
`endif

  always @(posedge clk) begin
    shift_enablers_6 <= shift_enablers_5;
    shift_enablers_5 <= shift_enablers_4;
    shift_enablers_4 <= shift_enablers_3;
    shift_enablers_3 <= shift_enablers_2;
    shift_enablers_2 <= shift_enablers_1;
    shift_enablers_1 <= shift_enablers_0;
    shift_enablers_0 <= io_selector_shift;
    flush_signals_6 <= flush_signals_5;
    flush_signals_5 <= flush_signals_4;
    flush_signals_4 <= flush_signals_3;
    flush_signals_3 <= flush_signals_2;
    flush_signals_2 <= flush_signals_1;
    flush_signals_1 <= flush_signals_0;
    flush_signals_0 <= io_accumulator_flush;
  end
endmodule

module Processor(input clk, input reset,
    input [23:0] io_pixel_in,
    output[23:0] io_ALU_data_out
);

  wire[7:0] T1;
  wire[1:0] T0;
  wire[5:0] T2;
  wire T3;
  wire data_control_io_read_row_2;
  wire data_control_io_read_row_1;
  wire data_control_io_read_row_0;
  wire data_control_io_mux_row_2;
  wire data_control_io_mux_row_1;
  wire data_control_io_mux_row_0;
  wire data_control_io_shift_mux;
  wire data_control_io_accumulator_flush;
  wire data_control_io_ALU_shift;
  wire[23:0] ALUs_io_data_out;
  wire[23:0] conveyor_io_data_out_2;
  wire[23:0] conveyor_io_data_out_1;
  wire[23:0] conveyor_io_data_out_0;


  assign T1 = {T2, T0};
  assign T0 = 2'h1;
  assign T2 = T3 ? 6'h3f : 6'h0;
  assign T3 = T0[1'h1:1'h1];
  assign io_ALU_data_out = ALUs_io_data_out;
  PixelGrid conveyor(.clk(clk), .reset(reset),
       .io_pixel_in( io_pixel_in ),
       .io_read_row_2( data_control_io_read_row_2 ),
       .io_read_row_1( data_control_io_read_row_1 ),
       .io_read_row_0( data_control_io_read_row_0 ),
       .io_mux_row_2( data_control_io_mux_row_2 ),
       .io_mux_row_1( data_control_io_mux_row_1 ),
       .io_mux_row_0( data_control_io_mux_row_0 ),
       .io_shift_mux( data_control_io_shift_mux ),
       //.io_reset(  )
       .io_stall( 1'h0 ),
       .io_data_out_2( conveyor_io_data_out_2 ),
       .io_data_out_1( conveyor_io_data_out_1 ),
       .io_data_out_0( conveyor_io_data_out_0 )
  );
  Orchestrator data_control(.clk(clk), .reset(reset),
       .io_reset( 1'h0 ),
       .io_read_row_2( data_control_io_read_row_2 ),
       .io_read_row_1( data_control_io_read_row_1 ),
       .io_read_row_0( data_control_io_read_row_0 ),
       .io_mux_row_2( data_control_io_mux_row_2 ),
       .io_mux_row_1( data_control_io_mux_row_1 ),
       .io_mux_row_0( data_control_io_mux_row_0 ),
       .io_shift_mux( data_control_io_shift_mux ),
       .io_accumulator_flush( data_control_io_accumulator_flush ),
       .io_ALU_shift( data_control_io_ALU_shift )
       //.io_dbg_counter(  )
  );
  ALUrow ALUs(.clk(clk), .reset(reset),
       .io_pixel_in_2( conveyor_io_data_out_0 ),
       .io_pixel_in_1( conveyor_io_data_out_1 ),
       .io_pixel_in_0( conveyor_io_data_out_2 ),
       .io_kernel_in( T1 ),
       .io_accumulator_flush( data_control_io_accumulator_flush ),
       .io_selector_shift( data_control_io_ALU_shift ),
       .io_data_out( ALUs_io_data_out )
       //.io_kernel_out(  )
  );
endmodule

module Tile(input clk, input reset,
    input [23:0] io_hdmi_data_in,
    output[23:0] io_data_out
);

  wire[23:0] Processor_io_ALU_data_out;


  assign io_data_out = Processor_io_ALU_data_out;
  Processor Processor(.clk(clk), .reset(reset),
       .io_pixel_in( io_hdmi_data_in ),
       .io_ALU_data_out( Processor_io_ALU_data_out )
  );
endmodule

