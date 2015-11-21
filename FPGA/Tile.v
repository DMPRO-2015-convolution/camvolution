module RowBuffer(input clk, input reset,
    input  io_reset,
    input [23:0] io_data_in,
    input  io_push,
    input  io_pop,
    output[23:0] io_data_out
);

  wire T0;
  wire T1;
  reg [9:0] stack_top;
  wire[9:0] T10;
  wire[9:0] T2;
  wire[9:0] T3;
  wire[9:0] T4;
  wire[9:0] T5;
  wire T6;
  wire T7;
  wire[9:0] T8;
  wire[9:0] T9;
  wire[23:0] DualPortBRAM_b_dout;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    stack_top = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = io_push & T1;
  assign T1 = stack_top < 10'h280;
  assign T10 = reset ? 10'h0 : T2;
  assign T2 = T0 ? T8 : T3;
  assign T3 = T6 ? T5 : T4;
  assign T4 = io_reset ? 10'h0 : stack_top;
  assign T5 = stack_top - 10'h1;
  assign T6 = io_pop & T7;
  assign T7 = 10'h0 <= stack_top;
  assign T8 = stack_top + 10'h1;
  assign T9 = stack_top - 10'h1;
  assign io_data_out = DualPortBRAM_b_dout;
  DualPortBRAM # (
    .DATA(24),
    .ADDR(10)
  ) DualPortBRAM(.clk(clk),
       .b_addr( T9 ),
       .b_din( 24'h0 ),
       .b_wr( 1'h0 ),
       .b_dout( DualPortBRAM_b_dout ),
       .a_addr( stack_top ),
       .a_din( io_data_in ),
       .a_wr( T0 )
       //.a_dout(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      stack_top <= 10'h0;
    end else if(T0) begin
      stack_top <= T8;
    end else if(T6) begin
      stack_top <= T5;
    end else if(io_reset) begin
      stack_top <= 10'h0;
    end
  end
endmodule

module SliceBuffer(input clk, input reset,
    input  io_reset,
    input [23:0] io_data_in,
    input  io_push,
    input  io_pop,
    output[23:0] io_data_out
);

  wire T0;
  wire T1;
  reg [31:0] pop_row;
  wire[31:0] T80;
  wire[31:0] T2;
  wire[31:0] T3;
  wire[31:0] T4;
  wire[31:0] T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  reg [31:0] push_row;
  wire[31:0] T81;
  wire[31:0] T12;
  wire[31:0] T13;
  wire[31:0] T14;
  wire[31:0] T15;
  wire T16;
  wire T17;
  wire T18;
  reg [31:0] push_top;
  wire[31:0] T82;
  wire[31:0] T19;
  wire[31:0] T20;
  wire[31:0] T21;
  wire[31:0] T22;
  wire T23;
  wire T24;
  wire[31:0] T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire[23:0] T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire[23:0] T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire[23:0] T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire[23:0] T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire[23:0] T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire[23:0] T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire[23:0] T60;
  wire T61;
  wire T62;
  wire T63;
  wire T64;
  wire[23:0] T65;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire[23:0] T70;
  wire[23:0] T71;
  wire[23:0] T72;
  wire[23:0] T73;
  wire[23:0] T74;
  wire[23:0] T75;
  wire[23:0] T76;
  wire[23:0] T77;
  wire[23:0] T78;
  wire[23:0] T79;
  wire[23:0] RowBuffer_io_data_out;
  wire[23:0] RowBuffer_1_io_data_out;
  wire[23:0] RowBuffer_2_io_data_out;
  wire[23:0] RowBuffer_3_io_data_out;
  wire[23:0] RowBuffer_4_io_data_out;
  wire[23:0] RowBuffer_5_io_data_out;
  wire[23:0] RowBuffer_6_io_data_out;
  wire[23:0] RowBuffer_7_io_data_out;
  wire[23:0] RowBuffer_8_io_data_out;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    pop_row = {1{$random}};
    push_row = {1{$random}};
    push_top = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = T1 ? io_pop : 1'h0;
  assign T1 = pop_row == 32'h8;
  assign T80 = reset ? 32'h0 : T2;
  assign T2 = T8 ? 32'h0 : T3;
  assign T3 = T6 ? T5 : T4;
  assign T4 = io_reset ? 32'h0 : pop_row;
  assign T5 = pop_row + 32'h1;
  assign T6 = io_pop & T7;
  assign T7 = pop_row < 32'h8;
  assign T8 = io_pop & T9;
  assign T9 = T7 ^ 1'h1;
  assign T10 = T11 ? io_push : 1'h0;
  assign T11 = push_row == 32'h8;
  assign T81 = reset ? 32'h0 : T12;
  assign T12 = T28 ? 32'h0 : T13;
  assign T13 = T16 ? T15 : T14;
  assign T14 = io_reset ? 32'h0 : push_row;
  assign T15 = push_row + 32'h1;
  assign T16 = T18 & T17;
  assign T17 = push_row < 32'h9;
  assign T18 = push_top == 32'h280;
  assign T82 = reset ? 32'h0 : T19;
  assign T19 = T26 ? T25 : T20;
  assign T20 = T23 ? 32'h0 : T21;
  assign T21 = T18 ? 32'h0 : T22;
  assign T22 = io_reset ? 32'h0 : push_top;
  assign T23 = io_push & T24;
  assign T24 = push_top == 32'h280;
  assign T25 = push_top + 32'h1;
  assign T26 = io_push & T27;
  assign T27 = T24 ^ 1'h1;
  assign T28 = T18 & T29;
  assign T29 = T17 ^ 1'h1;
  assign T30 = T11 ? io_data_in : 24'h0;
  assign T31 = T32 ? io_pop : 1'h0;
  assign T32 = pop_row == 32'h7;
  assign T33 = T34 ? io_push : 1'h0;
  assign T34 = push_row == 32'h7;
  assign T35 = T34 ? io_data_in : 24'h0;
  assign T36 = T37 ? io_pop : 1'h0;
  assign T37 = pop_row == 32'h6;
  assign T38 = T39 ? io_push : 1'h0;
  assign T39 = push_row == 32'h6;
  assign T40 = T39 ? io_data_in : 24'h0;
  assign T41 = T42 ? io_pop : 1'h0;
  assign T42 = pop_row == 32'h5;
  assign T43 = T44 ? io_push : 1'h0;
  assign T44 = push_row == 32'h5;
  assign T45 = T44 ? io_data_in : 24'h0;
  assign T46 = T47 ? io_pop : 1'h0;
  assign T47 = pop_row == 32'h4;
  assign T48 = T49 ? io_push : 1'h0;
  assign T49 = push_row == 32'h4;
  assign T50 = T49 ? io_data_in : 24'h0;
  assign T51 = T52 ? io_pop : 1'h0;
  assign T52 = pop_row == 32'h3;
  assign T53 = T54 ? io_push : 1'h0;
  assign T54 = push_row == 32'h3;
  assign T55 = T54 ? io_data_in : 24'h0;
  assign T56 = T57 ? io_pop : 1'h0;
  assign T57 = pop_row == 32'h2;
  assign T58 = T59 ? io_push : 1'h0;
  assign T59 = push_row == 32'h2;
  assign T60 = T59 ? io_data_in : 24'h0;
  assign T61 = T62 ? io_pop : 1'h0;
  assign T62 = pop_row == 32'h1;
  assign T63 = T64 ? io_push : 1'h0;
  assign T64 = push_row == 32'h1;
  assign T65 = T64 ? io_data_in : 24'h0;
  assign T66 = T67 ? io_pop : 1'h0;
  assign T67 = pop_row == 32'h0;
  assign T68 = T69 ? io_push : 1'h0;
  assign T69 = push_row == 32'h0;
  assign T70 = T69 ? io_data_in : 24'h0;
  assign io_data_out = T71;
  assign T71 = T1 ? RowBuffer_8_io_data_out : T72;
  assign T72 = T32 ? RowBuffer_7_io_data_out : T73;
  assign T73 = T37 ? RowBuffer_6_io_data_out : T74;
  assign T74 = T42 ? RowBuffer_5_io_data_out : T75;
  assign T75 = T47 ? RowBuffer_4_io_data_out : T76;
  assign T76 = T52 ? RowBuffer_3_io_data_out : T77;
  assign T77 = T57 ? RowBuffer_2_io_data_out : T78;
  assign T78 = T62 ? RowBuffer_1_io_data_out : T79;
  assign T79 = T67 ? RowBuffer_io_data_out : 24'hdead;
  RowBuffer RowBuffer(.clk(clk), .reset(reset),
       .io_reset( io_reset ),
       .io_data_in( T70 ),
       .io_push( T68 ),
       .io_pop( T66 ),
       .io_data_out( RowBuffer_io_data_out )
  );
  RowBuffer RowBuffer_1(.clk(clk), .reset(reset),
       .io_reset( io_reset ),
       .io_data_in( T65 ),
       .io_push( T63 ),
       .io_pop( T61 ),
       .io_data_out( RowBuffer_1_io_data_out )
  );
  RowBuffer RowBuffer_2(.clk(clk), .reset(reset),
       .io_reset( io_reset ),
       .io_data_in( T60 ),
       .io_push( T58 ),
       .io_pop( T56 ),
       .io_data_out( RowBuffer_2_io_data_out )
  );
  RowBuffer RowBuffer_3(.clk(clk), .reset(reset),
       .io_reset( io_reset ),
       .io_data_in( T55 ),
       .io_push( T53 ),
       .io_pop( T51 ),
       .io_data_out( RowBuffer_3_io_data_out )
  );
  RowBuffer RowBuffer_4(.clk(clk), .reset(reset),
       .io_reset( io_reset ),
       .io_data_in( T50 ),
       .io_push( T48 ),
       .io_pop( T46 ),
       .io_data_out( RowBuffer_4_io_data_out )
  );
  RowBuffer RowBuffer_5(.clk(clk), .reset(reset),
       .io_reset( io_reset ),
       .io_data_in( T45 ),
       .io_push( T43 ),
       .io_pop( T41 ),
       .io_data_out( RowBuffer_5_io_data_out )
  );
  RowBuffer RowBuffer_6(.clk(clk), .reset(reset),
       .io_reset( io_reset ),
       .io_data_in( T40 ),
       .io_push( T38 ),
       .io_pop( T36 ),
       .io_data_out( RowBuffer_6_io_data_out )
  );
  RowBuffer RowBuffer_7(.clk(clk), .reset(reset),
       .io_reset( io_reset ),
       .io_data_in( T35 ),
       .io_push( T33 ),
       .io_pop( T31 ),
       .io_data_out( RowBuffer_7_io_data_out )
  );
  RowBuffer RowBuffer_8(.clk(clk), .reset(reset),
       .io_reset( io_reset ),
       .io_data_in( T30 ),
       .io_push( T10 ),
       .io_pop( T0 ),
       .io_data_out( RowBuffer_8_io_data_out )
  );

  always @(posedge clk) begin
    if(reset) begin
      pop_row <= 32'h0;
    end else if(T8) begin
      pop_row <= 32'h0;
    end else if(T6) begin
      pop_row <= T5;
    end else if(io_reset) begin
      pop_row <= 32'h0;
    end
    if(reset) begin
      push_row <= 32'h0;
    end else if(T28) begin
      push_row <= 32'h0;
    end else if(T16) begin
      push_row <= T15;
    end else if(io_reset) begin
      push_row <= 32'h0;
    end
    if(reset) begin
      push_top <= 32'h0;
    end else if(T26) begin
      push_top <= T25;
    end else if(T23) begin
      push_top <= 32'h0;
    end else if(T18) begin
      push_top <= 32'h0;
    end else if(io_reset) begin
      push_top <= 32'h0;
    end
  end
endmodule

module SliceDoubleBuffer(input clk, input reset,
    input  io_reset,
    input [23:0] io_data_in,
    input  io_slave_read_input,
    input  io_slave_drive_output,
    output io_slave_can_read_input,
    output io_slave_can_drive_output,
    output[23:0] io_data_out,
    output io_error
);

  wire T0;
  wire T1;
  wire T2;
  reg  current;
  wire T45;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  reg  writes_finished;
  wire T46;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  reg [31:0] writes_performed;
  wire[31:0] T47;
  wire[31:0] T13;
  wire[31:0] T14;
  wire[31:0] T15;
  wire[31:0] T16;
  wire T17;
  wire T18;
  wire[31:0] T19;
  wire T20;
  wire T21;
  reg  reads_finished;
  wire T48;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  reg [31:0] reads_performed;
  wire[31:0] T49;
  wire[31:0] T27;
  wire[31:0] T28;
  wire[31:0] T29;
  wire[31:0] T30;
  wire[31:0] T31;
  wire T32;
  wire[31:0] T33;
  wire T34;
  wire T35;
  wire[23:0] T36;
  wire[23:0] T37;
  wire T38;
  wire T39;
  wire T40;
  wire[23:0] T41;
  wire[23:0] T42;
  wire T43;
  wire T44;
  wire[23:0] slice1_io_data_out;
  wire[23:0] slice2_io_data_out;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    current = {1{$random}};
    writes_finished = {1{$random}};
    writes_performed = {1{$random}};
    reads_finished = {1{$random}};
    reads_performed = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = io_slave_read_input & T1;
  assign T1 = T2 ^ 1'h1;
  assign T2 = current == 1'h0;
  assign T45 = reset ? 1'h0 : T3;
  assign T3 = T34 ? 1'h0 : T4;
  assign T4 = T5 ? 1'h1 : current;
  assign T5 = T7 & T6;
  assign T6 = current == 1'h0;
  assign T7 = reads_finished & writes_finished;
  assign T46 = reset ? 1'h1 : T8;
  assign T8 = T7 ? 1'h0 : T9;
  assign T9 = T12 ? 1'h1 : T10;
  assign T10 = io_reset ? 1'h1 : T11;
  assign T11 = io_reset ? 1'h0 : writes_finished;
  assign T12 = writes_performed == 32'h1680;
  assign T47 = reset ? 32'h0 : T13;
  assign T13 = T7 ? 32'h0 : T14;
  assign T14 = T20 ? T19 : T15;
  assign T15 = T17 ? T16 : writes_performed;
  assign T16 = writes_performed + 32'h1;
  assign T17 = io_slave_drive_output & T18;
  assign T18 = current == 1'h1;
  assign T19 = writes_performed + 32'h1;
  assign T20 = io_slave_drive_output & T21;
  assign T21 = T18 ^ 1'h1;
  assign T48 = reset ? 1'h0 : T22;
  assign T22 = T7 ? 1'h0 : T23;
  assign T23 = T25 ? 1'h1 : T24;
  assign T24 = io_reset ? 1'h0 : reads_finished;
  assign T25 = io_slave_read_input & T26;
  assign T26 = reads_performed == 32'h167f;
  assign T49 = reset ? 32'h0 : T27;
  assign T27 = T7 ? 32'h0 : T28;
  assign T28 = T0 ? T33 : T29;
  assign T29 = T32 ? T31 : T30;
  assign T30 = io_reset ? 32'h0 : reads_performed;
  assign T31 = reads_performed + 32'h1;
  assign T32 = io_slave_read_input & T2;
  assign T33 = reads_performed + 32'h1;
  assign T34 = T7 & T35;
  assign T35 = T6 ^ 1'h1;
  assign T36 = T0 ? io_data_in : 24'h0;
  assign T37 = T32 ? io_data_in : 24'h0;
  assign io_error = T38;
  assign T38 = T40 | T39;
  assign T39 = 32'h1680 < writes_performed;
  assign T40 = 32'h1680 < reads_performed;
  assign io_data_out = T41;
  assign T41 = T20 ? slice2_io_data_out : T42;
  assign T42 = T17 ? slice1_io_data_out : 24'h0;
  assign io_slave_can_drive_output = T43;
  assign T43 = writes_finished ^ 1'h1;
  assign io_slave_can_read_input = T44;
  assign T44 = reads_finished ^ 1'h1;
  SliceBuffer slice1(.clk(clk), .reset(io_reset),
       //.io_reset(  )
       .io_data_in( T37 ),
       .io_push( T32 ),
       .io_pop( T17 ),
       .io_data_out( slice1_io_data_out )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign slice1.io_reset = {1{$random}};
// synthesis translate_on
`endif
  SliceBuffer slice2(.clk(clk), .reset(io_reset),
       //.io_reset(  )
       .io_data_in( T36 ),
       .io_push( T0 ),
       .io_pop( 1'h0 ),
       .io_data_out( slice2_io_data_out )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign slice2.io_reset = {1{$random}};
// synthesis translate_on
`endif

  always @(posedge clk) begin
    if(reset) begin
      current <= 1'h0;
    end else if(T34) begin
      current <= 1'h0;
    end else if(T5) begin
      current <= 1'h1;
    end
    if(reset) begin
      writes_finished <= 1'h1;
    end else if(T7) begin
      writes_finished <= 1'h0;
    end else if(T12) begin
      writes_finished <= 1'h1;
    end else if(io_reset) begin
      writes_finished <= 1'h1;
    end else if(io_reset) begin
      writes_finished <= 1'h0;
    end
    if(reset) begin
      writes_performed <= 32'h0;
    end else if(T7) begin
      writes_performed <= 32'h0;
    end else if(T20) begin
      writes_performed <= T19;
    end else if(T17) begin
      writes_performed <= T16;
    end
    if(reset) begin
      reads_finished <= 1'h0;
    end else if(T7) begin
      reads_finished <= 1'h0;
    end else if(T25) begin
      reads_finished <= 1'h1;
    end else if(io_reset) begin
      reads_finished <= 1'h0;
    end
    if(reset) begin
      reads_performed <= 32'h0;
    end else if(T7) begin
      reads_performed <= 32'h0;
    end else if(T0) begin
      reads_performed <= T33;
    end else if(T32) begin
      reads_performed <= T31;
    end else if(io_reset) begin
      reads_performed <= 32'h0;
    end
  end
endmodule

module InputHandler(input clk, input reset,
    input  io_reset,
    input  io_data_mode,
    input  io_output_buffer_ready,
    input  io_input_ready,
    input [23:0] io_data_in,
    output[23:0] io_data_out,
    output io_data_ready
);

  wire T0;
  wire T1;
  wire T2;
  wire[23:0] T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire[23:0] T9;
  wire[23:0] T10;
  wire input_buffer_io_slave_can_drive_output;
  wire[23:0] input_buffer_io_data_out;


  assign T0 = io_data_mode & T1;
  assign T1 = input_buffer_io_slave_can_drive_output & io_output_buffer_ready;
  assign T2 = io_data_mode ? io_input_ready : 1'h0;
  assign T3 = T4 ? io_data_in : 24'hdead;
  assign T4 = io_data_mode & io_input_ready;
  assign io_data_ready = T5;
  assign T5 = T7 ? 1'h1 : T6;
  assign T6 = io_data_mode ? T0 : 1'h0;
  assign T7 = T8 & io_input_ready;
  assign T8 = io_data_mode ^ 1'h1;
  assign io_data_out = T9;
  assign T9 = T7 ? io_data_in : T10;
  assign T10 = T0 ? input_buffer_io_data_out : 24'hdead;
  SliceDoubleBuffer input_buffer(.clk(clk), .reset(io_reset),
       //.io_reset(  )
       .io_data_in( T3 ),
       .io_slave_read_input( T2 ),
       .io_slave_drive_output( T0 ),
       //.io_slave_can_read_input(  )
       .io_slave_can_drive_output( input_buffer_io_slave_can_drive_output ),
       .io_data_out( input_buffer_io_data_out )
       //.io_error(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign input_buffer.io_reset = {1{$random}};
// synthesis translate_on
`endif
endmodule

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

module KernelBuffer(input clk, input reset,
    input [7:0] io_kernel_in,
    input [23:0] io_data_in,
    input  io_stall,
    input  io_load_kernel,
    output[7:0] io_kernel_out,
    output[7:0] io_dbg_kernel0,
    output[7:0] io_dbg_kernel1
);

  wire[7:0] T16;
  reg [23:0] kernel_buffer_1;
  wire[23:0] T17;
  wire[23:0] T0;
  wire[23:0] T1;
  wire T2;
  wire T3;
  reg [23:0] kernel_buffer_0;
  wire[23:0] T18;
  wire[24:0] T19;
  wire[24:0] T4;
  wire[24:0] T5;
  wire[24:0] T20;
  wire[24:0] T6;
  wire[24:0] T7;
  wire[24:0] T21;
  wire[8:0] T8;
  wire[8:0] T9;
  wire[15:0] T22;
  wire T23;
  wire T10;
  wire T11;
  wire T12;
  wire[7:0] T24;
  wire[7:0] T25;
  wire[23:0] T13;
  wire[23:0] T14;
  wire[23:0] T15;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    kernel_buffer_1 = {1{$random}};
    kernel_buffer_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_kernel1 = T16;
  assign T16 = kernel_buffer_1[3'h7:1'h0];
  assign T17 = reset ? 24'h0 : T0;
  assign T0 = T10 ? kernel_buffer_0 : T1;
  assign T1 = T2 ? kernel_buffer_0 : kernel_buffer_1;
  assign T2 = io_load_kernel & T3;
  assign T3 = io_stall ^ 1'h1;
  assign T18 = T19[5'h17:1'h0];
  assign T19 = reset ? 25'h0 : T4;
  assign T4 = T10 ? T21 : T5;
  assign T5 = T2 ? T6 : T20;
  assign T20 = {1'h0, kernel_buffer_0};
  assign T6 = T7;
  assign T7 = {1'h0, io_data_in};
  assign T21 = {T22, T8};
  assign T8 = T9;
  assign T9 = {1'h0, io_kernel_in};
  assign T22 = T23 ? 16'hffff : 16'h0;
  assign T23 = T8[4'h8:4'h8];
  assign T10 = T12 & T11;
  assign T11 = io_stall ^ 1'h1;
  assign T12 = io_load_kernel ^ 1'h1;
  assign io_dbg_kernel0 = T24;
  assign T24 = kernel_buffer_0[3'h7:1'h0];
  assign io_kernel_out = T25;
  assign T25 = T13[3'h7:1'h0];
  assign T13 = T10 ? kernel_buffer_1 : T14;
  assign T14 = T10 ? kernel_buffer_1 : T15;
  assign T15 = T2 ? kernel_buffer_1 : 24'hdead;

  always @(posedge clk) begin
    if(reset) begin
      kernel_buffer_1 <= 24'h0;
    end else if(T10) begin
      kernel_buffer_1 <= kernel_buffer_0;
    end else if(T2) begin
      kernel_buffer_1 <= kernel_buffer_0;
    end
    kernel_buffer_0 <= T18;
  end
endmodule

module Mapper(input clk, input reset,
    input  io_load_instruction,
    input [23:0] io_pixel_in,
    input [7:0] io_kernel_in,
    input  io_stall,
    output[7:0] io_red_out,
    output[7:0] io_green_out,
    output[7:0] io_blue_out,
    output[7:0] io_kernel_out,
    output[7:0] io_dbg_kernel,
    output[3:0] io_dbg_instr
);

  wire[3:0] T52;
  wire[4:0] T0;
  wire[4:0] T1;
  reg [3:0] instruction;
  wire[3:0] T2;
  wire[3:0] T3;
  wire T4;
  wire T5;
  wire[7:0] T53;
  wire[24:0] T6;
  wire[24:0] T7;
  reg [23:0] kernel;
  wire[23:0] T8;
  wire[23:0] T54;
  wire[15:0] T55;
  wire T56;
  wire[7:0] T57;
  wire[24:0] T9;
  wire[24:0] T58;
  wire[16:0] T10;
  wire[7:0] T59;
  wire T60;
  wire[24:0] T11;
  wire[24:0] T12;
  wire[7:0] T61;
  wire[8:0] T13;
  wire[8:0] T14;
  reg [7:0] blue;
  wire[7:0] T62;
  wire[31:0] T63;
  wire[31:0] T15;
  wire[31:0] T16;
  wire[31:0] T17;
  wire[31:0] T64;
  wire[31:0] T18;
  wire[7:0] T19;
  wire T20;
  wire T21;
  wire[31:0] T22;
  wire[7:0] T23;
  wire T24;
  wire T25;
  wire[31:0] T26;
  wire[7:0] T27;
  wire T28;
  wire T29;
  wire[7:0] T65;
  wire[8:0] T30;
  wire[8:0] T31;
  reg [7:0] green;
  wire[7:0] T66;
  wire[31:0] T67;
  wire[31:0] T32;
  wire[31:0] T33;
  wire[31:0] T34;
  wire[31:0] T68;
  wire[31:0] T35;
  wire[7:0] T36;
  wire[31:0] T37;
  wire[7:0] T38;
  wire[31:0] T39;
  wire[7:0] T40;
  wire[7:0] T69;
  wire[8:0] T41;
  wire[8:0] T42;
  reg [7:0] red;
  wire[7:0] T70;
  wire[31:0] T71;
  wire[31:0] T43;
  wire[31:0] T44;
  wire[31:0] T45;
  wire[31:0] T72;
  wire[31:0] T46;
  wire[7:0] T47;
  wire[31:0] T48;
  wire[7:0] T49;
  wire[31:0] T50;
  wire[7:0] T51;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    instruction = {1{$random}};
    kernel = {1{$random}};
    blue = {1{$random}};
    green = {1{$random}};
    red = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_instr = T52;
  assign T52 = T0[2'h3:1'h0];
  assign T0 = T1;
  assign T1 = {1'h0, instruction};
  assign T2 = T4 ? T3 : instruction;
  assign T3 = io_kernel_in[2'h3:1'h0];
  assign T4 = T5 & io_load_instruction;
  assign T5 = io_stall ^ 1'h1;
  assign io_dbg_kernel = T53;
  assign T53 = T6[3'h7:1'h0];
  assign T6 = T7;
  assign T7 = {1'h0, kernel};
  assign T8 = T5 ? T54 : kernel;
  assign T54 = {T55, io_kernel_in};
  assign T55 = T56 ? 16'hffff : 16'h0;
  assign T56 = io_kernel_in[3'h7:3'h7];
  assign io_kernel_out = T57;
  assign T57 = T9[3'h7:1'h0];
  assign T9 = T5 ? T11 : T58;
  assign T58 = {T59, T10};
  assign T10 = 17'hdead;
  assign T59 = T60 ? 8'hff : 8'h0;
  assign T60 = T10[5'h10:5'h10];
  assign T11 = T12;
  assign T12 = {1'h0, kernel};
  assign io_blue_out = T61;
  assign T61 = T13[3'h7:1'h0];
  assign T13 = T14;
  assign T14 = {1'h0, blue};
  assign T62 = T63[3'h7:1'h0];
  assign T63 = reset ? 32'h0 : T15;
  assign T15 = T28 ? T26 : T16;
  assign T16 = T24 ? T22 : T17;
  assign T17 = T20 ? T18 : T64;
  assign T64 = {24'h0, blue};
  assign T18 = T19 * kernel;
  assign T19 = io_pixel_in[5'h17:5'h10];
  assign T20 = T5 & T21;
  assign T21 = instruction == 4'h0;
  assign T22 = T23 * kernel;
  assign T23 = io_pixel_in[5'h17:5'h10];
  assign T24 = T5 & T25;
  assign T25 = instruction == 4'h1;
  assign T26 = T27 * kernel;
  assign T27 = io_pixel_in[5'h17:5'h10];
  assign T28 = T5 & T29;
  assign T29 = instruction == 4'h2;
  assign io_green_out = T65;
  assign T65 = T30[3'h7:1'h0];
  assign T30 = T31;
  assign T31 = {1'h0, green};
  assign T66 = T67[3'h7:1'h0];
  assign T67 = reset ? 32'h0 : T32;
  assign T32 = T28 ? T39 : T33;
  assign T33 = T24 ? T37 : T34;
  assign T34 = T20 ? T35 : T68;
  assign T68 = {24'h0, green};
  assign T35 = T36 * kernel;
  assign T36 = io_pixel_in[4'hf:4'h8];
  assign T37 = T38 * kernel;
  assign T38 = io_pixel_in[4'hf:4'h8];
  assign T39 = T40 * kernel;
  assign T40 = io_pixel_in[4'hf:4'h8];
  assign io_red_out = T69;
  assign T69 = T41[3'h7:1'h0];
  assign T41 = T42;
  assign T42 = {1'h0, red};
  assign T70 = T71[3'h7:1'h0];
  assign T71 = reset ? 32'h0 : T43;
  assign T43 = T28 ? T50 : T44;
  assign T44 = T24 ? T48 : T45;
  assign T45 = T20 ? T46 : T72;
  assign T72 = {24'h0, red};
  assign T46 = T47 * kernel;
  assign T47 = io_pixel_in[3'h7:1'h0];
  assign T48 = T49 * kernel;
  assign T49 = io_pixel_in[3'h7:1'h0];
  assign T50 = T51 * kernel;
  assign T51 = io_pixel_in[3'h7:1'h0];

  always @(posedge clk) begin
    if(T4) begin
      instruction <= T3;
    end
    if(T5) begin
      kernel <= T54;
    end
    blue <= T62;
    green <= T66;
    red <= T70;
  end
endmodule

module Reducer(input clk, input reset,
    input  io_load_instruction,
    input [7:0] io_red_in,
    input [7:0] io_green_in,
    input [7:0] io_blue_in,
    output[7:0] io_red_out,
    output[7:0] io_green_out,
    output[7:0] io_blue_out,
    input  io_flush,
    input  io_stall,
    output io_valid_out,
    output[3:0] io_dbg_flush,
    output[3:0] io_dbg_instr
);

  wire[3:0] T40;
  wire[8:0] T0;
  wire[8:0] T1;
  reg [7:0] instruction;
  wire[7:0] T2;
  wire T3;
  wire T4;
  wire[3:0] T41;
  wire[1:0] T5;
  wire[1:0] T6;
  wire[1:0] T42;
  wire T43;
  reg [7:0] blue;
  wire[7:0] T44;
  wire[7:0] T7;
  wire[7:0] T8;
  wire[7:0] T9;
  wire[7:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire[7:0] T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire[7:0] T20;
  wire T21;
  wire T22;
  wire[7:0] T23;
  wire T24;
  wire T25;
  reg [7:0] green;
  wire[7:0] T45;
  wire[7:0] T26;
  wire[7:0] T27;
  wire[7:0] T28;
  wire[7:0] T29;
  wire[7:0] T30;
  wire[7:0] T31;
  wire[7:0] T32;
  reg [7:0] red;
  wire[7:0] T46;
  wire[7:0] T33;
  wire[7:0] T34;
  wire[7:0] T35;
  wire[7:0] T36;
  wire[7:0] T37;
  wire[7:0] T38;
  wire[7:0] T39;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    instruction = {1{$random}};
    blue = {1{$random}};
    green = {1{$random}};
    red = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_instr = T40;
  assign T40 = T0[2'h3:1'h0];
  assign T0 = T1;
  assign T1 = {1'h0, instruction};
  assign T2 = T3 ? io_red_in : instruction;
  assign T3 = T4 & io_load_instruction;
  assign T4 = io_stall ^ 1'h1;
  assign io_dbg_flush = T41;
  assign T41 = {T42, T5};
  assign T5 = T6;
  assign T6 = {1'h0, io_flush};
  assign T42 = T43 ? 2'h3 : 2'h0;
  assign T43 = T5[1'h1:1'h1];
  assign io_valid_out = io_flush;
  assign io_blue_out = blue;
  assign T44 = reset ? 8'h0 : T7;
  assign T7 = T24 ? T23 : T8;
  assign T8 = T21 ? T20 : T9;
  assign T9 = T15 ? T14 : T10;
  assign T10 = T11 ? io_blue_in : blue;
  assign T11 = T4 & T12;
  assign T12 = T13 & io_flush;
  assign T13 = io_load_instruction ^ 1'h1;
  assign T14 = io_blue_in + blue;
  assign T15 = T17 & T16;
  assign T16 = instruction == 8'h0;
  assign T17 = T4 & T18;
  assign T18 = T19 ^ 1'h1;
  assign T19 = io_load_instruction | io_flush;
  assign T20 = io_blue_in + blue;
  assign T21 = T17 & T22;
  assign T22 = instruction == 8'h1;
  assign T23 = io_blue_in + blue;
  assign T24 = T17 & T25;
  assign T25 = instruction == 8'h2;
  assign io_green_out = green;
  assign T45 = reset ? 8'h0 : T26;
  assign T26 = T24 ? T32 : T27;
  assign T27 = T21 ? T31 : T28;
  assign T28 = T15 ? T30 : T29;
  assign T29 = T11 ? io_green_in : green;
  assign T30 = io_green_in + green;
  assign T31 = io_green_in + green;
  assign T32 = io_green_in + green;
  assign io_red_out = red;
  assign T46 = reset ? 8'h0 : T33;
  assign T33 = T24 ? T39 : T34;
  assign T34 = T21 ? T38 : T35;
  assign T35 = T15 ? T37 : T36;
  assign T36 = T11 ? io_red_in : red;
  assign T37 = io_red_in + red;
  assign T38 = io_red_in + red;
  assign T39 = io_red_in + red;

  always @(posedge clk) begin
    if(T3) begin
      instruction <= io_red_in;
    end
    if(reset) begin
      blue <= 8'h0;
    end else if(T24) begin
      blue <= T23;
    end else if(T21) begin
      blue <= T20;
    end else if(T15) begin
      blue <= T14;
    end else if(T11) begin
      blue <= io_blue_in;
    end
    if(reset) begin
      green <= 8'h0;
    end else if(T24) begin
      green <= T32;
    end else if(T21) begin
      green <= T31;
    end else if(T15) begin
      green <= T30;
    end else if(T11) begin
      green <= io_green_in;
    end
    if(reset) begin
      red <= 8'h0;
    end else if(T24) begin
      red <= T39;
    end else if(T21) begin
      red <= T38;
    end else if(T15) begin
      red <= T37;
    end else if(T11) begin
      red <= io_red_in;
    end
  end
endmodule

module Normalizer(
    //input  io_reset
    //input  io_programming_mode
    input [7:0] io_red_in,
    input [7:0] io_green_in,
    input [7:0] io_blue_in,
    output[23:0] io_data_out
);

  wire[23:0] T0;
  wire[23:0] T1;
  wire[7:0] T2;
  wire[23:0] T3;
  wire[23:0] T4;
  wire[23:0] T5;
  wire[23:0] T6;
  wire[23:0] T7;
  wire[23:0] T21;
  wire[15:0] T8;
  wire[7:0] T9;
  wire[7:0] T22;
  wire T23;
  wire[23:0] T10;
  wire[23:0] T11;
  wire[23:0] T12;
  wire[23:0] T13;
  wire[23:0] T14;
  wire[23:0] T24;
  wire[7:0] T15;
  wire[7:0] T16;
  wire[15:0] T25;
  wire T26;
  wire[23:0] T17;
  wire[23:0] T18;
  wire[23:0] T19;
  wire[23:0] T20;


  assign io_data_out = T0;
  assign T0 = T3 | T1;
  assign T1 = T2 << 5'h10;
  assign T2 = io_green_in & 8'hff;
  assign T3 = T7 & T4;
  assign T4 = ~ T5;
  assign T5 = 24'hff0000 | T6;
  assign T6 = io_data_out ^ io_data_out;
  assign T7 = T10 | T21;
  assign T21 = {T22, T8};
  assign T8 = T9 << 4'h8;
  assign T9 = io_blue_in & 8'hff;
  assign T22 = T23 ? 8'hff : 8'h0;
  assign T23 = T8[4'hf:4'hf];
  assign T10 = T14 & T11;
  assign T11 = ~ T12;
  assign T12 = 24'hff00 | T13;
  assign T13 = io_data_out ^ io_data_out;
  assign T14 = T17 | T24;
  assign T24 = {T25, T15};
  assign T15 = T16 << 1'h0;
  assign T16 = io_red_in & 8'hff;
  assign T25 = T26 ? 16'hffff : 16'h0;
  assign T26 = T15[3'h7:3'h7];
  assign T17 = 24'h0 & T18;
  assign T18 = ~ T19;
  assign T19 = 24'hff | T20;
  assign T20 = io_data_out ^ io_data_out;
endmodule

module ALUrow(input clk, input reset,
    input [23:0] io_pixel_in_2,
    input [23:0] io_pixel_in_1,
    input [23:0] io_pixel_in_0,
    input [7:0] io_kernel_in,
    input  io_accumulator_flush,
    input  io_selector_shift,
    input  io_stall,
    input  io_load_instruction,
    output[23:0] io_data_out,
    output[7:0] io_kernel_out,
    output io_valid_out
);

  wire[7:0] T0;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire[7:0] T4;
  wire[7:0] T5;
  wire[7:0] T6;
  wire[7:0] T198;
  wire[1:0] T7;
  wire[5:0] T199;
  wire T200;
  reg  flush_signals_0;
  reg  flush_signals_1;
  reg  flush_signals_2;
  reg  flush_signals_3;
  reg  flush_signals_4;
  reg  flush_signals_5;
  reg  flush_signals_6;
  wire[7:0] T8;
  wire[7:0] T9;
  wire[7:0] T10;
  wire[7:0] T11;
  wire[7:0] T12;
  wire[7:0] T13;
  wire[7:0] T14;
  wire[7:0] T201;
  wire[1:0] T15;
  wire[5:0] T202;
  wire T203;
  wire[7:0] T16;
  wire[7:0] T17;
  wire[7:0] T18;
  wire[7:0] T19;
  wire[7:0] T20;
  wire[7:0] T21;
  wire[7:0] T22;
  wire[7:0] T204;
  wire[1:0] T23;
  wire[5:0] T205;
  wire T206;
  reg  shift_enablers_6;
  reg  shift_enablers_5;
  reg  shift_enablers_4;
  reg  shift_enablers_3;
  reg  shift_enablers_2;
  reg  shift_enablers_1;
  reg  shift_enablers_0;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire[23:0] T30;
  wire[23:0] T31;
  wire[23:0] T32;
  wire[23:0] T33;
  wire[23:0] T34;
  wire[23:0] T35;
  wire[23:0] T36;
  wire[23:0] T37;
  wire[23:0] T38;
  wire[23:0] T39;
  wire[23:0] T40;
  wire[23:0] T41;
  wire[23:0] T42;
  wire[23:0] T43;
  wire[23:0] T44;
  wire[23:0] T45;
  wire[23:0] T46;
  wire[23:0] T47;
  wire[23:0] T48;
  wire[23:0] T49;
  wire[23:0] T50;
  wire[23:0] T51;
  wire[23:0] T207;
  wire[7:0] T52;
  wire[7:0] T53;
  wire[15:0] T208;
  wire T209;
  wire[23:0] T54;
  wire[23:0] T55;
  wire[23:0] T56;
  wire[23:0] T57;
  wire[23:0] T58;
  wire[23:0] T210;
  wire[15:0] T59;
  wire[7:0] T60;
  wire[7:0] T211;
  wire T212;
  wire[23:0] T61;
  wire[23:0] T62;
  wire[23:0] T63;
  wire[23:0] T64;
  wire[23:0] T65;
  wire[23:0] T66;
  wire[7:0] T67;
  wire[23:0] T68;
  wire[23:0] T69;
  wire[23:0] T70;
  wire[23:0] T71;
  wire[23:0] T72;
  wire[23:0] T213;
  wire[7:0] T73;
  wire[7:0] T74;
  wire[15:0] T214;
  wire T215;
  wire[23:0] T75;
  wire[23:0] T76;
  wire[23:0] T77;
  wire[23:0] T78;
  wire[23:0] T79;
  wire[23:0] T216;
  wire[15:0] T80;
  wire[7:0] T81;
  wire[7:0] T217;
  wire T218;
  wire[23:0] T82;
  wire[23:0] T83;
  wire[23:0] T84;
  wire[23:0] T85;
  wire[23:0] T86;
  wire[23:0] T87;
  wire[7:0] T88;
  wire[23:0] T89;
  wire[23:0] T90;
  wire[23:0] T91;
  wire[23:0] T92;
  wire[23:0] T93;
  wire[23:0] T219;
  wire[7:0] T94;
  wire[7:0] T95;
  wire[15:0] T220;
  wire T221;
  wire[23:0] T96;
  wire[23:0] T97;
  wire[23:0] T98;
  wire[23:0] T99;
  wire[23:0] T100;
  wire[23:0] T222;
  wire[15:0] T101;
  wire[7:0] T102;
  wire[7:0] T223;
  wire T224;
  wire[23:0] T103;
  wire[23:0] T104;
  wire[23:0] T105;
  wire[23:0] T106;
  wire[23:0] T107;
  wire[23:0] T108;
  wire[7:0] T109;
  wire[23:0] T110;
  wire[23:0] T111;
  wire[23:0] T112;
  wire[23:0] T113;
  wire[23:0] T114;
  wire[23:0] T225;
  wire[7:0] T115;
  wire[7:0] T116;
  wire[15:0] T226;
  wire T227;
  wire[23:0] T117;
  wire[23:0] T118;
  wire[23:0] T119;
  wire[23:0] T120;
  wire[23:0] T121;
  wire[23:0] T228;
  wire[15:0] T122;
  wire[7:0] T123;
  wire[7:0] T229;
  wire T230;
  wire[23:0] T124;
  wire[23:0] T125;
  wire[23:0] T126;
  wire[23:0] T127;
  wire[23:0] T128;
  wire[23:0] T129;
  wire[7:0] T130;
  wire[23:0] T131;
  wire[23:0] T132;
  wire[23:0] T133;
  wire[23:0] T134;
  wire[23:0] T135;
  wire[23:0] T231;
  wire[7:0] T136;
  wire[7:0] T137;
  wire[15:0] T232;
  wire T233;
  wire[23:0] T138;
  wire[23:0] T139;
  wire[23:0] T140;
  wire[23:0] T141;
  wire[23:0] T142;
  wire[23:0] T234;
  wire[15:0] T143;
  wire[7:0] T144;
  wire[7:0] T235;
  wire T236;
  wire[23:0] T145;
  wire[23:0] T146;
  wire[23:0] T147;
  wire[23:0] T148;
  wire[23:0] T149;
  wire[23:0] T150;
  wire[7:0] T151;
  wire[23:0] T152;
  wire[23:0] T153;
  wire[23:0] T154;
  wire[23:0] T155;
  wire[23:0] T156;
  wire[23:0] T237;
  wire[7:0] T157;
  wire[7:0] T158;
  wire[15:0] T238;
  wire T239;
  wire[23:0] T159;
  wire[23:0] T160;
  wire[23:0] T161;
  wire[23:0] T162;
  wire[23:0] T163;
  wire[23:0] T240;
  wire[15:0] T164;
  wire[7:0] T165;
  wire[7:0] T241;
  wire T242;
  wire[23:0] T166;
  wire[23:0] T167;
  wire[23:0] T168;
  wire[23:0] T169;
  wire[23:0] T170;
  wire[23:0] T171;
  wire[7:0] T172;
  wire[23:0] T173;
  wire[23:0] T174;
  wire[23:0] T175;
  wire[23:0] T176;
  wire[23:0] T177;
  wire[23:0] T243;
  wire[7:0] T178;
  wire[7:0] T179;
  wire[15:0] T244;
  wire T245;
  wire[23:0] T180;
  wire[23:0] T181;
  wire[23:0] T182;
  wire[23:0] T183;
  wire[23:0] T184;
  wire[23:0] T246;
  wire[15:0] T185;
  wire[7:0] T186;
  wire[7:0] T247;
  wire T248;
  wire[23:0] T187;
  wire[23:0] T188;
  wire[23:0] T189;
  wire[23:0] T190;
  wire[23:0] T191;
  wire[23:0] T192;
  wire[7:0] T193;
  wire[23:0] T194;
  wire[23:0] T195;
  wire[23:0] T196;
  wire[23:0] T197;
  wire[7:0] Mapper_io_red_out;
  wire[7:0] Mapper_io_green_out;
  wire[7:0] Mapper_io_blue_out;
  wire[7:0] Mapper_io_kernel_out;
  wire[7:0] Mapper_1_io_red_out;
  wire[7:0] Mapper_1_io_green_out;
  wire[7:0] Mapper_1_io_blue_out;
  wire[7:0] Mapper_1_io_kernel_out;
  wire[7:0] Mapper_2_io_red_out;
  wire[7:0] Mapper_2_io_green_out;
  wire[7:0] Mapper_2_io_blue_out;
  wire[7:0] Mapper_2_io_kernel_out;
  wire[7:0] Mapper_3_io_red_out;
  wire[7:0] Mapper_3_io_green_out;
  wire[7:0] Mapper_3_io_blue_out;
  wire[7:0] Mapper_3_io_kernel_out;
  wire[7:0] Mapper_4_io_red_out;
  wire[7:0] Mapper_4_io_green_out;
  wire[7:0] Mapper_4_io_blue_out;
  wire[7:0] Mapper_4_io_kernel_out;
  wire[7:0] Mapper_5_io_red_out;
  wire[7:0] Mapper_5_io_green_out;
  wire[7:0] Mapper_5_io_blue_out;
  wire[7:0] Mapper_5_io_kernel_out;
  wire[7:0] Mapper_6_io_red_out;
  wire[7:0] Mapper_6_io_green_out;
  wire[7:0] Mapper_6_io_blue_out;
  wire[7:0] Mapper_6_io_kernel_out;
  wire[7:0] Reducer_io_red_out;
  wire[7:0] Reducer_io_green_out;
  wire[7:0] Reducer_io_blue_out;
  wire[7:0] Reducer_1_io_red_out;
  wire[7:0] Reducer_1_io_green_out;
  wire[7:0] Reducer_1_io_blue_out;
  wire[7:0] Reducer_2_io_red_out;
  wire[7:0] Reducer_2_io_green_out;
  wire[7:0] Reducer_2_io_blue_out;
  wire[7:0] Reducer_3_io_red_out;
  wire[7:0] Reducer_3_io_green_out;
  wire[7:0] Reducer_3_io_blue_out;
  wire[7:0] Reducer_4_io_red_out;
  wire[7:0] Reducer_4_io_green_out;
  wire[7:0] Reducer_4_io_blue_out;
  wire[7:0] Reducer_5_io_red_out;
  wire[7:0] Reducer_5_io_green_out;
  wire[7:0] Reducer_5_io_blue_out;
  wire[7:0] Reducer_6_io_red_out;
  wire[7:0] Reducer_6_io_green_out;
  wire[7:0] Reducer_6_io_blue_out;
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
    flush_signals_0 = {1{$random}};
    flush_signals_1 = {1{$random}};
    flush_signals_2 = {1{$random}};
    flush_signals_3 = {1{$random}};
    flush_signals_4 = {1{$random}};
    flush_signals_5 = {1{$random}};
    flush_signals_6 = {1{$random}};
    shift_enablers_6 = {1{$random}};
    shift_enablers_5 = {1{$random}};
    shift_enablers_4 = {1{$random}};
    shift_enablers_3 = {1{$random}};
    shift_enablers_2 = {1{$random}};
    shift_enablers_1 = {1{$random}};
    shift_enablers_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = flush_signals_6 ? Reducer_6_io_blue_out : T1;
  assign T1 = flush_signals_5 ? Reducer_5_io_blue_out : T2;
  assign T2 = flush_signals_4 ? Reducer_4_io_blue_out : T3;
  assign T3 = flush_signals_3 ? Reducer_3_io_blue_out : T4;
  assign T4 = flush_signals_2 ? Reducer_2_io_blue_out : T5;
  assign T5 = flush_signals_1 ? Reducer_1_io_blue_out : T6;
  assign T6 = flush_signals_0 ? Reducer_io_blue_out : T198;
  assign T198 = {T199, T7};
  assign T7 = 2'h0;
  assign T199 = T200 ? 6'h3f : 6'h0;
  assign T200 = T7[1'h1:1'h1];
  assign T8 = flush_signals_6 ? Reducer_6_io_green_out : T9;
  assign T9 = flush_signals_5 ? Reducer_5_io_green_out : T10;
  assign T10 = flush_signals_4 ? Reducer_4_io_green_out : T11;
  assign T11 = flush_signals_3 ? Reducer_3_io_green_out : T12;
  assign T12 = flush_signals_2 ? Reducer_2_io_green_out : T13;
  assign T13 = flush_signals_1 ? Reducer_1_io_green_out : T14;
  assign T14 = flush_signals_0 ? Reducer_io_green_out : T201;
  assign T201 = {T202, T15};
  assign T15 = 2'h0;
  assign T202 = T203 ? 6'h3f : 6'h0;
  assign T203 = T15[1'h1:1'h1];
  assign T16 = flush_signals_6 ? Reducer_6_io_red_out : T17;
  assign T17 = flush_signals_5 ? Reducer_5_io_red_out : T18;
  assign T18 = flush_signals_4 ? Reducer_4_io_red_out : T19;
  assign T19 = flush_signals_3 ? Reducer_3_io_red_out : T20;
  assign T20 = flush_signals_2 ? Reducer_2_io_red_out : T21;
  assign T21 = flush_signals_1 ? Reducer_1_io_red_out : T22;
  assign T22 = flush_signals_0 ? Reducer_io_red_out : T204;
  assign T204 = {T205, T23};
  assign T23 = 2'h0;
  assign T205 = T206 ? 6'h3f : 6'h0;
  assign T206 = T23[1'h1:1'h1];
  assign io_valid_out = T24;
  assign T24 = flush_signals_6 ? 1'h1 : T25;
  assign T25 = flush_signals_5 ? 1'h1 : T26;
  assign T26 = flush_signals_4 ? 1'h1 : T27;
  assign T27 = flush_signals_3 ? 1'h1 : T28;
  assign T28 = flush_signals_2 ? 1'h1 : T29;
  assign T29 = flush_signals_1 ? 1'h1 : flush_signals_0;
  assign io_kernel_out = Mapper_6_io_kernel_out;
  assign io_data_out = T30;
  assign T30 = flush_signals_6 ? T191 : T31;
  assign T31 = flush_signals_6 ? T184 : T32;
  assign T32 = flush_signals_6 ? T177 : T33;
  assign T33 = flush_signals_5 ? T170 : T34;
  assign T34 = flush_signals_5 ? T163 : T35;
  assign T35 = flush_signals_5 ? T156 : T36;
  assign T36 = flush_signals_4 ? T149 : T37;
  assign T37 = flush_signals_4 ? T142 : T38;
  assign T38 = flush_signals_4 ? T135 : T39;
  assign T39 = flush_signals_3 ? T128 : T40;
  assign T40 = flush_signals_3 ? T121 : T41;
  assign T41 = flush_signals_3 ? T114 : T42;
  assign T42 = flush_signals_2 ? T107 : T43;
  assign T43 = flush_signals_2 ? T100 : T44;
  assign T44 = flush_signals_2 ? T93 : T45;
  assign T45 = flush_signals_1 ? T86 : T46;
  assign T46 = flush_signals_1 ? T79 : T47;
  assign T47 = flush_signals_1 ? T72 : T48;
  assign T48 = flush_signals_0 ? T65 : T49;
  assign T49 = flush_signals_0 ? T58 : T50;
  assign T50 = flush_signals_0 ? T51 : 24'hdead;
  assign T51 = T54 | T207;
  assign T207 = {T208, T52};
  assign T52 = T53 << 1'h0;
  assign T53 = Reducer_io_red_out & 8'hff;
  assign T208 = T209 ? 16'hffff : 16'h0;
  assign T209 = T52[3'h7:3'h7];
  assign T54 = 24'hdead & T55;
  assign T55 = ~ T56;
  assign T56 = 24'hff | T57;
  assign T57 = io_data_out ^ io_data_out;
  assign T58 = T61 | T210;
  assign T210 = {T211, T59};
  assign T59 = T60 << 4'h8;
  assign T60 = Reducer_io_green_out & 8'hff;
  assign T211 = T212 ? 8'hff : 8'h0;
  assign T212 = T59[4'hf:4'hf];
  assign T61 = T50 & T62;
  assign T62 = ~ T63;
  assign T63 = 24'hff00 | T64;
  assign T64 = io_data_out ^ io_data_out;
  assign T65 = T68 | T66;
  assign T66 = T67 << 5'h10;
  assign T67 = Reducer_io_blue_out & 8'hff;
  assign T68 = T49 & T69;
  assign T69 = ~ T70;
  assign T70 = 24'hff0000 | T71;
  assign T71 = io_data_out ^ io_data_out;
  assign T72 = T75 | T213;
  assign T213 = {T214, T73};
  assign T73 = T74 << 1'h0;
  assign T74 = Reducer_1_io_red_out & 8'hff;
  assign T214 = T215 ? 16'hffff : 16'h0;
  assign T215 = T73[3'h7:3'h7];
  assign T75 = T48 & T76;
  assign T76 = ~ T77;
  assign T77 = 24'hff | T78;
  assign T78 = io_data_out ^ io_data_out;
  assign T79 = T82 | T216;
  assign T216 = {T217, T80};
  assign T80 = T81 << 4'h8;
  assign T81 = Reducer_1_io_green_out & 8'hff;
  assign T217 = T218 ? 8'hff : 8'h0;
  assign T218 = T80[4'hf:4'hf];
  assign T82 = T47 & T83;
  assign T83 = ~ T84;
  assign T84 = 24'hff00 | T85;
  assign T85 = io_data_out ^ io_data_out;
  assign T86 = T89 | T87;
  assign T87 = T88 << 5'h10;
  assign T88 = Reducer_1_io_blue_out & 8'hff;
  assign T89 = T46 & T90;
  assign T90 = ~ T91;
  assign T91 = 24'hff0000 | T92;
  assign T92 = io_data_out ^ io_data_out;
  assign T93 = T96 | T219;
  assign T219 = {T220, T94};
  assign T94 = T95 << 1'h0;
  assign T95 = Reducer_2_io_red_out & 8'hff;
  assign T220 = T221 ? 16'hffff : 16'h0;
  assign T221 = T94[3'h7:3'h7];
  assign T96 = T45 & T97;
  assign T97 = ~ T98;
  assign T98 = 24'hff | T99;
  assign T99 = io_data_out ^ io_data_out;
  assign T100 = T103 | T222;
  assign T222 = {T223, T101};
  assign T101 = T102 << 4'h8;
  assign T102 = Reducer_2_io_green_out & 8'hff;
  assign T223 = T224 ? 8'hff : 8'h0;
  assign T224 = T101[4'hf:4'hf];
  assign T103 = T44 & T104;
  assign T104 = ~ T105;
  assign T105 = 24'hff00 | T106;
  assign T106 = io_data_out ^ io_data_out;
  assign T107 = T110 | T108;
  assign T108 = T109 << 5'h10;
  assign T109 = Reducer_2_io_blue_out & 8'hff;
  assign T110 = T43 & T111;
  assign T111 = ~ T112;
  assign T112 = 24'hff0000 | T113;
  assign T113 = io_data_out ^ io_data_out;
  assign T114 = T117 | T225;
  assign T225 = {T226, T115};
  assign T115 = T116 << 1'h0;
  assign T116 = Reducer_3_io_red_out & 8'hff;
  assign T226 = T227 ? 16'hffff : 16'h0;
  assign T227 = T115[3'h7:3'h7];
  assign T117 = T42 & T118;
  assign T118 = ~ T119;
  assign T119 = 24'hff | T120;
  assign T120 = io_data_out ^ io_data_out;
  assign T121 = T124 | T228;
  assign T228 = {T229, T122};
  assign T122 = T123 << 4'h8;
  assign T123 = Reducer_3_io_green_out & 8'hff;
  assign T229 = T230 ? 8'hff : 8'h0;
  assign T230 = T122[4'hf:4'hf];
  assign T124 = T41 & T125;
  assign T125 = ~ T126;
  assign T126 = 24'hff00 | T127;
  assign T127 = io_data_out ^ io_data_out;
  assign T128 = T131 | T129;
  assign T129 = T130 << 5'h10;
  assign T130 = Reducer_3_io_blue_out & 8'hff;
  assign T131 = T40 & T132;
  assign T132 = ~ T133;
  assign T133 = 24'hff0000 | T134;
  assign T134 = io_data_out ^ io_data_out;
  assign T135 = T138 | T231;
  assign T231 = {T232, T136};
  assign T136 = T137 << 1'h0;
  assign T137 = Reducer_4_io_red_out & 8'hff;
  assign T232 = T233 ? 16'hffff : 16'h0;
  assign T233 = T136[3'h7:3'h7];
  assign T138 = T39 & T139;
  assign T139 = ~ T140;
  assign T140 = 24'hff | T141;
  assign T141 = io_data_out ^ io_data_out;
  assign T142 = T145 | T234;
  assign T234 = {T235, T143};
  assign T143 = T144 << 4'h8;
  assign T144 = Reducer_4_io_green_out & 8'hff;
  assign T235 = T236 ? 8'hff : 8'h0;
  assign T236 = T143[4'hf:4'hf];
  assign T145 = T38 & T146;
  assign T146 = ~ T147;
  assign T147 = 24'hff00 | T148;
  assign T148 = io_data_out ^ io_data_out;
  assign T149 = T152 | T150;
  assign T150 = T151 << 5'h10;
  assign T151 = Reducer_4_io_blue_out & 8'hff;
  assign T152 = T37 & T153;
  assign T153 = ~ T154;
  assign T154 = 24'hff0000 | T155;
  assign T155 = io_data_out ^ io_data_out;
  assign T156 = T159 | T237;
  assign T237 = {T238, T157};
  assign T157 = T158 << 1'h0;
  assign T158 = Reducer_5_io_red_out & 8'hff;
  assign T238 = T239 ? 16'hffff : 16'h0;
  assign T239 = T157[3'h7:3'h7];
  assign T159 = T36 & T160;
  assign T160 = ~ T161;
  assign T161 = 24'hff | T162;
  assign T162 = io_data_out ^ io_data_out;
  assign T163 = T166 | T240;
  assign T240 = {T241, T164};
  assign T164 = T165 << 4'h8;
  assign T165 = Reducer_5_io_green_out & 8'hff;
  assign T241 = T242 ? 8'hff : 8'h0;
  assign T242 = T164[4'hf:4'hf];
  assign T166 = T35 & T167;
  assign T167 = ~ T168;
  assign T168 = 24'hff00 | T169;
  assign T169 = io_data_out ^ io_data_out;
  assign T170 = T173 | T171;
  assign T171 = T172 << 5'h10;
  assign T172 = Reducer_5_io_blue_out & 8'hff;
  assign T173 = T34 & T174;
  assign T174 = ~ T175;
  assign T175 = 24'hff0000 | T176;
  assign T176 = io_data_out ^ io_data_out;
  assign T177 = T180 | T243;
  assign T243 = {T244, T178};
  assign T178 = T179 << 1'h0;
  assign T179 = Reducer_6_io_red_out & 8'hff;
  assign T244 = T245 ? 16'hffff : 16'h0;
  assign T245 = T178[3'h7:3'h7];
  assign T180 = T33 & T181;
  assign T181 = ~ T182;
  assign T182 = 24'hff | T183;
  assign T183 = io_data_out ^ io_data_out;
  assign T184 = T187 | T246;
  assign T246 = {T247, T185};
  assign T185 = T186 << 4'h8;
  assign T186 = Reducer_6_io_green_out & 8'hff;
  assign T247 = T248 ? 8'hff : 8'h0;
  assign T248 = T185[4'hf:4'hf];
  assign T187 = T32 & T188;
  assign T188 = ~ T189;
  assign T189 = 24'hff00 | T190;
  assign T190 = io_data_out ^ io_data_out;
  assign T191 = T194 | T192;
  assign T192 = T193 << 5'h10;
  assign T193 = Reducer_6_io_blue_out & 8'hff;
  assign T194 = T31 & T195;
  assign T195 = ~ T196;
  assign T196 = 24'hff0000 | T197;
  assign T197 = io_data_out ^ io_data_out;
  Mapper Mapper(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_pixel_in( ShiftMux_io_data_out ),
       .io_kernel_in( io_kernel_in ),
       .io_stall( io_stall ),
       .io_red_out( Mapper_io_red_out ),
       .io_green_out( Mapper_io_green_out ),
       .io_blue_out( Mapper_io_blue_out ),
       .io_kernel_out( Mapper_io_kernel_out )
       //.io_dbg_kernel(  )
       //.io_dbg_instr(  )
  );
  Mapper Mapper_1(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_pixel_in( ShiftMux_1_io_data_out ),
       .io_kernel_in( Mapper_io_kernel_out ),
       .io_stall( io_stall ),
       .io_red_out( Mapper_1_io_red_out ),
       .io_green_out( Mapper_1_io_green_out ),
       .io_blue_out( Mapper_1_io_blue_out ),
       .io_kernel_out( Mapper_1_io_kernel_out )
       //.io_dbg_kernel(  )
       //.io_dbg_instr(  )
  );
  Mapper Mapper_2(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_pixel_in( ShiftMux_2_io_data_out ),
       .io_kernel_in( Mapper_1_io_kernel_out ),
       .io_stall( io_stall ),
       .io_red_out( Mapper_2_io_red_out ),
       .io_green_out( Mapper_2_io_green_out ),
       .io_blue_out( Mapper_2_io_blue_out ),
       .io_kernel_out( Mapper_2_io_kernel_out )
       //.io_dbg_kernel(  )
       //.io_dbg_instr(  )
  );
  Mapper Mapper_3(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_pixel_in( ShiftMux_3_io_data_out ),
       .io_kernel_in( Mapper_2_io_kernel_out ),
       .io_stall( io_stall ),
       .io_red_out( Mapper_3_io_red_out ),
       .io_green_out( Mapper_3_io_green_out ),
       .io_blue_out( Mapper_3_io_blue_out ),
       .io_kernel_out( Mapper_3_io_kernel_out )
       //.io_dbg_kernel(  )
       //.io_dbg_instr(  )
  );
  Mapper Mapper_4(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_pixel_in( ShiftMux_4_io_data_out ),
       .io_kernel_in( Mapper_3_io_kernel_out ),
       .io_stall( io_stall ),
       .io_red_out( Mapper_4_io_red_out ),
       .io_green_out( Mapper_4_io_green_out ),
       .io_blue_out( Mapper_4_io_blue_out ),
       .io_kernel_out( Mapper_4_io_kernel_out )
       //.io_dbg_kernel(  )
       //.io_dbg_instr(  )
  );
  Mapper Mapper_5(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_pixel_in( ShiftMux_5_io_data_out ),
       .io_kernel_in( Mapper_4_io_kernel_out ),
       .io_stall( io_stall ),
       .io_red_out( Mapper_5_io_red_out ),
       .io_green_out( Mapper_5_io_green_out ),
       .io_blue_out( Mapper_5_io_blue_out ),
       .io_kernel_out( Mapper_5_io_kernel_out )
       //.io_dbg_kernel(  )
       //.io_dbg_instr(  )
  );
  Mapper Mapper_6(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_pixel_in( ShiftMux_6_io_data_out ),
       .io_kernel_in( Mapper_5_io_kernel_out ),
       .io_stall( io_stall ),
       .io_red_out( Mapper_6_io_red_out ),
       .io_green_out( Mapper_6_io_green_out ),
       .io_blue_out( Mapper_6_io_blue_out ),
       .io_kernel_out( Mapper_6_io_kernel_out )
       //.io_dbg_kernel(  )
       //.io_dbg_instr(  )
  );
  Reducer Reducer(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_red_in( Mapper_io_red_out ),
       .io_green_in( Mapper_io_green_out ),
       .io_blue_in( Mapper_io_blue_out ),
       .io_red_out( Reducer_io_red_out ),
       .io_green_out( Reducer_io_green_out ),
       .io_blue_out( Reducer_io_blue_out ),
       .io_flush( flush_signals_0 ),
       .io_stall( io_stall )
       //.io_valid_out(  )
       //.io_dbg_flush(  )
       //.io_dbg_instr(  )
  );
  Reducer Reducer_1(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_red_in( Mapper_1_io_red_out ),
       .io_green_in( Mapper_1_io_green_out ),
       .io_blue_in( Mapper_1_io_blue_out ),
       .io_red_out( Reducer_1_io_red_out ),
       .io_green_out( Reducer_1_io_green_out ),
       .io_blue_out( Reducer_1_io_blue_out ),
       .io_flush( flush_signals_1 ),
       .io_stall( io_stall )
       //.io_valid_out(  )
       //.io_dbg_flush(  )
       //.io_dbg_instr(  )
  );
  Reducer Reducer_2(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_red_in( Mapper_2_io_red_out ),
       .io_green_in( Mapper_2_io_green_out ),
       .io_blue_in( Mapper_2_io_blue_out ),
       .io_red_out( Reducer_2_io_red_out ),
       .io_green_out( Reducer_2_io_green_out ),
       .io_blue_out( Reducer_2_io_blue_out ),
       .io_flush( flush_signals_2 ),
       .io_stall( io_stall )
       //.io_valid_out(  )
       //.io_dbg_flush(  )
       //.io_dbg_instr(  )
  );
  Reducer Reducer_3(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_red_in( Mapper_3_io_red_out ),
       .io_green_in( Mapper_3_io_green_out ),
       .io_blue_in( Mapper_3_io_blue_out ),
       .io_red_out( Reducer_3_io_red_out ),
       .io_green_out( Reducer_3_io_green_out ),
       .io_blue_out( Reducer_3_io_blue_out ),
       .io_flush( flush_signals_3 ),
       .io_stall( io_stall )
       //.io_valid_out(  )
       //.io_dbg_flush(  )
       //.io_dbg_instr(  )
  );
  Reducer Reducer_4(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_red_in( Mapper_4_io_red_out ),
       .io_green_in( Mapper_4_io_green_out ),
       .io_blue_in( Mapper_4_io_blue_out ),
       .io_red_out( Reducer_4_io_red_out ),
       .io_green_out( Reducer_4_io_green_out ),
       .io_blue_out( Reducer_4_io_blue_out ),
       .io_flush( flush_signals_4 ),
       .io_stall( io_stall )
       //.io_valid_out(  )
       //.io_dbg_flush(  )
       //.io_dbg_instr(  )
  );
  Reducer Reducer_5(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_red_in( Mapper_5_io_red_out ),
       .io_green_in( Mapper_5_io_green_out ),
       .io_blue_in( Mapper_5_io_blue_out ),
       .io_red_out( Reducer_5_io_red_out ),
       .io_green_out( Reducer_5_io_green_out ),
       .io_blue_out( Reducer_5_io_blue_out ),
       .io_flush( flush_signals_5 ),
       .io_stall( io_stall )
       //.io_valid_out(  )
       //.io_dbg_flush(  )
       //.io_dbg_instr(  )
  );
  Reducer Reducer_6(.clk(clk), .reset(reset),
       .io_load_instruction( io_load_instruction ),
       .io_red_in( Mapper_6_io_red_out ),
       .io_green_in( Mapper_6_io_green_out ),
       .io_blue_in( Mapper_6_io_blue_out ),
       .io_red_out( Reducer_6_io_red_out ),
       .io_green_out( Reducer_6_io_green_out ),
       .io_blue_out( Reducer_6_io_blue_out ),
       .io_flush( flush_signals_6 ),
       .io_stall( io_stall )
       //.io_valid_out(  )
       //.io_dbg_flush(  )
       //.io_dbg_instr(  )
  );
  ShiftMux_2 ShiftMux(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_0 ),
       .io_stall( io_stall ),
       .io_reset( io_stall ),
       .io_data_out( ShiftMux_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux_2 ShiftMux_1(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_1 ),
       .io_stall( io_stall ),
       .io_reset( io_stall ),
       .io_data_out( ShiftMux_1_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux_2 ShiftMux_2(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_2 ),
       .io_stall( io_stall ),
       .io_reset( io_stall ),
       .io_data_out( ShiftMux_2_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux_2 ShiftMux_3(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_3 ),
       .io_stall( io_stall ),
       .io_reset( io_stall ),
       .io_data_out( ShiftMux_3_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux_2 ShiftMux_4(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_4 ),
       .io_stall( io_stall ),
       .io_reset( io_stall ),
       .io_data_out( ShiftMux_4_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux_2 ShiftMux_5(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_5 ),
       .io_stall( io_stall ),
       .io_reset( io_stall ),
       .io_data_out( ShiftMux_5_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux_2 ShiftMux_6(.clk(clk), .reset(reset),
       .io_pixel_in_2( io_pixel_in_2 ),
       .io_pixel_in_1( io_pixel_in_1 ),
       .io_pixel_in_0( io_pixel_in_0 ),
       .io_shift( shift_enablers_6 ),
       .io_stall( io_stall ),
       .io_reset( io_stall ),
       .io_data_out( ShiftMux_6_io_data_out )
       //.io_dbg_state(  )
  );
  Normalizer normalizer(
       //.io_reset(  )
       //.io_programming_mode(  )
       .io_red_in( T16 ),
       .io_green_in( T8 ),
       .io_blue_in( T0 )
       //.io_data_out(  )
  );

  always @(posedge clk) begin
    flush_signals_0 <= io_accumulator_flush;
    flush_signals_1 <= flush_signals_0;
    flush_signals_2 <= flush_signals_1;
    flush_signals_3 <= flush_signals_2;
    flush_signals_4 <= flush_signals_3;
    flush_signals_5 <= flush_signals_4;
    flush_signals_6 <= flush_signals_5;
    shift_enablers_6 <= shift_enablers_5;
    shift_enablers_5 <= shift_enablers_4;
    shift_enablers_4 <= shift_enablers_3;
    shift_enablers_3 <= shift_enablers_2;
    shift_enablers_2 <= shift_enablers_1;
    shift_enablers_1 <= shift_enablers_0;
    shift_enablers_0 <= io_selector_shift;
  end
endmodule

module ProcessorController(input clk, input reset,
    input  io_input_valid,
    input  io_programming_mode,
    input  io_processor_sleep,
    output io_alu_stall,
    output io_load_kernel,
    output io_load_instruction,
    output io_reset,
    output[31:0] io_dbg_kernel_skew
);

  wire[31:0] T30;
  reg [7:0] kernel_skew;
  wire[7:0] T31;
  wire[7:0] T0;
  wire[7:0] T1;
  wire[7:0] T2;
  wire[7:0] T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  reg [31:0] stage;
  wire[31:0] T32;
  wire[31:0] T8;
  wire[31:0] T9;
  wire[31:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire[7:0] T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire[7:0] T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    kernel_skew = {1{$random}};
    stage = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_kernel_skew = T30;
  assign T30 = {24'h0, kernel_skew};
  assign T31 = reset ? 8'h0 : T0;
  assign T0 = T22 ? T21 : T1;
  assign T1 = T19 ? 8'h0 : T2;
  assign T2 = T17 ? T16 : T3;
  assign T3 = T4 ? 8'h0 : kernel_skew;
  assign T4 = T6 & T5;
  assign T5 = kernel_skew == 8'h8;
  assign T6 = T15 & T7;
  assign T7 = 32'h9 < stage;
  assign T32 = reset ? 32'h0 : T8;
  assign T8 = T11 ? 32'h0 : T9;
  assign T9 = T15 ? T10 : stage;
  assign T10 = stage + 32'h1;
  assign T11 = T12 ^ 1'h1;
  assign T12 = io_programming_mode | T13;
  assign T13 = io_processor_sleep & T14;
  assign T14 = kernel_skew == 8'h8;
  assign T15 = io_programming_mode & io_input_valid;
  assign T16 = kernel_skew + 8'h1;
  assign T17 = T6 & T18;
  assign T18 = T5 ^ 1'h1;
  assign T19 = T11 & T20;
  assign T20 = kernel_skew == 8'h8;
  assign T21 = kernel_skew + 8'h1;
  assign T22 = T11 & T23;
  assign T23 = T20 ^ 1'h1;
  assign io_reset = 1'h0;
  assign io_load_instruction = T24;
  assign T24 = T6 ? 1'h0 : T15;
  assign io_load_kernel = T15;
  assign io_alu_stall = T25;
  assign T25 = T28 ? 1'h1 : T26;
  assign T26 = io_programming_mode & T27;
  assign T27 = io_input_valid ^ 1'h1;
  assign T28 = T29 & T13;
  assign T29 = io_programming_mode ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      kernel_skew <= 8'h0;
    end else if(T22) begin
      kernel_skew <= T21;
    end else if(T19) begin
      kernel_skew <= 8'h0;
    end else if(T17) begin
      kernel_skew <= T16;
    end else if(T4) begin
      kernel_skew <= 8'h0;
    end
    if(reset) begin
      stage <= 32'h0;
    end else if(T11) begin
      stage <= 32'h0;
    end else if(T15) begin
      stage <= T10;
    end
  end
endmodule

module Processor(input clk, input reset,
    input [23:0] io_pixel_in,
    input  io_processor_configure,
    input [23:0] io_control_data_in,
    input  io_processor_sleep,
    input  io_input_valid,
    output[23:0] io_ALU_data_out,
    output io_ALU_data_is_valid
);

  wire[7:0] T3;
  wire[8:0] T0;
  wire[8:0] T1;
  wire[23:0] T4;
  wire[7:0] T2;
  wire data_control_io_read_row_2;
  wire data_control_io_read_row_1;
  wire data_control_io_read_row_0;
  wire data_control_io_mux_row_2;
  wire data_control_io_mux_row_1;
  wire data_control_io_mux_row_0;
  wire data_control_io_shift_mux;
  wire data_control_io_accumulator_flush;
  wire data_control_io_ALU_shift;
  wire[7:0] kernel_buffer_io_kernel_out;
  wire processor_control_io_alu_stall;
  wire processor_control_io_load_kernel;
  wire processor_control_io_load_instruction;
  wire[23:0] ALUs_io_data_out;
  wire[7:0] ALUs_io_kernel_out;
  wire ALUs_io_valid_out;
  wire[23:0] conveyor_io_data_out_2;
  wire[23:0] conveyor_io_data_out_1;
  wire[23:0] conveyor_io_data_out_0;


  assign T3 = T0[3'h7:1'h0];
  assign T0 = T1;
  assign T1 = {1'h0, kernel_buffer_io_kernel_out};
  assign T4 = {16'h0, T2};
  assign T2 = io_control_data_in[3'h7:1'h0];
  assign io_ALU_data_is_valid = ALUs_io_valid_out;
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
       .io_stall( processor_control_io_alu_stall ),
       .io_data_out_2( conveyor_io_data_out_2 ),
       .io_data_out_1( conveyor_io_data_out_1 ),
       .io_data_out_0( conveyor_io_data_out_0 )
  );
  Orchestrator data_control(.clk(clk), .reset(reset),
       .io_reset( io_processor_sleep ),
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
  KernelBuffer kernel_buffer(.clk(clk), .reset(reset),
       .io_kernel_in( ALUs_io_kernel_out ),
       .io_data_in( T4 ),
       .io_stall( processor_control_io_alu_stall ),
       .io_load_kernel( processor_control_io_load_kernel ),
       .io_kernel_out( kernel_buffer_io_kernel_out )
       //.io_dbg_kernel0(  )
       //.io_dbg_kernel1(  )
  );
  ALUrow ALUs(.clk(clk), .reset(reset),
       .io_pixel_in_2( conveyor_io_data_out_0 ),
       .io_pixel_in_1( conveyor_io_data_out_1 ),
       .io_pixel_in_0( conveyor_io_data_out_2 ),
       .io_kernel_in( T3 ),
       .io_accumulator_flush( data_control_io_accumulator_flush ),
       .io_selector_shift( data_control_io_ALU_shift ),
       .io_stall( processor_control_io_alu_stall ),
       .io_load_instruction( processor_control_io_load_instruction ),
       .io_data_out( ALUs_io_data_out ),
       .io_kernel_out( ALUs_io_kernel_out ),
       .io_valid_out( ALUs_io_valid_out )
  );
  ProcessorController processor_control(.clk(clk), .reset(reset),
       .io_input_valid( io_input_valid ),
       .io_programming_mode( io_processor_configure ),
       .io_processor_sleep( io_processor_sleep ),
       .io_alu_stall( processor_control_io_alu_stall ),
       .io_load_kernel( processor_control_io_load_kernel ),
       .io_load_instruction( processor_control_io_load_instruction )
       //.io_reset(  )
       //.io_dbg_kernel_skew(  )
  );
endmodule

module TileController(input clk, input reset,
    input  io_reset,
    input [23:0] io_control_data_in,
    input  io_control_input_valid,
    output[23:0] io_processor_control_input,
    output io_processor_control_input_valid,
    input  io_processor_input_is_valid,
    input  io_ALU_output_is_valid,
    output io_processor_output_is_valid,
    output io_processor_sleep,
    output io_processor_configure,
    output[31:0] io_dbg_processor_valid_output_count
);

  reg [31:0] valid_processor_output_count;
  wire[31:0] T36;
  wire[31:0] T0;
  wire[31:0] T1;
  wire[31:0] T2;
  wire[31:0] T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  reg [31:0] valid_processor_input_count;
  wire[31:0] T37;
  wire[31:0] T8;
  wire[31:0] T9;
  wire[31:0] T10;
  wire T11;
  wire T12;
  wire T13;
  reg  state;
  wire T38;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  reg [31:0] stage;
  wire[31:0] T39;
  wire[31:0] T18;
  wire[31:0] T19;
  wire[31:0] T20;
  wire T21;
  wire T22;
  wire[31:0] T23;
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

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    valid_processor_output_count = {1{$random}};
    valid_processor_input_count = {1{$random}};
    state = {1{$random}};
    stage = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_processor_valid_output_count = valid_processor_output_count;
  assign T36 = reset ? 32'h0 : T0;
  assign T0 = T30 ? 32'h0 : T1;
  assign T1 = T24 ? T23 : T2;
  assign T2 = T4 ? T3 : valid_processor_output_count;
  assign T3 = valid_processor_output_count + 32'h1;
  assign T4 = T5 & io_ALU_output_is_valid;
  assign T5 = T12 & T6;
  assign T6 = T7 ^ 1'h1;
  assign T7 = valid_processor_input_count < 32'h1f;
  assign T37 = reset ? 32'h0 : T8;
  assign T8 = T30 ? 32'h0 : T9;
  assign T9 = T11 ? T10 : valid_processor_input_count;
  assign T10 = valid_processor_input_count + 32'h1;
  assign T11 = T12 & T7;
  assign T12 = T13 & io_processor_input_is_valid;
  assign T13 = state == 1'h1;
  assign T38 = reset ? 1'h0 : T14;
  assign T14 = io_reset ? 1'h0 : T15;
  assign T15 = T16 ? 1'h1 : state;
  assign T16 = T21 & T17;
  assign T17 = stage == 32'h15;
  assign T39 = reset ? 32'h0 : T18;
  assign T18 = io_reset ? 32'h0 : T19;
  assign T19 = T21 ? T20 : stage;
  assign T20 = stage + 32'h1;
  assign T21 = T22 & io_control_input_valid;
  assign T22 = state == 1'h0;
  assign T23 = valid_processor_output_count + 32'h1;
  assign T24 = T26 & T25;
  assign T25 = valid_processor_output_count < 32'h1180;
  assign T26 = T13 & T27;
  assign T27 = T29 & T28;
  assign T28 = 32'h0 < valid_processor_output_count;
  assign T29 = io_processor_input_is_valid ^ 1'h1;
  assign T30 = T13 & T31;
  assign T31 = valid_processor_output_count == 32'h1180;
  assign io_processor_configure = T22;
  assign io_processor_sleep = T32;
  assign T32 = T21 ? 1'h0 : T33;
  assign T33 = T30 ? 1'h1 : T34;
  assign T34 = T12 ? 1'h0 : 1'h1;
  assign io_processor_output_is_valid = T35;
  assign T35 = T24 ? 1'h1 : T4;
  assign io_processor_control_input_valid = io_control_input_valid;
  assign io_processor_control_input = io_control_data_in;

  always @(posedge clk) begin
    if(reset) begin
      valid_processor_output_count <= 32'h0;
    end else if(T30) begin
      valid_processor_output_count <= 32'h0;
    end else if(T24) begin
      valid_processor_output_count <= T23;
    end else if(T4) begin
      valid_processor_output_count <= T3;
    end
    if(reset) begin
      valid_processor_input_count <= 32'h0;
    end else if(T30) begin
      valid_processor_input_count <= 32'h0;
    end else if(T11) begin
      valid_processor_input_count <= T10;
    end
    if(reset) begin
      state <= 1'h0;
    end else if(io_reset) begin
      state <= 1'h0;
    end else if(T16) begin
      state <= 1'h1;
    end
    if(reset) begin
      stage <= 32'h0;
    end else if(io_reset) begin
      stage <= 32'h0;
    end else if(T21) begin
      stage <= T20;
    end
  end
endmodule

module SliceReverseBuffer(input clk, input reset,
    input [23:0] io_data_in,
    input  io_enq,
    input  io_deq,
    output io_can_enq,
    output io_can_deq,
    output[23:0] io_data_out,
    output[31:0] io_dbg_enq_row,
    output[31:0] io_dbg_deq_row,
    output[31:0] io_dbg_row_deq_count,
    output[31:0] io_dbg_enq_count
);

  wire T0;
  wire T1;
  reg [31:0] deq_row;
  wire[31:0] T79;
  wire[31:0] T2;
  wire[31:0] T3;
  wire[31:0] T4;
  wire T5;
  wire T6;
  wire T7;
  reg [31:0] row_deq_count;
  wire[31:0] T80;
  wire[31:0] T8;
  wire[31:0] T9;
  wire[31:0] T10;
  wire T11;
  wire T12;
  wire[31:0] T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  reg [31:0] enq_row;
  wire[31:0] T81;
  wire[31:0] T20;
  wire[31:0] T21;
  wire[31:0] T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire[23:0] T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire[23:0] T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire[23:0] T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire[23:0] T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire[23:0] T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire[23:0] T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire[23:0] T57;
  reg [31:0] enq_performed;
  wire[31:0] T82;
  wire[31:0] T58;
  wire[31:0] T59;
  wire[31:0] T60;
  wire T61;
  wire T62;
  wire[23:0] T63;
  wire[23:0] T64;
  wire[23:0] T65;
  wire[23:0] T66;
  wire[23:0] T67;
  wire[23:0] T68;
  wire[23:0] T69;
  wire T70;
  reg  mode;
  wire T83;
  wire T71;
  wire T72;
  wire T73;
  wire T74;
  reg [31:0] deq_performed;
  wire[31:0] T84;
  wire[31:0] T75;
  wire[31:0] T76;
  wire[31:0] T77;
  wire T78;
  wire[23:0] RowBuffer_io_data_out;
  wire[23:0] RowBuffer_1_io_data_out;
  wire[23:0] RowBuffer_2_io_data_out;
  wire[23:0] RowBuffer_3_io_data_out;
  wire[23:0] RowBuffer_4_io_data_out;
  wire[23:0] RowBuffer_5_io_data_out;
  wire[23:0] RowBuffer_6_io_data_out;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    deq_row = {1{$random}};
    row_deq_count = {1{$random}};
    enq_row = {1{$random}};
    enq_performed = {1{$random}};
    mode = {1{$random}};
    deq_performed = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T0 = T1 ? io_deq : 1'h0;
  assign T1 = deq_row == 32'h6;
  assign T79 = reset ? 32'h0 : T2;
  assign T2 = T16 ? 32'h0 : T3;
  assign T3 = T5 ? T4 : deq_row;
  assign T4 = deq_row + 32'h1;
  assign T5 = T7 & T6;
  assign T6 = deq_row < 32'h6;
  assign T7 = row_deq_count == 32'h27f;
  assign T80 = reset ? 32'h0 : T8;
  assign T8 = T14 ? T13 : T9;
  assign T9 = T11 ? 32'h0 : T10;
  assign T10 = T7 ? 32'h0 : row_deq_count;
  assign T11 = io_deq & T12;
  assign T12 = row_deq_count == 32'h27f;
  assign T13 = row_deq_count + 32'h1;
  assign T14 = io_deq & T15;
  assign T15 = T12 ^ 1'h1;
  assign T16 = T7 & T17;
  assign T17 = T6 ^ 1'h1;
  assign T18 = T19 ? io_enq : 1'h0;
  assign T19 = enq_row == 32'h6;
  assign T81 = reset ? 32'h0 : T20;
  assign T20 = T25 ? 32'h0 : T21;
  assign T21 = T23 ? T22 : enq_row;
  assign T22 = enq_row + 32'h1;
  assign T23 = io_enq & T24;
  assign T24 = enq_row < 32'h6;
  assign T25 = io_enq & T26;
  assign T26 = T24 ^ 1'h1;
  assign T27 = T19 ? io_data_in : 24'hdead;
  assign T28 = T29 ? io_deq : 1'h0;
  assign T29 = deq_row == 32'h5;
  assign T30 = T31 ? io_enq : 1'h0;
  assign T31 = enq_row == 32'h5;
  assign T32 = T31 ? io_data_in : 24'hdead;
  assign T33 = T34 ? io_deq : 1'h0;
  assign T34 = deq_row == 32'h4;
  assign T35 = T36 ? io_enq : 1'h0;
  assign T36 = enq_row == 32'h4;
  assign T37 = T36 ? io_data_in : 24'hdead;
  assign T38 = T39 ? io_deq : 1'h0;
  assign T39 = deq_row == 32'h3;
  assign T40 = T41 ? io_enq : 1'h0;
  assign T41 = enq_row == 32'h3;
  assign T42 = T41 ? io_data_in : 24'hdead;
  assign T43 = T44 ? io_deq : 1'h0;
  assign T44 = deq_row == 32'h2;
  assign T45 = T46 ? io_enq : 1'h0;
  assign T46 = enq_row == 32'h2;
  assign T47 = T46 ? io_data_in : 24'hdead;
  assign T48 = T49 ? io_deq : 1'h0;
  assign T49 = deq_row == 32'h1;
  assign T50 = T51 ? io_enq : 1'h0;
  assign T51 = enq_row == 32'h1;
  assign T52 = T51 ? io_data_in : 24'hdead;
  assign T53 = T54 ? io_deq : 1'h0;
  assign T54 = deq_row == 32'h0;
  assign T55 = T56 ? io_enq : 1'h0;
  assign T56 = enq_row == 32'h0;
  assign T57 = T56 ? io_data_in : 24'hdead;
  assign io_dbg_enq_count = enq_performed;
  assign T82 = reset ? 32'h0 : T58;
  assign T58 = T61 ? 32'h0 : T59;
  assign T59 = io_enq ? T60 : enq_performed;
  assign T60 = enq_performed + 32'h1;
  assign T61 = io_enq & T62;
  assign T62 = enq_performed == 32'h117f;
  assign io_dbg_row_deq_count = row_deq_count;
  assign io_dbg_deq_row = deq_row;
  assign io_dbg_enq_row = enq_row;
  assign io_data_out = T63;
  assign T63 = T1 ? RowBuffer_6_io_data_out : T64;
  assign T64 = T29 ? RowBuffer_5_io_data_out : T65;
  assign T65 = T34 ? RowBuffer_4_io_data_out : T66;
  assign T66 = T39 ? RowBuffer_3_io_data_out : T67;
  assign T67 = T44 ? RowBuffer_2_io_data_out : T68;
  assign T68 = T49 ? RowBuffer_1_io_data_out : T69;
  assign T69 = T54 ? RowBuffer_io_data_out : 24'hdead;
  assign io_can_deq = T70;
  assign T70 = mode == 1'h0;
  assign T83 = reset ? 1'h1 : T71;
  assign T71 = T61 ? 1'h0 : T72;
  assign T72 = T73 ? 1'h1 : mode;
  assign T73 = io_deq & T74;
  assign T74 = deq_performed == 32'h117f;
  assign T84 = reset ? 32'h0 : T75;
  assign T75 = T73 ? 32'h0 : T76;
  assign T76 = io_deq ? T77 : deq_performed;
  assign T77 = deq_performed + 32'h1;
  assign io_can_enq = T78;
  assign T78 = mode == 1'h1;
  RowBuffer RowBuffer(.clk(clk), .reset(reset),
       //.io_reset(  )
       .io_data_in( T57 ),
       .io_push( T55 ),
       .io_pop( T53 ),
       .io_data_out( RowBuffer_io_data_out )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign RowBuffer.io_reset = {1{$random}};
// synthesis translate_on
`endif
  RowBuffer RowBuffer_1(.clk(clk), .reset(reset),
       //.io_reset(  )
       .io_data_in( T52 ),
       .io_push( T50 ),
       .io_pop( T48 ),
       .io_data_out( RowBuffer_1_io_data_out )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign RowBuffer_1.io_reset = {1{$random}};
// synthesis translate_on
`endif
  RowBuffer RowBuffer_2(.clk(clk), .reset(reset),
       //.io_reset(  )
       .io_data_in( T47 ),
       .io_push( T45 ),
       .io_pop( T43 ),
       .io_data_out( RowBuffer_2_io_data_out )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign RowBuffer_2.io_reset = {1{$random}};
// synthesis translate_on
`endif
  RowBuffer RowBuffer_3(.clk(clk), .reset(reset),
       //.io_reset(  )
       .io_data_in( T42 ),
       .io_push( T40 ),
       .io_pop( T38 ),
       .io_data_out( RowBuffer_3_io_data_out )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign RowBuffer_3.io_reset = {1{$random}};
// synthesis translate_on
`endif
  RowBuffer RowBuffer_4(.clk(clk), .reset(reset),
       //.io_reset(  )
       .io_data_in( T37 ),
       .io_push( T35 ),
       .io_pop( T33 ),
       .io_data_out( RowBuffer_4_io_data_out )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign RowBuffer_4.io_reset = {1{$random}};
// synthesis translate_on
`endif
  RowBuffer RowBuffer_5(.clk(clk), .reset(reset),
       //.io_reset(  )
       .io_data_in( T32 ),
       .io_push( T30 ),
       .io_pop( T28 ),
       .io_data_out( RowBuffer_5_io_data_out )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign RowBuffer_5.io_reset = {1{$random}};
// synthesis translate_on
`endif
  RowBuffer RowBuffer_6(.clk(clk), .reset(reset),
       //.io_reset(  )
       .io_data_in( T27 ),
       .io_push( T18 ),
       .io_pop( T0 ),
       .io_data_out( RowBuffer_6_io_data_out )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign RowBuffer_6.io_reset = {1{$random}};
// synthesis translate_on
`endif

  always @(posedge clk) begin
    if(reset) begin
      deq_row <= 32'h0;
    end else if(T16) begin
      deq_row <= 32'h0;
    end else if(T5) begin
      deq_row <= T4;
    end
    if(reset) begin
      row_deq_count <= 32'h0;
    end else if(T14) begin
      row_deq_count <= T13;
    end else if(T11) begin
      row_deq_count <= 32'h0;
    end else if(T7) begin
      row_deq_count <= 32'h0;
    end
    if(reset) begin
      enq_row <= 32'h0;
    end else if(T25) begin
      enq_row <= 32'h0;
    end else if(T23) begin
      enq_row <= T22;
    end
    if(reset) begin
      enq_performed <= 32'h0;
    end else if(T61) begin
      enq_performed <= 32'h0;
    end else if(io_enq) begin
      enq_performed <= T60;
    end
    if(reset) begin
      mode <= 1'h1;
    end else if(T61) begin
      mode <= 1'h0;
    end else if(T73) begin
      mode <= 1'h1;
    end
    if(reset) begin
      deq_performed <= 32'h0;
    end else if(T73) begin
      deq_performed <= 32'h0;
    end else if(io_deq) begin
      deq_performed <= T77;
    end
  end
endmodule

module OutputHandler(input clk, input reset,
    input [23:0] io_data_in,
    input  io_input_valid,
    output io_ready_for_input,
    input  io_request_output,
    output io_output_ready,
    output io_output_valid,
    //output io_frame_finished
    output[23:0] io_data_out,
    output[31:0] io_dbg_enq_row,
    output[31:0] io_dbg_deq_row,
    output[31:0] io_dbg_row_deq_count,
    output[31:0] io_dbg_enq_count
);

  wire output_buffer_io_can_enq;
  wire output_buffer_io_can_deq;
  wire[23:0] output_buffer_io_data_out;
  wire[31:0] output_buffer_io_dbg_enq_row;
  wire[31:0] output_buffer_io_dbg_deq_row;
  wire[31:0] output_buffer_io_dbg_row_deq_count;
  wire[31:0] output_buffer_io_dbg_enq_count;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_frame_finished = {1{$random}};
// synthesis translate_on
`endif
  assign io_dbg_enq_count = output_buffer_io_dbg_enq_count;
  assign io_dbg_row_deq_count = output_buffer_io_dbg_row_deq_count;
  assign io_dbg_deq_row = output_buffer_io_dbg_deq_row;
  assign io_dbg_enq_row = output_buffer_io_dbg_enq_row;
  assign io_data_out = output_buffer_io_data_out;
  assign io_output_valid = output_buffer_io_can_deq;
  assign io_output_ready = output_buffer_io_can_deq;
  assign io_ready_for_input = output_buffer_io_can_enq;
  SliceReverseBuffer output_buffer(.clk(clk), .reset(reset),
       .io_data_in( io_data_in ),
       .io_enq( io_input_valid ),
       .io_deq( io_request_output ),
       .io_can_enq( output_buffer_io_can_enq ),
       .io_can_deq( output_buffer_io_can_deq ),
       .io_data_out( output_buffer_io_data_out ),
       .io_dbg_enq_row( output_buffer_io_dbg_enq_row ),
       .io_dbg_deq_row( output_buffer_io_dbg_deq_row ),
       .io_dbg_row_deq_count( output_buffer_io_dbg_row_deq_count ),
       .io_dbg_enq_count( output_buffer_io_dbg_enq_count )
  );
endmodule

module Tile(input clk, input reset,
    input [23:0] io_control_data_in,
    input  io_control_input_valid,
    input [23:0] io_hdmi_data_in,
    input  io_hdmi_input_valid,
    input  io_reset,
    output[23:0] io_data_out,
    output io_output_ready,
    output io_output_valid,
    input  io_request_processed_data,
    output io_dbg_rdy_for_output,
    output io_dbg_rdy_for_input
);

  wire T0;
  wire T1;
  wire[23:0] SystemControl_io_processor_control_input;
  wire SystemControl_io_processor_control_input_valid;
  wire SystemControl_io_processor_output_is_valid;
  wire SystemControl_io_processor_sleep;
  wire SystemControl_io_processor_configure;
  wire[23:0] Processor_io_ALU_data_out;
  wire Processor_io_ALU_data_is_valid;
  wire OutputHandler_io_ready_for_input;
  wire OutputHandler_io_output_ready;
  wire OutputHandler_io_output_valid;
  wire[23:0] OutputHandler_io_data_out;
  wire[23:0] InputHandler_io_data_out;
  wire InputHandler_io_data_ready;


  assign T0 = ~ SystemControl_io_processor_configure;
  assign T1 = io_reset | SystemControl_io_processor_configure;
  assign io_dbg_rdy_for_input = OutputHandler_io_ready_for_input;
  assign io_dbg_rdy_for_output = OutputHandler_io_output_ready;
  assign io_output_valid = OutputHandler_io_output_valid;
  assign io_output_ready = OutputHandler_io_output_ready;
  assign io_data_out = OutputHandler_io_data_out;
  InputHandler InputHandler(.clk(clk), .reset(reset),
       .io_reset( T1 ),
       .io_data_mode( T0 ),
       .io_output_buffer_ready( OutputHandler_io_ready_for_input ),
       .io_input_ready( io_hdmi_input_valid ),
       .io_data_in( io_hdmi_data_in ),
       .io_data_out( InputHandler_io_data_out ),
       .io_data_ready( InputHandler_io_data_ready )
  );
  Processor Processor(.clk(clk), .reset(reset),
       .io_pixel_in( InputHandler_io_data_out ),
       .io_processor_configure( SystemControl_io_processor_configure ),
       .io_control_data_in( SystemControl_io_processor_control_input ),
       .io_processor_sleep( SystemControl_io_processor_sleep ),
       .io_input_valid( SystemControl_io_processor_control_input_valid ),
       .io_ALU_data_out( Processor_io_ALU_data_out ),
       .io_ALU_data_is_valid( Processor_io_ALU_data_is_valid )
  );
  TileController SystemControl(.clk(clk), .reset(reset),
       .io_reset( io_reset ),
       .io_control_data_in( io_control_data_in ),
       .io_control_input_valid( io_control_input_valid ),
       .io_processor_control_input( SystemControl_io_processor_control_input ),
       .io_processor_control_input_valid( SystemControl_io_processor_control_input_valid ),
       .io_processor_input_is_valid( InputHandler_io_data_ready ),
       .io_ALU_output_is_valid( Processor_io_ALU_data_is_valid ),
       .io_processor_output_is_valid( SystemControl_io_processor_output_is_valid ),
       .io_processor_sleep( SystemControl_io_processor_sleep ),
       .io_processor_configure( SystemControl_io_processor_configure )
       //.io_dbg_processor_valid_output_count(  )
  );
  OutputHandler OutputHandler(.clk(clk), .reset(reset),
       .io_data_in( Processor_io_ALU_data_out ),
       .io_input_valid( SystemControl_io_processor_output_is_valid ),
       .io_ready_for_input( OutputHandler_io_ready_for_input ),
       .io_request_output( io_request_processed_data ),
       .io_output_ready( OutputHandler_io_output_ready ),
       .io_output_valid( OutputHandler_io_output_valid ),
       //.io_frame_finished(  )
       .io_data_out( OutputHandler_io_data_out )
       //.io_dbg_enq_row(  )
       //.io_dbg_deq_row(  )
       //.io_dbg_row_deq_count(  )
       //.io_dbg_enq_count(  )
  );
endmodule

