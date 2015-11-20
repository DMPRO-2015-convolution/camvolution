module RowBuffer(input clk, input reset,
    input [23:0] io_data_in,
    input  io_push,
    input  io_pop,
    output[23:0] io_data_out
);

  wire T0;
  wire T1;
  reg [9:0] stack_top;
  wire[9:0] T9;
  wire[9:0] T2;
  wire[9:0] T3;
  wire[9:0] T4;
  wire T5;
  wire T6;
  wire[9:0] T7;
  wire[9:0] T8;
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
  assign T9 = reset ? 10'h0 : T2;
  assign T2 = T0 ? T7 : T3;
  assign T3 = T5 ? T4 : stack_top;
  assign T4 = stack_top - 10'h1;
  assign T5 = io_pop & T6;
  assign T6 = 10'h0 <= stack_top;
  assign T7 = stack_top + 10'h1;
  assign T8 = stack_top - 10'h1;
  assign io_data_out = DualPortBRAM_b_dout;
  DualPortBRAM # (
    .DATA(24),
    .ADDR(10)
  ) DualPortBRAM(.clk(clk),
       .b_addr( T8 ),
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
      stack_top <= T7;
    end else if(T5) begin
      stack_top <= T4;
    end
  end
endmodule

module SliceBuffer(input clk, input reset,
    input [23:0] io_data_in,
    input  io_push,
    input  io_pop,
    output[23:0] io_data_out
);

  wire T0;
  wire T1;
  reg [31:0] pop_row;
  wire[31:0] T76;
  wire[31:0] T2;
  wire[31:0] T3;
  wire[31:0] T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  reg [31:0] push_row;
  wire[31:0] T77;
  wire[31:0] T11;
  wire[31:0] T12;
  wire[31:0] T13;
  wire T14;
  wire T15;
  wire T16;
  reg [31:0] push_top;
  wire[31:0] T78;
  wire[31:0] T17;
  wire[31:0] T18;
  wire T19;
  wire T20;
  wire[31:0] T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire[23:0] T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire[23:0] T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire[23:0] T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire[23:0] T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire[23:0] T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire[23:0] T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire[23:0] T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire[23:0] T61;
  wire T62;
  wire T63;
  wire T64;
  wire T65;
  wire[23:0] T66;
  wire[23:0] T67;
  wire[23:0] T68;
  wire[23:0] T69;
  wire[23:0] T70;
  wire[23:0] T71;
  wire[23:0] T72;
  wire[23:0] T73;
  wire[23:0] T74;
  wire[23:0] T75;
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
  assign T76 = reset ? 32'h0 : T2;
  assign T2 = T7 ? 32'h0 : T3;
  assign T3 = T5 ? T4 : pop_row;
  assign T4 = pop_row + 32'h1;
  assign T5 = io_pop & T6;
  assign T6 = pop_row < 32'h8;
  assign T7 = io_pop & T8;
  assign T8 = T6 ^ 1'h1;
  assign T9 = T10 ? io_push : 1'h0;
  assign T10 = push_row == 32'h8;
  assign T77 = reset ? 32'h0 : T11;
  assign T11 = T24 ? 32'h0 : T12;
  assign T12 = T14 ? T13 : push_row;
  assign T13 = push_row + 32'h1;
  assign T14 = T16 & T15;
  assign T15 = push_row < 32'h9;
  assign T16 = push_top == 32'h27f;
  assign T78 = reset ? 32'h0 : T17;
  assign T17 = T22 ? T21 : T18;
  assign T18 = T19 ? 32'h0 : push_top;
  assign T19 = io_push & T20;
  assign T20 = push_top == 32'h27f;
  assign T21 = push_top + 32'h1;
  assign T22 = io_push & T23;
  assign T23 = T20 ^ 1'h1;
  assign T24 = T16 & T25;
  assign T25 = T15 ^ 1'h1;
  assign T26 = T10 ? io_data_in : 24'h0;
  assign T27 = T28 ? io_pop : 1'h0;
  assign T28 = pop_row == 32'h7;
  assign T29 = T30 ? io_push : 1'h0;
  assign T30 = push_row == 32'h7;
  assign T31 = T30 ? io_data_in : 24'h0;
  assign T32 = T33 ? io_pop : 1'h0;
  assign T33 = pop_row == 32'h6;
  assign T34 = T35 ? io_push : 1'h0;
  assign T35 = push_row == 32'h6;
  assign T36 = T35 ? io_data_in : 24'h0;
  assign T37 = T38 ? io_pop : 1'h0;
  assign T38 = pop_row == 32'h5;
  assign T39 = T40 ? io_push : 1'h0;
  assign T40 = push_row == 32'h5;
  assign T41 = T40 ? io_data_in : 24'h0;
  assign T42 = T43 ? io_pop : 1'h0;
  assign T43 = pop_row == 32'h4;
  assign T44 = T45 ? io_push : 1'h0;
  assign T45 = push_row == 32'h4;
  assign T46 = T45 ? io_data_in : 24'h0;
  assign T47 = T48 ? io_pop : 1'h0;
  assign T48 = pop_row == 32'h3;
  assign T49 = T50 ? io_push : 1'h0;
  assign T50 = push_row == 32'h3;
  assign T51 = T50 ? io_data_in : 24'h0;
  assign T52 = T53 ? io_pop : 1'h0;
  assign T53 = pop_row == 32'h2;
  assign T54 = T55 ? io_push : 1'h0;
  assign T55 = push_row == 32'h2;
  assign T56 = T55 ? io_data_in : 24'h0;
  assign T57 = T58 ? io_pop : 1'h0;
  assign T58 = pop_row == 32'h1;
  assign T59 = T60 ? io_push : 1'h0;
  assign T60 = push_row == 32'h1;
  assign T61 = T60 ? io_data_in : 24'h0;
  assign T62 = T63 ? io_pop : 1'h0;
  assign T63 = pop_row == 32'h0;
  assign T64 = T65 ? io_push : 1'h0;
  assign T65 = push_row == 32'h0;
  assign T66 = T65 ? io_data_in : 24'h0;
  assign io_data_out = T67;
  assign T67 = T1 ? RowBuffer_7_io_data_out : T68;
  assign T68 = T28 ? RowBuffer_6_io_data_out : T69;
  assign T69 = T33 ? RowBuffer_5_io_data_out : T70;
  assign T70 = T38 ? RowBuffer_4_io_data_out : T71;
  assign T71 = T43 ? RowBuffer_3_io_data_out : T72;
  assign T72 = T48 ? RowBuffer_2_io_data_out : T73;
  assign T73 = T53 ? RowBuffer_1_io_data_out : T74;
  assign T74 = T58 ? RowBuffer_io_data_out : T75;
  assign T75 = T63 ? RowBuffer_8_io_data_out : 24'hdead;
  RowBuffer RowBuffer(.clk(clk), .reset(reset),
       .io_data_in( T66 ),
       .io_push( T64 ),
       .io_pop( T62 ),
       .io_data_out( RowBuffer_io_data_out )
  );
  RowBuffer RowBuffer_1(.clk(clk), .reset(reset),
       .io_data_in( T61 ),
       .io_push( T59 ),
       .io_pop( T57 ),
       .io_data_out( RowBuffer_1_io_data_out )
  );
  RowBuffer RowBuffer_2(.clk(clk), .reset(reset),
       .io_data_in( T56 ),
       .io_push( T54 ),
       .io_pop( T52 ),
       .io_data_out( RowBuffer_2_io_data_out )
  );
  RowBuffer RowBuffer_3(.clk(clk), .reset(reset),
       .io_data_in( T51 ),
       .io_push( T49 ),
       .io_pop( T47 ),
       .io_data_out( RowBuffer_3_io_data_out )
  );
  RowBuffer RowBuffer_4(.clk(clk), .reset(reset),
       .io_data_in( T46 ),
       .io_push( T44 ),
       .io_pop( T42 ),
       .io_data_out( RowBuffer_4_io_data_out )
  );
  RowBuffer RowBuffer_5(.clk(clk), .reset(reset),
       .io_data_in( T41 ),
       .io_push( T39 ),
       .io_pop( T37 ),
       .io_data_out( RowBuffer_5_io_data_out )
  );
  RowBuffer RowBuffer_6(.clk(clk), .reset(reset),
       .io_data_in( T36 ),
       .io_push( T34 ),
       .io_pop( T32 ),
       .io_data_out( RowBuffer_6_io_data_out )
  );
  RowBuffer RowBuffer_7(.clk(clk), .reset(reset),
       .io_data_in( T31 ),
       .io_push( T29 ),
       .io_pop( T27 ),
       .io_data_out( RowBuffer_7_io_data_out )
  );
  RowBuffer RowBuffer_8(.clk(clk), .reset(reset),
       .io_data_in( T26 ),
       .io_push( T9 ),
       .io_pop( T0 ),
       .io_data_out( RowBuffer_8_io_data_out )
  );

  always @(posedge clk) begin
    if(reset) begin
      pop_row <= 32'h0;
    end else if(T7) begin
      pop_row <= 32'h0;
    end else if(T5) begin
      pop_row <= T4;
    end
    if(reset) begin
      push_row <= 32'h0;
    end else if(T24) begin
      push_row <= 32'h0;
    end else if(T14) begin
      push_row <= T13;
    end
    if(reset) begin
      push_top <= 32'h0;
    end else if(T22) begin
      push_top <= T21;
    end else if(T19) begin
      push_top <= 32'h0;
    end
  end
endmodule

module SliceDoubleBuffer(input clk, input reset,
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
  wire T41;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  reg  writes_finished;
  wire T42;
  wire T8;
  wire T9;
  wire T10;
  reg [31:0] writes_performed;
  wire[31:0] T43;
  wire[31:0] T11;
  wire[31:0] T12;
  wire[31:0] T13;
  wire[31:0] T14;
  wire T15;
  wire T16;
  wire[31:0] T17;
  wire T18;
  wire T19;
  reg  reads_finished;
  wire T44;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  reg [31:0] reads_performed;
  wire[31:0] T45;
  wire[31:0] T24;
  wire[31:0] T25;
  wire[31:0] T26;
  wire[31:0] T27;
  wire T28;
  wire[31:0] T29;
  wire T30;
  wire T31;
  wire[23:0] T32;
  wire[23:0] T33;
  wire T34;
  wire T35;
  wire T36;
  wire[23:0] T37;
  wire[23:0] T38;
  wire T39;
  wire T40;
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
  assign T41 = reset ? 1'h0 : T3;
  assign T3 = T30 ? 1'h0 : T4;
  assign T4 = T5 ? 1'h1 : current;
  assign T5 = T7 & T6;
  assign T6 = current == 1'h0;
  assign T7 = reads_finished & writes_finished;
  assign T42 = reset ? 1'h1 : T8;
  assign T8 = T7 ? 1'h0 : T9;
  assign T9 = T10 ? 1'h1 : writes_finished;
  assign T10 = writes_performed == 32'h1680;
  assign T43 = reset ? 32'h0 : T11;
  assign T11 = T7 ? 32'h0 : T12;
  assign T12 = T18 ? T17 : T13;
  assign T13 = T15 ? T14 : writes_performed;
  assign T14 = writes_performed + 32'h1;
  assign T15 = io_slave_drive_output & T16;
  assign T16 = current == 1'h1;
  assign T17 = writes_performed + 32'h1;
  assign T18 = io_slave_drive_output & T19;
  assign T19 = T16 ^ 1'h1;
  assign T44 = reset ? 1'h0 : T20;
  assign T20 = T7 ? 1'h0 : T21;
  assign T21 = T22 ? 1'h1 : reads_finished;
  assign T22 = io_slave_read_input & T23;
  assign T23 = reads_performed == 32'h167f;
  assign T45 = reset ? 32'h0 : T24;
  assign T24 = T7 ? 32'h0 : T25;
  assign T25 = T0 ? T29 : T26;
  assign T26 = T28 ? T27 : reads_performed;
  assign T27 = reads_performed + 32'h1;
  assign T28 = io_slave_read_input & T2;
  assign T29 = reads_performed + 32'h1;
  assign T30 = T7 & T31;
  assign T31 = T6 ^ 1'h1;
  assign T32 = T0 ? io_data_in : 24'h0;
  assign T33 = T28 ? io_data_in : 24'h0;
  assign io_error = T34;
  assign T34 = T36 | T35;
  assign T35 = 32'h1680 < writes_performed;
  assign T36 = 32'h1680 < reads_performed;
  assign io_data_out = T37;
  assign T37 = T18 ? slice2_io_data_out : T38;
  assign T38 = T15 ? slice1_io_data_out : 24'h0;
  assign io_slave_can_drive_output = T39;
  assign T39 = writes_finished ^ 1'h1;
  assign io_slave_can_read_input = T40;
  assign T40 = reads_finished ^ 1'h1;
  SliceBuffer slice1(.clk(clk), .reset(reset),
       .io_data_in( T33 ),
       .io_push( T28 ),
       .io_pop( T15 ),
       .io_data_out( slice1_io_data_out )
  );
  SliceBuffer slice2(.clk(clk), .reset(reset),
       .io_data_in( T32 ),
       .io_push( T0 ),
       .io_pop( 1'h0 ),
       .io_data_out( slice2_io_data_out )
  );

  always @(posedge clk) begin
    if(reset) begin
      current <= 1'h0;
    end else if(T30) begin
      current <= 1'h0;
    end else if(T5) begin
      current <= 1'h1;
    end
    if(reset) begin
      writes_finished <= 1'h1;
    end else if(T7) begin
      writes_finished <= 1'h0;
    end else if(T10) begin
      writes_finished <= 1'h1;
    end
    if(reset) begin
      writes_performed <= 32'h0;
    end else if(T7) begin
      writes_performed <= 32'h0;
    end else if(T18) begin
      writes_performed <= T17;
    end else if(T15) begin
      writes_performed <= T14;
    end
    if(reset) begin
      reads_finished <= 1'h0;
    end else if(T7) begin
      reads_finished <= 1'h0;
    end else if(T22) begin
      reads_finished <= 1'h1;
    end
    if(reset) begin
      reads_performed <= 32'h0;
    end else if(T7) begin
      reads_performed <= 32'h0;
    end else if(T0) begin
      reads_performed <= T29;
    end else if(T28) begin
      reads_performed <= T27;
    end
  end
endmodule

module InputHandler(input clk, input reset,
    input  io_input_ready,
    input [15:0] io_data_in,
    output[23:0] io_data_out,
    output io_data_ready
);

  wire[23:0] T2;
  wire[15:0] T0;
  wire[23:0] T1;
  wire input_buffer_io_slave_can_drive_output;
  wire[23:0] input_buffer_io_data_out;


  assign T2 = {8'h0, T0};
  assign T0 = io_input_ready ? io_data_in : 16'hdead;
  assign io_data_ready = input_buffer_io_slave_can_drive_output;
  assign io_data_out = T1;
  assign T1 = input_buffer_io_slave_can_drive_output ? input_buffer_io_data_out : 24'hdead;
  SliceDoubleBuffer input_buffer(.clk(clk), .reset(reset),
       .io_data_in( T2 ),
       .io_slave_read_input( io_input_ready ),
       .io_slave_drive_output( input_buffer_io_slave_can_drive_output ),
       //.io_slave_can_read_input(  )
       .io_slave_can_drive_output( input_buffer_io_slave_can_drive_output ),
       .io_data_out( input_buffer_io_data_out )
       //.io_error(  )
  );
endmodule

module PixelReg(input clk, input reset,
    input [23:0] io_data_in,
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
  assign T2 = enable ? io_data_in : data;

  always @(posedge clk) begin
    if(reset) begin
      enable <= 1'h0;
    end else if(T1) begin
      enable <= io_enable_in;
    end
    if(reset) begin
      data <= 24'h0;
    end else if(enable) begin
      data <= io_data_in;
    end
  end
endmodule

module Mux3(input clk, input reset,
    input [23:0] io_data_in_2,
    input [23:0] io_data_in_1,
    input [23:0] io_data_in_0,
    input  io_enable_in,
    input  io_stall,
    output[23:0] io_data_out,
    output io_enable_out,
    output[23:0] io_dbg_enable
);

  reg [23:0] state;
  wire[23:0] T0;
  wire[23:0] T21;
  wire[23:0] T1;
  wire[23:0] T2;
  wire[23:0] T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire[23:0] T10;
  wire T11;
  wire T12;
  reg [23:0] balancer;
  wire[23:0] T13;
  wire[23:0] T14;
  wire[23:0] T15;
  wire[23:0] T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    balancer = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
  assign T0 = {1{$random}};
// synthesis translate_on
`endif
  assign io_dbg_enable = state;
  assign T21 = reset ? T0 : T1;
  assign T1 = T11 ? T10 : T2;
  assign T2 = T4 ? 24'h0 : T3;
  assign T3 = io_enable_in ? 24'h1 : state;
  assign T4 = T6 & T5;
  assign T5 = state == 24'h3;
  assign T6 = T9 & T7;
  assign T7 = T8 ^ 1'h1;
  assign T8 = state == 24'h0;
  assign T9 = io_stall ^ 1'h1;
  assign T10 = state + 24'h1;
  assign T11 = T6 & T12;
  assign T12 = T5 ^ 1'h1;
  assign io_enable_out = T4;
  assign io_data_out = balancer;
  assign T13 = T20 ? 24'hdead : T14;
  assign T14 = T19 ? io_data_in_2 : T15;
  assign T15 = T18 ? io_data_in_1 : T16;
  assign T16 = T17 ? io_data_in_0 : balancer;
  assign T17 = 24'h1 == state;
  assign T18 = 24'h2 == state;
  assign T19 = 24'h3 == state;
  assign T20 = 24'h0 == state;

  always @(posedge clk) begin
    if(reset) begin
      state <= T0;
    end else if(T11) begin
      state <= T10;
    end else if(T4) begin
      state <= 24'h0;
    end else if(io_enable_in) begin
      state <= 24'h1;
    end
    if(T20) begin
      balancer <= 24'hdead;
    end else if(T19) begin
      balancer <= io_data_in_2;
    end else if(T18) begin
      balancer <= io_data_in_1;
    end else if(T17) begin
      balancer <= io_data_in_0;
    end
  end
endmodule

module PixelArray(input clk, input reset,
    input [23:0] io_data_in_2,
    input [23:0] io_data_in_1,
    input [23:0] io_data_in_0,
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
  wire[23:0] Mux3_io_data_out;
  wire Mux3_io_enable_out;
  wire[23:0] Mux3_1_io_data_out;
  wire Mux3_1_io_enable_out;
  wire[23:0] Mux3_2_io_data_out;


  assign io_dbg_reg_contents_0 = PixelReg_io_data_out;
  assign io_dbg_reg_contents_1 = PixelReg_1_io_data_out;
  assign io_dbg_reg_contents_2 = PixelReg_2_io_data_out;
  assign io_dbg_reg_contents_3 = PixelReg_3_io_data_out;
  assign io_dbg_reg_contents_4 = PixelReg_4_io_data_out;
  assign io_dbg_reg_contents_5 = PixelReg_5_io_data_out;
  assign io_dbg_reg_contents_6 = PixelReg_6_io_data_out;
  assign io_dbg_reg_contents_7 = PixelReg_7_io_data_out;
  assign io_dbg_reg_contents_8 = PixelReg_8_io_data_out;
  assign io_data_out_0 = Mux3_io_data_out;
  assign io_data_out_1 = Mux3_1_io_data_out;
  assign io_data_out_2 = Mux3_2_io_data_out;
  PixelReg PixelReg(.clk(clk), .reset(reset),
       .io_data_in( io_data_in_0 ),
       .io_enable_in( io_ping_read ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_io_data_out ),
       .io_enable_out( PixelReg_io_enable_out )
  );
  PixelReg PixelReg_1(.clk(clk), .reset(reset),
       .io_data_in( io_data_in_0 ),
       .io_enable_in( PixelReg_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_1_io_data_out ),
       .io_enable_out( PixelReg_1_io_enable_out )
  );
  PixelReg PixelReg_2(.clk(clk), .reset(reset),
       .io_data_in( io_data_in_0 ),
       .io_enable_in( PixelReg_1_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_2_io_data_out ),
       .io_enable_out( PixelReg_2_io_enable_out )
  );
  PixelReg PixelReg_3(.clk(clk), .reset(reset),
       .io_data_in( io_data_in_1 ),
       .io_enable_in( PixelReg_2_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_3_io_data_out ),
       .io_enable_out( PixelReg_3_io_enable_out )
  );
  PixelReg PixelReg_4(.clk(clk), .reset(reset),
       .io_data_in( io_data_in_1 ),
       .io_enable_in( PixelReg_3_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_4_io_data_out ),
       .io_enable_out( PixelReg_4_io_enable_out )
  );
  PixelReg PixelReg_5(.clk(clk), .reset(reset),
       .io_data_in( io_data_in_1 ),
       .io_enable_in( PixelReg_4_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_5_io_data_out ),
       .io_enable_out( PixelReg_5_io_enable_out )
  );
  PixelReg PixelReg_6(.clk(clk), .reset(reset),
       .io_data_in( io_data_in_2 ),
       .io_enable_in( PixelReg_5_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_6_io_data_out ),
       .io_enable_out( PixelReg_6_io_enable_out )
  );
  PixelReg PixelReg_7(.clk(clk), .reset(reset),
       .io_data_in( io_data_in_2 ),
       .io_enable_in( PixelReg_6_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_7_io_data_out ),
       .io_enable_out( PixelReg_7_io_enable_out )
  );
  PixelReg PixelReg_8(.clk(clk), .reset(reset),
       .io_data_in( io_data_in_2 ),
       .io_enable_in( PixelReg_7_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( PixelReg_8_io_data_out )
       //.io_enable_out(  )
  );
  Mux3 Mux3(.clk(clk), .reset(reset),
       .io_data_in_2( PixelReg_2_io_data_out ),
       .io_data_in_1( PixelReg_1_io_data_out ),
       .io_data_in_0( PixelReg_io_data_out ),
       .io_enable_in( io_ping_mux ),
       .io_stall( io_stall ),
       .io_data_out( Mux3_io_data_out ),
       .io_enable_out( Mux3_io_enable_out )
       //.io_dbg_enable(  )
  );
  Mux3 Mux3_1(.clk(clk), .reset(reset),
       .io_data_in_2( PixelReg_5_io_data_out ),
       .io_data_in_1( PixelReg_4_io_data_out ),
       .io_data_in_0( PixelReg_3_io_data_out ),
       .io_enable_in( Mux3_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( Mux3_1_io_data_out ),
       .io_enable_out( Mux3_1_io_enable_out )
       //.io_dbg_enable(  )
  );
  Mux3 Mux3_2(.clk(clk), .reset(reset),
       .io_data_in_2( PixelReg_8_io_data_out ),
       .io_data_in_1( PixelReg_7_io_data_out ),
       .io_data_in_0( PixelReg_6_io_data_out ),
       .io_enable_in( Mux3_1_io_enable_out ),
       .io_stall( io_stall ),
       .io_data_out( Mux3_2_io_data_out )
       //.io_enable_out(  )
       //.io_dbg_enable(  )
  );
endmodule

module ShiftMux3_0(input clk, input reset,
    input [23:0] io_data_in_2,
    input [23:0] io_data_in_1,
    input [23:0] io_data_in_0,
    input  io_shift,
    input  io_stall,
    output[23:0] io_data_out,
    output[23:0] io_dbg_state
);

  reg [23:0] state;
  wire[23:0] T15;
  wire[23:0] T0;
  wire[23:0] T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire[23:0] T6;
  wire T7;
  wire T8;
  reg [23:0] balancer;
  wire[23:0] T9;
  wire[23:0] T10;
  wire[23:0] T11;
  wire T12;
  wire T13;
  wire T14;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    balancer = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_state = state;
  assign T15 = reset ? 24'h0 : T0;
  assign T0 = T7 ? T6 : T1;
  assign T1 = T2 ? 24'h0 : state;
  assign T2 = T4 & T3;
  assign T3 = state == 24'h2;
  assign T4 = T5 & io_shift;
  assign T5 = io_stall ^ 1'h1;
  assign T6 = state + 24'h1;
  assign T7 = T4 & T8;
  assign T8 = T3 ^ 1'h1;
  assign io_data_out = balancer;
  assign T9 = T14 ? io_data_in_2 : T10;
  assign T10 = T13 ? io_data_in_1 : T11;
  assign T11 = T12 ? io_data_in_0 : balancer;
  assign T12 = 24'h0 == state;
  assign T13 = 24'h1 == state;
  assign T14 = 24'h2 == state;

  always @(posedge clk) begin
    if(reset) begin
      state <= 24'h0;
    end else if(T7) begin
      state <= T6;
    end else if(T2) begin
      state <= 24'h0;
    end
    if(T14) begin
      balancer <= io_data_in_2;
    end else if(T13) begin
      balancer <= io_data_in_1;
    end else if(T12) begin
      balancer <= io_data_in_0;
    end
  end
endmodule

module ShiftMux3_1(input clk, input reset,
    input [23:0] io_data_in_2,
    input [23:0] io_data_in_1,
    input [23:0] io_data_in_0,
    input  io_shift,
    input  io_stall,
    output[23:0] io_data_out,
    output[23:0] io_dbg_state
);

  reg [23:0] state;
  wire[23:0] T15;
  wire[23:0] T0;
  wire[23:0] T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire[23:0] T6;
  wire T7;
  wire T8;
  reg [23:0] balancer;
  wire[23:0] T9;
  wire[23:0] T10;
  wire[23:0] T11;
  wire T12;
  wire T13;
  wire T14;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    balancer = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_state = state;
  assign T15 = reset ? 24'h1 : T0;
  assign T0 = T7 ? T6 : T1;
  assign T1 = T2 ? 24'h0 : state;
  assign T2 = T4 & T3;
  assign T3 = state == 24'h2;
  assign T4 = T5 & io_shift;
  assign T5 = io_stall ^ 1'h1;
  assign T6 = state + 24'h1;
  assign T7 = T4 & T8;
  assign T8 = T3 ^ 1'h1;
  assign io_data_out = balancer;
  assign T9 = T14 ? io_data_in_2 : T10;
  assign T10 = T13 ? io_data_in_1 : T11;
  assign T11 = T12 ? io_data_in_0 : balancer;
  assign T12 = 24'h0 == state;
  assign T13 = 24'h1 == state;
  assign T14 = 24'h2 == state;

  always @(posedge clk) begin
    if(reset) begin
      state <= 24'h1;
    end else if(T7) begin
      state <= T6;
    end else if(T2) begin
      state <= 24'h0;
    end
    if(T14) begin
      balancer <= io_data_in_2;
    end else if(T13) begin
      balancer <= io_data_in_1;
    end else if(T12) begin
      balancer <= io_data_in_0;
    end
  end
endmodule

module ShiftMux3_2(input clk, input reset,
    input [23:0] io_data_in_2,
    input [23:0] io_data_in_1,
    input [23:0] io_data_in_0,
    input  io_shift,
    input  io_stall,
    output[23:0] io_data_out,
    output[23:0] io_dbg_state
);

  reg [23:0] state;
  wire[23:0] T15;
  wire[23:0] T0;
  wire[23:0] T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire[23:0] T6;
  wire T7;
  wire T8;
  reg [23:0] balancer;
  wire[23:0] T9;
  wire[23:0] T10;
  wire[23:0] T11;
  wire T12;
  wire T13;
  wire T14;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    balancer = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_dbg_state = state;
  assign T15 = reset ? 24'h2 : T0;
  assign T0 = T7 ? T6 : T1;
  assign T1 = T2 ? 24'h0 : state;
  assign T2 = T4 & T3;
  assign T3 = state == 24'h2;
  assign T4 = T5 & io_shift;
  assign T5 = io_stall ^ 1'h1;
  assign T6 = state + 24'h1;
  assign T7 = T4 & T8;
  assign T8 = T3 ^ 1'h1;
  assign io_data_out = balancer;
  assign T9 = T14 ? io_data_in_2 : T10;
  assign T10 = T13 ? io_data_in_1 : T11;
  assign T11 = T12 ? io_data_in_0 : balancer;
  assign T12 = 24'h0 == state;
  assign T13 = 24'h1 == state;
  assign T14 = 24'h2 == state;

  always @(posedge clk) begin
    if(reset) begin
      state <= 24'h2;
    end else if(T7) begin
      state <= T6;
    end else if(T2) begin
      state <= 24'h0;
    end
    if(T14) begin
      balancer <= io_data_in_2;
    end else if(T13) begin
      balancer <= io_data_in_1;
    end else if(T12) begin
      balancer <= io_data_in_0;
    end
  end
endmodule

module PixelGrid(input clk, input reset,
    input [23:0] io_data_in,
    input  io_read_row_2,
    input  io_read_row_1,
    input  io_read_row_0,
    input  io_mux_row_2,
    input  io_mux_row_1,
    input  io_mux_row_0,
    input  io_shift_mux,
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
  wire[23:0] ShiftMux3_io_data_out;
  wire[23:0] ShiftMux3_1_io_data_out;
  wire[23:0] ShiftMux3_2_io_data_out;
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

  assign T0 = reset ? 24'h0 : io_data_in;
  assign T1 = reset ? 24'h0 : io_data_in;
  assign T2 = reset ? 24'h0 : io_data_in;
  assign io_data_out_0 = ShiftMux3_io_data_out;
  assign io_data_out_1 = ShiftMux3_1_io_data_out;
  assign io_data_out_2 = ShiftMux3_2_io_data_out;
  PixelArray PixelArray(.clk(clk), .reset(reset),
       .io_data_in_2( input_tree_2 ),
       .io_data_in_1( input_tree_1 ),
       .io_data_in_0( input_tree_0 ),
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
       .io_data_in_2( PixelArray_io_data_out_2 ),
       .io_data_in_1( PixelArray_io_data_out_1 ),
       .io_data_in_0( PixelArray_io_data_out_0 ),
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
       .io_data_in_2( PixelArray_1_io_data_out_2 ),
       .io_data_in_1( PixelArray_1_io_data_out_1 ),
       .io_data_in_0( PixelArray_1_io_data_out_0 ),
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
  ShiftMux3_0 ShiftMux3(.clk(clk), .reset(reset),
       .io_data_in_2( PixelArray_io_data_out_2 ),
       .io_data_in_1( PixelArray_io_data_out_1 ),
       .io_data_in_0( PixelArray_io_data_out_0 ),
       .io_shift( io_shift_mux ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux3_1 ShiftMux3_1(.clk(clk), .reset(reset),
       .io_data_in_2( PixelArray_1_io_data_out_2 ),
       .io_data_in_1( PixelArray_1_io_data_out_1 ),
       .io_data_in_0( PixelArray_1_io_data_out_0 ),
       .io_shift( io_shift_mux ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_1_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux3_2 ShiftMux3_2(.clk(clk), .reset(reset),
       .io_data_in_2( PixelArray_2_io_data_out_2 ),
       .io_data_in_1( PixelArray_2_io_data_out_1 ),
       .io_data_in_0( PixelArray_2_io_data_out_0 ),
       .io_shift( io_shift_mux ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_2_io_data_out )
       //.io_dbg_state(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      input_tree_0 <= 24'h0;
    end else begin
      input_tree_0 <= io_data_in;
    end
    if(reset) begin
      input_tree_1 <= 24'h0;
    end else begin
      input_tree_1 <= io_data_in;
    end
    if(reset) begin
      input_tree_2 <= 24'h0;
    end else begin
      input_tree_2 <= io_data_in;
    end
  end
endmodule

module Orchestrator(input clk, input reset,
    input  io_stall,
    output io_read_row_2,
    output io_read_row_1,
    output io_read_row_0,
    output io_mux_row_2,
    output io_mux_row_1,
    output io_mux_row_0,
    output io_shift_mux,
    output io_accumulator_flush,
    output io_ALU_shift
);

  wire T0;
  wire T1;
  wire T2;
  reg [7:0] time_;
  wire[7:0] T31;
  wire[7:0] T3;
  wire[7:0] T4;
  wire T5;
  wire T6;
  wire T7;
  wire[7:0] T8;
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

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    time_ = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ALU_shift = T0;
  assign T0 = T12 ? 1'h1 : T1;
  assign T1 = T11 ? 1'h1 : T2;
  assign T2 = time_ == 8'h0;
  assign T31 = reset ? 8'h0 : T3;
  assign T3 = T9 ? T8 : T4;
  assign T4 = T5 ? 8'h0 : time_;
  assign T5 = T7 & T6;
  assign T6 = time_ == 8'h8;
  assign T7 = io_stall ^ 1'h1;
  assign T8 = time_ + 8'h1;
  assign T9 = T7 & T10;
  assign T10 = T6 ^ 1'h1;
  assign T11 = time_ == 8'h3;
  assign T12 = time_ == 8'h6;
  assign io_accumulator_flush = T13;
  assign T13 = time_ == 8'h2;
  assign io_shift_mux = T14;
  assign T14 = T18 ? 1'h1 : T15;
  assign T15 = T17 ? 1'h1 : T16;
  assign T16 = time_ == 8'h0;
  assign T17 = time_ == 8'h3;
  assign T18 = time_ == 8'h6;
  assign io_mux_row_0 = T19;
  assign T19 = T20 ? 1'h1 : 1'h0;
  assign T20 = time_ == 8'h5;
  assign io_mux_row_1 = T21;
  assign T21 = T22 ? 1'h1 : 1'h0;
  assign T22 = time_ == 8'h2;
  assign io_mux_row_2 = T23;
  assign T23 = T24 ? 1'h1 : 1'h0;
  assign T24 = time_ == 8'h8;
  assign io_read_row_0 = T25;
  assign T25 = T26 ? 1'h1 : 1'h0;
  assign T26 = time_ == 8'h0;
  assign io_read_row_1 = T27;
  assign T27 = T28 ? 1'h1 : 1'h0;
  assign T28 = time_ == 8'h6;
  assign io_read_row_2 = T29;
  assign T29 = T30 ? 1'h1 : 1'h0;
  assign T30 = time_ == 8'h3;

  always @(posedge clk) begin
    if(reset) begin
      time_ <= 8'h0;
    end else if(T9) begin
      time_ <= T8;
    end else if(T5) begin
      time_ <= 8'h0;
    end
  end
endmodule

module KernelController(input clk, input reset,
    input  io_kernel_valid,
    input [23:0] io_kernel_in,
    input  io_stall,
    output[23:0] io_kernel_out,
    output io_freeze_kernels
);

  wire T0;
  wire T1;
  wire T2;
  reg  state;
  wire T17;
  wire T3;
  wire T4;
  wire T5;
  reg [31:0] kernel_count;
  wire[31:0] T18;
  wire[31:0] T6;
  wire[31:0] T7;
  wire T8;
  wire[23:0] T9;
  wire[23:0] T10;
  reg [23:0] kernel_buffer_1;
  wire[23:0] T19;
  wire[23:0] T11;
  wire[23:0] T12;
  reg [23:0] kernel_buffer_0;
  wire[23:0] T20;
  wire[24:0] T21;
  wire[24:0] T13;
  wire[24:0] T22;
  wire[24:0] T14;
  wire[24:0] T15;
  wire T16;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
    kernel_count = {1{$random}};
    kernel_buffer_1 = {1{$random}};
    kernel_buffer_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_freeze_kernels = T0;
  assign T0 = T2 & T1;
  assign T1 = io_kernel_valid ^ 1'h1;
  assign T2 = state == 1'h0;
  assign T17 = reset ? 1'h0 : T3;
  assign T3 = T4 ? 1'h1 : state;
  assign T4 = T2 & T5;
  assign T5 = kernel_count == 32'h8;
  assign T18 = reset ? 32'h0 : T6;
  assign T6 = T8 ? T7 : kernel_count;
  assign T7 = kernel_count + 32'h1;
  assign T8 = T2 & io_kernel_valid;
  assign io_kernel_out = T9;
  assign T9 = T16 ? kernel_buffer_1 : T10;
  assign T10 = T16 ? kernel_buffer_1 : 24'hdead;
  assign T19 = reset ? 24'h0 : T11;
  assign T11 = T16 ? kernel_buffer_0 : T12;
  assign T12 = T8 ? kernel_buffer_0 : kernel_buffer_1;
  assign T20 = T21[5'h17:1'h0];
  assign T21 = reset ? 25'h0 : T13;
  assign T13 = T8 ? T14 : T22;
  assign T22 = {1'h0, kernel_buffer_0};
  assign T14 = T15;
  assign T15 = {1'h0, io_kernel_in};
  assign T16 = state == 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      state <= 1'h0;
    end else if(T4) begin
      state <= 1'h1;
    end
    if(reset) begin
      kernel_count <= 32'h0;
    end else if(T8) begin
      kernel_count <= T7;
    end
    if(reset) begin
      kernel_buffer_1 <= 24'h0;
    end else if(T16) begin
      kernel_buffer_1 <= kernel_buffer_0;
    end else if(T8) begin
      kernel_buffer_1 <= kernel_buffer_0;
    end
    kernel_buffer_0 <= T20;
  end
endmodule

module Mapper(input clk,
    input [23:0] io_pixel_in,
    input [23:0] io_kernel_in,
    input  io_stall,
    output[23:0] io_mapped_pixel,
    output[23:0] io_kernel_out
);

  wire[23:0] T37;
  wire[24:0] T0;
  wire[24:0] T38;
  wire[16:0] T1;
  wire[7:0] T39;
  wire T40;
  wire[24:0] T2;
  wire[24:0] T3;
  reg [23:0] kernel;
  wire[23:0] T4;
  wire T5;
  wire[23:0] T41;
  wire[48:0] T6;
  wire[48:0] T7;
  wire[47:0] T8;
  wire[47:0] T9;
  wire[31:0] T10;
  wire[31:0] T11;
  wire[7:0] color3;
  wire[47:0] T42;
  wire[40:0] T12;
  wire[40:0] T43;
  wire[23:0] T13;
  wire[23:0] T14;
  wire[23:0] T15;
  wire[40:0] T16;
  wire[40:0] T17;
  wire[39:0] T18;
  wire[39:0] T19;
  wire[31:0] T20;
  wire[31:0] T21;
  wire[7:0] color2;
  wire[39:0] T44;
  wire[32:0] T22;
  wire[32:0] T45;
  wire[23:0] T23;
  wire[23:0] T24;
  wire[23:0] T25;
  wire[32:0] T26;
  wire[32:0] T27;
  wire[31:0] T28;
  wire[31:0] T29;
  wire[31:0] T30;
  wire[31:0] T31;
  wire[7:0] color1;
  wire[31:0] T46;
  wire[23:0] T32;
  wire[23:0] T33;
  wire[23:0] T34;
  wire[23:0] T35;
  wire[23:0] T47;
  wire[1:0] T36;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    kernel = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_kernel_out = T37;
  assign T37 = T0[5'h17:1'h0];
  assign T0 = T5 ? T2 : T38;
  assign T38 = {T39, T1};
  assign T1 = 17'hdead;
  assign T39 = T40 ? 8'hff : 8'h0;
  assign T40 = T1[5'h10:5'h10];
  assign T2 = T3;
  assign T3 = {1'h0, kernel};
  assign T4 = T5 ? io_kernel_in : kernel;
  assign T5 = io_stall ^ 1'h1;
  assign io_mapped_pixel = T41;
  assign T41 = T6[5'h17:1'h0];
  assign T6 = T7;
  assign T7 = {1'h0, T8};
  assign T8 = T42 | T9;
  assign T9 = T10 << 5'h10;
  assign T10 = T11 & 32'hff;
  assign T11 = color3 * kernel;
  assign color3 = io_pixel_in[5'h17:5'h10];
  assign T42 = {7'h0, T12};
  assign T12 = T16 & T43;
  assign T43 = {17'h0, T13};
  assign T13 = ~ T14;
  assign T14 = 24'hff0000 | T15;
  assign T15 = io_mapped_pixel ^ io_mapped_pixel;
  assign T16 = T17;
  assign T17 = {1'h0, T18};
  assign T18 = T44 | T19;
  assign T19 = T20 << 4'h8;
  assign T20 = T21 & 32'hff;
  assign T21 = color2 * kernel;
  assign color2 = io_pixel_in[4'hf:4'h8];
  assign T44 = {7'h0, T22};
  assign T22 = T26 & T45;
  assign T45 = {9'h0, T23};
  assign T23 = ~ T24;
  assign T24 = 24'hff00 | T25;
  assign T25 = io_mapped_pixel ^ io_mapped_pixel;
  assign T26 = T27;
  assign T27 = {1'h0, T28};
  assign T28 = T46 | T29;
  assign T29 = T30 << 1'h0;
  assign T30 = T31 & 32'hff;
  assign T31 = color1 * kernel;
  assign color1 = io_pixel_in[3'h7:1'h0];
  assign T46 = {8'h0, T32};
  assign T32 = T47 & T33;
  assign T33 = ~ T34;
  assign T34 = 24'hff | T35;
  assign T35 = io_mapped_pixel ^ io_mapped_pixel;
  assign T47 = {22'h0, T36};
  assign T36 = 2'h0;

  always @(posedge clk) begin
    if(T5) begin
      kernel <= io_kernel_in;
    end
  end
endmodule

module Reducer(input clk, input reset,
    input [23:0] io_mapped_pixel,
    input  io_flush,
    input  io_stall,
    output[23:0] io_data_out
    //output io_valid_out
);

  reg [23:0] accumulator;
  wire[23:0] T74;
  wire[29:0] T75;
  wire[29:0] T0;
  wire[29:0] T76;
  wire[28:0] T1;
  wire[28:0] T77;
  wire[27:0] T2;
  wire[27:0] T78;
  wire[26:0] T3;
  wire[26:0] T79;
  wire[25:0] T4;
  wire[25:0] T80;
  wire[24:0] T5;
  wire[24:0] T81;
  wire[23:0] T6;
  wire[23:0] T7;
  wire[23:0] T8;
  wire T9;
  wire[24:0] T10;
  wire[24:0] T11;
  wire[23:0] T12;
  wire[23:0] T82;
  wire[7:0] T13;
  wire[7:0] T14;
  wire[7:0] color1;
  wire[23:0] T15;
  wire[23:0] T16;
  wire[23:0] T17;
  wire[23:0] T18;
  wire[25:0] T19;
  wire[25:0] T20;
  wire[24:0] T21;
  wire[24:0] T83;
  wire[15:0] T22;
  wire[7:0] T23;
  wire[7:0] color2;
  wire[24:0] T24;
  wire[24:0] T84;
  wire[23:0] T25;
  wire[23:0] T26;
  wire[23:0] T27;
  wire[26:0] T28;
  wire[26:0] T29;
  wire[25:0] T30;
  wire[25:0] T85;
  wire[23:0] T31;
  wire[7:0] T32;
  wire[7:0] color3;
  wire[25:0] T33;
  wire[25:0] T86;
  wire[23:0] T34;
  wire[23:0] T35;
  wire[23:0] T36;
  wire T37;
  wire T38;
  wire[27:0] T39;
  wire[27:0] T40;
  wire[26:0] T41;
  wire[26:0] T87;
  wire[7:0] T42;
  wire[7:0] T43;
  wire[7:0] T44;
  wire[7:0] T45;
  wire[26:0] T46;
  wire[26:0] T88;
  wire[23:0] T47;
  wire[23:0] T48;
  wire[23:0] T49;
  wire[28:0] T50;
  wire[28:0] T51;
  wire[27:0] T52;
  wire[27:0] T89;
  wire[15:0] T53;
  wire[7:0] T54;
  wire[7:0] T55;
  wire[7:0] T56;
  wire[27:0] T57;
  wire[27:0] T90;
  wire[23:0] T58;
  wire[23:0] T59;
  wire[23:0] T60;
  wire[29:0] T61;
  wire[29:0] T62;
  wire[28:0] T63;
  wire[28:0] T91;
  wire[23:0] T64;
  wire[7:0] T65;
  wire[7:0] T66;
  wire[7:0] T67;
  wire[28:0] T68;
  wire[28:0] T92;
  wire[23:0] T69;
  wire[23:0] T70;
  wire[23:0] T71;
  wire T72;
  wire T73;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    accumulator = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_valid_out = {1{$random}};
// synthesis translate_on
`endif
  assign io_data_out = accumulator;
  assign T74 = T75[5'h17:1'h0];
  assign T75 = reset ? 30'h0 : T0;
  assign T0 = T72 ? T61 : T76;
  assign T76 = {1'h0, T1};
  assign T1 = T72 ? T50 : T77;
  assign T77 = {1'h0, T2};
  assign T2 = T72 ? T39 : T78;
  assign T78 = {1'h0, T3};
  assign T3 = T37 ? T28 : T79;
  assign T79 = {1'h0, T4};
  assign T4 = T37 ? T19 : T80;
  assign T80 = {1'h0, T5};
  assign T5 = T37 ? T10 : T81;
  assign T81 = {1'h0, T6};
  assign T6 = T9 ? T8 : T7;
  assign T7 = io_flush ? io_mapped_pixel : accumulator;
  assign T8 = accumulator + io_mapped_pixel;
  assign T9 = io_flush ^ 1'h1;
  assign T10 = T11;
  assign T11 = {1'h0, T12};
  assign T12 = T15 | T82;
  assign T82 = {16'h0, T13};
  assign T13 = T14 << 1'h0;
  assign T14 = color1 & 8'hff;
  assign color1 = io_mapped_pixel[3'h7:1'h0];
  assign T15 = T6 & T16;
  assign T16 = ~ T17;
  assign T17 = 24'hff | T18;
  assign T18 = accumulator ^ accumulator;
  assign T19 = T20;
  assign T20 = {1'h0, T21};
  assign T21 = T24 | T83;
  assign T83 = {9'h0, T22};
  assign T22 = T23 << 4'h8;
  assign T23 = color2 & 8'hff;
  assign color2 = io_mapped_pixel[4'hf:4'h8];
  assign T24 = T5 & T84;
  assign T84 = {1'h0, T25};
  assign T25 = ~ T26;
  assign T26 = 24'hff00 | T27;
  assign T27 = accumulator ^ accumulator;
  assign T28 = T29;
  assign T29 = {1'h0, T30};
  assign T30 = T33 | T85;
  assign T85 = {2'h0, T31};
  assign T31 = T32 << 5'h10;
  assign T32 = color3 & 8'hff;
  assign color3 = io_mapped_pixel[5'h17:5'h10];
  assign T33 = T4 & T86;
  assign T86 = {2'h0, T34};
  assign T34 = ~ T35;
  assign T35 = 24'hff0000 | T36;
  assign T36 = accumulator ^ accumulator;
  assign T37 = T38 & io_flush;
  assign T38 = io_stall ^ 1'h1;
  assign T39 = T40;
  assign T40 = {1'h0, T41};
  assign T41 = T46 | T87;
  assign T87 = {19'h0, T42};
  assign T42 = T43 << 1'h0;
  assign T43 = T44 & 8'hff;
  assign T44 = T45 + color1;
  assign T45 = accumulator[3'h7:1'h0];
  assign T46 = T3 & T88;
  assign T88 = {3'h0, T47};
  assign T47 = ~ T48;
  assign T48 = 24'hff | T49;
  assign T49 = accumulator ^ accumulator;
  assign T50 = T51;
  assign T51 = {1'h0, T52};
  assign T52 = T57 | T89;
  assign T89 = {12'h0, T53};
  assign T53 = T54 << 4'h8;
  assign T54 = T55 & 8'hff;
  assign T55 = T56 + color2;
  assign T56 = accumulator[4'hf:4'h8];
  assign T57 = T2 & T90;
  assign T90 = {4'h0, T58};
  assign T58 = ~ T59;
  assign T59 = 24'hff00 | T60;
  assign T60 = accumulator ^ accumulator;
  assign T61 = T62;
  assign T62 = {1'h0, T63};
  assign T63 = T68 | T91;
  assign T91 = {5'h0, T64};
  assign T64 = T65 << 5'h10;
  assign T65 = T66 & 8'hff;
  assign T66 = T67 + color3;
  assign T67 = accumulator[5'h17:5'h10];
  assign T68 = T1 & T92;
  assign T92 = {5'h0, T69};
  assign T69 = ~ T70;
  assign T70 = 24'hff0000 | T71;
  assign T71 = accumulator ^ accumulator;
  assign T72 = T38 & T73;
  assign T73 = io_flush ^ 1'h1;

  always @(posedge clk) begin
    accumulator <= T74;
  end
endmodule

module ALUrow(input clk, input reset,
    input [23:0] io_data_in_2,
    input [23:0] io_data_in_1,
    input [23:0] io_data_in_0,
    input [23:0] io_kernel_in,
    input  io_accumulator_flush,
    input  io_selector_shift,
    input  io_stall,
    output[23:0] io_data_out,
    output[23:0] io_kernel_out,
    output io_valid_out
);

  reg  shift_enablers_7;
  reg  shift_enablers_6;
  reg  shift_enablers_5;
  reg  shift_enablers_4;
  reg  shift_enablers_3;
  reg  shift_enablers_2;
  reg  shift_enablers_1;
  reg  shift_enablers_0;
  reg  flush_signals_7;
  reg  flush_signals_6;
  reg  flush_signals_5;
  reg  flush_signals_4;
  reg  flush_signals_3;
  reg  flush_signals_2;
  reg  flush_signals_1;
  reg  flush_signals_0;
  wire T0;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire[23:0] T7;
  wire[23:0] T8;
  wire[23:0] T9;
  wire[23:0] T10;
  wire[23:0] T11;
  wire[23:0] T12;
  wire[23:0] T13;
  wire[23:0] T14;
  wire[23:0] Mapper_io_mapped_pixel;
  wire[23:0] Mapper_io_kernel_out;
  wire[23:0] Mapper_1_io_mapped_pixel;
  wire[23:0] Mapper_1_io_kernel_out;
  wire[23:0] Mapper_2_io_mapped_pixel;
  wire[23:0] Mapper_2_io_kernel_out;
  wire[23:0] Mapper_3_io_mapped_pixel;
  wire[23:0] Mapper_3_io_kernel_out;
  wire[23:0] Mapper_4_io_mapped_pixel;
  wire[23:0] Mapper_4_io_kernel_out;
  wire[23:0] Mapper_5_io_mapped_pixel;
  wire[23:0] Mapper_5_io_kernel_out;
  wire[23:0] Mapper_6_io_mapped_pixel;
  wire[23:0] Mapper_6_io_kernel_out;
  wire[23:0] Mapper_7_io_mapped_pixel;
  wire[23:0] Mapper_7_io_kernel_out;
  wire[23:0] Reducer_io_data_out;
  wire[23:0] Reducer_1_io_data_out;
  wire[23:0] Reducer_2_io_data_out;
  wire[23:0] Reducer_3_io_data_out;
  wire[23:0] Reducer_4_io_data_out;
  wire[23:0] Reducer_5_io_data_out;
  wire[23:0] Reducer_6_io_data_out;
  wire[23:0] Reducer_7_io_data_out;
  wire[23:0] ShiftMux3_io_data_out;
  wire[23:0] ShiftMux3_1_io_data_out;
  wire[23:0] ShiftMux3_2_io_data_out;
  wire[23:0] ShiftMux3_3_io_data_out;
  wire[23:0] ShiftMux3_4_io_data_out;
  wire[23:0] ShiftMux3_5_io_data_out;
  wire[23:0] ShiftMux3_6_io_data_out;
  wire[23:0] ShiftMux3_7_io_data_out;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    shift_enablers_7 = {1{$random}};
    shift_enablers_6 = {1{$random}};
    shift_enablers_5 = {1{$random}};
    shift_enablers_4 = {1{$random}};
    shift_enablers_3 = {1{$random}};
    shift_enablers_2 = {1{$random}};
    shift_enablers_1 = {1{$random}};
    shift_enablers_0 = {1{$random}};
    flush_signals_7 = {1{$random}};
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

  assign io_valid_out = T0;
  assign T0 = flush_signals_7 ? 1'h1 : T1;
  assign T1 = flush_signals_6 ? 1'h1 : T2;
  assign T2 = flush_signals_5 ? 1'h1 : T3;
  assign T3 = flush_signals_4 ? 1'h1 : T4;
  assign T4 = flush_signals_3 ? 1'h1 : T5;
  assign T5 = flush_signals_2 ? 1'h1 : T6;
  assign T6 = flush_signals_1 ? 1'h1 : flush_signals_0;
  assign io_kernel_out = Mapper_7_io_kernel_out;
  assign io_data_out = T7;
  assign T7 = flush_signals_7 ? Reducer_7_io_data_out : T8;
  assign T8 = flush_signals_6 ? Reducer_6_io_data_out : T9;
  assign T9 = flush_signals_5 ? Reducer_5_io_data_out : T10;
  assign T10 = flush_signals_4 ? Reducer_4_io_data_out : T11;
  assign T11 = flush_signals_3 ? Reducer_3_io_data_out : T12;
  assign T12 = flush_signals_2 ? Reducer_2_io_data_out : T13;
  assign T13 = flush_signals_1 ? Reducer_1_io_data_out : T14;
  assign T14 = flush_signals_0 ? Reducer_io_data_out : 24'hdead;
  Mapper Mapper(.clk(clk),
       .io_pixel_in( ShiftMux3_io_data_out ),
       .io_kernel_in( io_kernel_in ),
       .io_stall( io_stall ),
       .io_mapped_pixel( Mapper_io_mapped_pixel ),
       .io_kernel_out( Mapper_io_kernel_out )
  );
  Mapper Mapper_1(.clk(clk),
       .io_pixel_in( ShiftMux3_1_io_data_out ),
       .io_kernel_in( Mapper_io_kernel_out ),
       .io_stall( io_stall ),
       .io_mapped_pixel( Mapper_1_io_mapped_pixel ),
       .io_kernel_out( Mapper_1_io_kernel_out )
  );
  Mapper Mapper_2(.clk(clk),
       .io_pixel_in( ShiftMux3_2_io_data_out ),
       .io_kernel_in( Mapper_1_io_kernel_out ),
       .io_stall( io_stall ),
       .io_mapped_pixel( Mapper_2_io_mapped_pixel ),
       .io_kernel_out( Mapper_2_io_kernel_out )
  );
  Mapper Mapper_3(.clk(clk),
       .io_pixel_in( ShiftMux3_3_io_data_out ),
       .io_kernel_in( Mapper_2_io_kernel_out ),
       .io_stall( io_stall ),
       .io_mapped_pixel( Mapper_3_io_mapped_pixel ),
       .io_kernel_out( Mapper_3_io_kernel_out )
  );
  Mapper Mapper_4(.clk(clk),
       .io_pixel_in( ShiftMux3_4_io_data_out ),
       .io_kernel_in( Mapper_3_io_kernel_out ),
       .io_stall( io_stall ),
       .io_mapped_pixel( Mapper_4_io_mapped_pixel ),
       .io_kernel_out( Mapper_4_io_kernel_out )
  );
  Mapper Mapper_5(.clk(clk),
       .io_pixel_in( ShiftMux3_5_io_data_out ),
       .io_kernel_in( Mapper_4_io_kernel_out ),
       .io_stall( io_stall ),
       .io_mapped_pixel( Mapper_5_io_mapped_pixel ),
       .io_kernel_out( Mapper_5_io_kernel_out )
  );
  Mapper Mapper_6(.clk(clk),
       .io_pixel_in( ShiftMux3_6_io_data_out ),
       .io_kernel_in( Mapper_5_io_kernel_out ),
       .io_stall( io_stall ),
       .io_mapped_pixel( Mapper_6_io_mapped_pixel ),
       .io_kernel_out( Mapper_6_io_kernel_out )
  );
  Mapper Mapper_7(.clk(clk),
       .io_pixel_in( ShiftMux3_7_io_data_out ),
       .io_kernel_in( Mapper_6_io_kernel_out ),
       .io_stall( io_stall ),
       .io_mapped_pixel( Mapper_7_io_mapped_pixel ),
       .io_kernel_out( Mapper_7_io_kernel_out )
  );
  Reducer Reducer(.clk(clk), .reset(reset),
       .io_mapped_pixel( Mapper_io_mapped_pixel ),
       .io_flush( flush_signals_0 ),
       //.io_stall(  )
       .io_data_out( Reducer_io_data_out )
       //.io_valid_out(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign Reducer.io_stall = {1{$random}};
// synthesis translate_on
`endif
  Reducer Reducer_1(.clk(clk), .reset(reset),
       .io_mapped_pixel( Mapper_1_io_mapped_pixel ),
       .io_flush( flush_signals_1 ),
       //.io_stall(  )
       .io_data_out( Reducer_1_io_data_out )
       //.io_valid_out(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign Reducer_1.io_stall = {1{$random}};
// synthesis translate_on
`endif
  Reducer Reducer_2(.clk(clk), .reset(reset),
       .io_mapped_pixel( Mapper_2_io_mapped_pixel ),
       .io_flush( flush_signals_2 ),
       //.io_stall(  )
       .io_data_out( Reducer_2_io_data_out )
       //.io_valid_out(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign Reducer_2.io_stall = {1{$random}};
// synthesis translate_on
`endif
  Reducer Reducer_3(.clk(clk), .reset(reset),
       .io_mapped_pixel( Mapper_3_io_mapped_pixel ),
       .io_flush( flush_signals_3 ),
       //.io_stall(  )
       .io_data_out( Reducer_3_io_data_out )
       //.io_valid_out(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign Reducer_3.io_stall = {1{$random}};
// synthesis translate_on
`endif
  Reducer Reducer_4(.clk(clk), .reset(reset),
       .io_mapped_pixel( Mapper_4_io_mapped_pixel ),
       .io_flush( flush_signals_4 ),
       //.io_stall(  )
       .io_data_out( Reducer_4_io_data_out )
       //.io_valid_out(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign Reducer_4.io_stall = {1{$random}};
// synthesis translate_on
`endif
  Reducer Reducer_5(.clk(clk), .reset(reset),
       .io_mapped_pixel( Mapper_5_io_mapped_pixel ),
       .io_flush( flush_signals_5 ),
       //.io_stall(  )
       .io_data_out( Reducer_5_io_data_out )
       //.io_valid_out(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign Reducer_5.io_stall = {1{$random}};
// synthesis translate_on
`endif
  Reducer Reducer_6(.clk(clk), .reset(reset),
       .io_mapped_pixel( Mapper_6_io_mapped_pixel ),
       .io_flush( flush_signals_6 ),
       //.io_stall(  )
       .io_data_out( Reducer_6_io_data_out )
       //.io_valid_out(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign Reducer_6.io_stall = {1{$random}};
// synthesis translate_on
`endif
  Reducer Reducer_7(.clk(clk), .reset(reset),
       .io_mapped_pixel( Mapper_7_io_mapped_pixel ),
       .io_flush( flush_signals_7 ),
       //.io_stall(  )
       .io_data_out( Reducer_7_io_data_out )
       //.io_valid_out(  )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign Reducer_7.io_stall = {1{$random}};
// synthesis translate_on
`endif
  ShiftMux3_0 ShiftMux3(.clk(clk), .reset(reset),
       .io_data_in_2( io_data_in_2 ),
       .io_data_in_1( io_data_in_1 ),
       .io_data_in_0( io_data_in_0 ),
       .io_shift( shift_enablers_0 ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux3_0 ShiftMux3_1(.clk(clk), .reset(reset),
       .io_data_in_2( io_data_in_2 ),
       .io_data_in_1( io_data_in_1 ),
       .io_data_in_0( io_data_in_0 ),
       .io_shift( shift_enablers_1 ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_1_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux3_0 ShiftMux3_2(.clk(clk), .reset(reset),
       .io_data_in_2( io_data_in_2 ),
       .io_data_in_1( io_data_in_1 ),
       .io_data_in_0( io_data_in_0 ),
       .io_shift( shift_enablers_2 ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_2_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux3_0 ShiftMux3_3(.clk(clk), .reset(reset),
       .io_data_in_2( io_data_in_2 ),
       .io_data_in_1( io_data_in_1 ),
       .io_data_in_0( io_data_in_0 ),
       .io_shift( shift_enablers_3 ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_3_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux3_0 ShiftMux3_4(.clk(clk), .reset(reset),
       .io_data_in_2( io_data_in_2 ),
       .io_data_in_1( io_data_in_1 ),
       .io_data_in_0( io_data_in_0 ),
       .io_shift( shift_enablers_4 ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_4_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux3_0 ShiftMux3_5(.clk(clk), .reset(reset),
       .io_data_in_2( io_data_in_2 ),
       .io_data_in_1( io_data_in_1 ),
       .io_data_in_0( io_data_in_0 ),
       .io_shift( shift_enablers_5 ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_5_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux3_0 ShiftMux3_6(.clk(clk), .reset(reset),
       .io_data_in_2( io_data_in_2 ),
       .io_data_in_1( io_data_in_1 ),
       .io_data_in_0( io_data_in_0 ),
       .io_shift( shift_enablers_6 ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_6_io_data_out )
       //.io_dbg_state(  )
  );
  ShiftMux3_0 ShiftMux3_7(.clk(clk), .reset(reset),
       .io_data_in_2( io_data_in_2 ),
       .io_data_in_1( io_data_in_1 ),
       .io_data_in_0( io_data_in_0 ),
       .io_shift( shift_enablers_7 ),
       .io_stall( io_stall ),
       .io_data_out( ShiftMux3_7_io_data_out )
       //.io_dbg_state(  )
  );

  always @(posedge clk) begin
    shift_enablers_7 <= shift_enablers_6;
    shift_enablers_6 <= shift_enablers_5;
    shift_enablers_5 <= shift_enablers_4;
    shift_enablers_4 <= shift_enablers_3;
    shift_enablers_3 <= shift_enablers_2;
    shift_enablers_2 <= shift_enablers_1;
    shift_enablers_1 <= shift_enablers_0;
    shift_enablers_0 <= io_selector_shift;
    flush_signals_7 <= flush_signals_6;
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
    input  io_stall,
    input  io_input_ready,
    input [23:0] io_data_in,
    output[23:0] io_ALU_data_out,
    output io_ALU_data_is_valid
);

  wire[23:0] T2;
  wire[24:0] T0;
  wire[24:0] T1;
  wire processor_control_io_read_row_2;
  wire processor_control_io_read_row_1;
  wire processor_control_io_read_row_0;
  wire processor_control_io_mux_row_2;
  wire processor_control_io_mux_row_1;
  wire processor_control_io_mux_row_0;
  wire processor_control_io_shift_mux;
  wire processor_control_io_accumulator_flush;
  wire processor_control_io_ALU_shift;
  wire[23:0] kernel_control_io_kernel_out;
  wire[23:0] ALUs_io_data_out;
  wire ALUs_io_valid_out;
  wire[23:0] conveyor_io_data_out_2;
  wire[23:0] conveyor_io_data_out_1;
  wire[23:0] conveyor_io_data_out_0;


  assign T2 = T0[5'h17:1'h0];
  assign T0 = T1;
  assign T1 = {1'h0, kernel_control_io_kernel_out};
  assign io_ALU_data_is_valid = ALUs_io_valid_out;
  assign io_ALU_data_out = ALUs_io_data_out;
  PixelGrid conveyor(.clk(clk), .reset(reset),
       .io_data_in( io_data_in ),
       .io_read_row_2( processor_control_io_read_row_2 ),
       .io_read_row_1( processor_control_io_read_row_1 ),
       .io_read_row_0( processor_control_io_read_row_0 ),
       .io_mux_row_2( processor_control_io_mux_row_2 ),
       .io_mux_row_1( processor_control_io_mux_row_1 ),
       .io_mux_row_0( processor_control_io_mux_row_0 ),
       .io_shift_mux( processor_control_io_shift_mux ),
       .io_stall( io_stall ),
       .io_data_out_2( conveyor_io_data_out_2 ),
       .io_data_out_1( conveyor_io_data_out_1 ),
       .io_data_out_0( conveyor_io_data_out_0 )
  );
  Orchestrator processor_control(.clk(clk), .reset(reset),
       .io_stall( io_stall ),
       .io_read_row_2( processor_control_io_read_row_2 ),
       .io_read_row_1( processor_control_io_read_row_1 ),
       .io_read_row_0( processor_control_io_read_row_0 ),
       .io_mux_row_2( processor_control_io_mux_row_2 ),
       .io_mux_row_1( processor_control_io_mux_row_1 ),
       .io_mux_row_0( processor_control_io_mux_row_0 ),
       .io_shift_mux( processor_control_io_shift_mux ),
       .io_accumulator_flush( processor_control_io_accumulator_flush ),
       .io_ALU_shift( processor_control_io_ALU_shift )
  );
  KernelController kernel_control(.clk(clk), .reset(reset),
       .io_kernel_valid( io_input_ready ),
       .io_kernel_in( io_data_in ),
       .io_stall( io_stall ),
       .io_kernel_out( kernel_control_io_kernel_out )
       //.io_freeze_kernels(  )
  );
  ALUrow ALUs(.clk(clk), .reset(reset),
       .io_data_in_2( conveyor_io_data_out_0 ),
       .io_data_in_1( conveyor_io_data_out_1 ),
       .io_data_in_0( conveyor_io_data_out_2 ),
       .io_kernel_in( T2 ),
       .io_accumulator_flush( processor_control_io_accumulator_flush ),
       .io_selector_shift( processor_control_io_ALU_shift ),
       .io_stall( io_stall ),
       .io_data_out( ALUs_io_data_out ),
       //.io_kernel_out(  )
       .io_valid_out( ALUs_io_valid_out )
  );
endmodule

module TileController(input clk, input reset,
    input  io_processor_input_is_valid,
    input  io_ALU_output_is_valid,
    input [23:0] io_ALU_output,
    output io_processor_output_is_valid,
    output[23:0] io_processor_output
);

  wire[23:0] T0;
  wire[23:0] T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  reg [31:0] valid_processor_input_count;
  wire[31:0] T27;
  wire[31:0] T6;
  wire[31:0] T7;
  wire[31:0] T8;
  wire T9;
  wire T10;
  wire T11;
  reg [31:0] valid_processor_output_count;
  wire[31:0] T28;
  wire[31:0] T12;
  wire[31:0] T13;
  wire[31:0] T14;
  wire[31:0] T15;
  wire[31:0] T16;
  wire T17;
  reg  state;
  wire T29;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    valid_processor_input_count = {1{$random}};
    valid_processor_output_count = {1{$random}};
    state = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_processor_output = T0;
  assign T0 = T19 ? io_ALU_output : T1;
  assign T1 = T2 ? io_ALU_output : 24'hdead;
  assign T2 = T3 & io_ALU_output_is_valid;
  assign T3 = T18 & T4;
  assign T4 = T5 ^ 1'h1;
  assign T5 = valid_processor_input_count < 32'h1e;
  assign T27 = reset ? 32'h0 : T6;
  assign T6 = T10 ? 32'h0 : T7;
  assign T7 = T9 ? T8 : valid_processor_input_count;
  assign T8 = valid_processor_input_count + 32'h1;
  assign T9 = T18 & T5;
  assign T10 = T17 & T11;
  assign T11 = valid_processor_output_count == 32'h1172;
  assign T28 = reset ? 32'h0 : T12;
  assign T12 = T10 ? 32'h0 : T13;
  assign T13 = T19 ? T16 : T14;
  assign T14 = T2 ? T15 : valid_processor_output_count;
  assign T15 = valid_processor_output_count + 32'h1;
  assign T16 = valid_processor_output_count + 32'h1;
  assign T17 = state == 1'h1;
  assign T29 = reset ? 1'h0 : state;
  assign T18 = T17 & io_processor_output_is_valid;
  assign T19 = T20 & io_ALU_output_is_valid;
  assign T20 = T22 & T21;
  assign T21 = valid_processor_output_count < 32'h1172;
  assign T22 = T17 & T23;
  assign T23 = T25 & T24;
  assign T24 = 32'h0 < valid_processor_output_count;
  assign T25 = io_processor_output_is_valid ^ 1'h1;
  assign io_processor_output_is_valid = T26;
  assign T26 = T19 ? 1'h1 : T2;

  always @(posedge clk) begin
    if(reset) begin
      valid_processor_input_count <= 32'h0;
    end else if(T10) begin
      valid_processor_input_count <= 32'h0;
    end else if(T9) begin
      valid_processor_input_count <= T8;
    end
    if(reset) begin
      valid_processor_output_count <= 32'h0;
    end else if(T10) begin
      valid_processor_output_count <= 32'h0;
    end else if(T19) begin
      valid_processor_output_count <= T16;
    end else if(T2) begin
      valid_processor_output_count <= T15;
    end
    if(reset) begin
      state <= 1'h0;
    end
  end
endmodule

module OutputHandler(
    input  io_input_valid,
    input [23:0] io_data_in
);



endmodule

module Tile(input clk, input reset,
    input [23:0] io_data_in,
    input  io_input_valid,
    input  io_reset,
    input  io_active,
    output[23:0] io_data_out,
    output io_output_valid
);

  wire[15:0] T0;
  wire SystemControl_io_processor_output_is_valid;
  wire[23:0] SystemControl_io_processor_output;
  wire[23:0] Processor_io_ALU_data_out;
  wire Processor_io_ALU_data_is_valid;
  wire[23:0] InputHandler_io_data_out;
  wire InputHandler_io_data_ready;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_output_valid = {1{$random}};
//  assign io_data_out = {1{$random}};
// synthesis translate_on
`endif
  assign T0 = io_data_in[4'hf:1'h0];
  InputHandler InputHandler(.clk(clk), .reset(reset),
       .io_input_ready( io_input_valid ),
       .io_data_in( T0 ),
       .io_data_out( InputHandler_io_data_out ),
       .io_data_ready( InputHandler_io_data_ready )
  );
  Processor Processor(.clk(clk), .reset(reset),
       //.io_stall(  )
       //.io_input_ready(  )
       .io_data_in( InputHandler_io_data_out ),
       .io_ALU_data_out( Processor_io_ALU_data_out ),
       .io_ALU_data_is_valid( Processor_io_ALU_data_is_valid )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign Processor.io_stall = {1{$random}};
    assign Processor.io_input_ready = {1{$random}};
// synthesis translate_on
`endif
  TileController SystemControl(.clk(clk), .reset(reset),
       .io_processor_input_is_valid( InputHandler_io_data_ready ),
       .io_ALU_output_is_valid( Processor_io_ALU_data_is_valid ),
       .io_ALU_output( Processor_io_ALU_data_out ),
       .io_processor_output_is_valid( SystemControl_io_processor_output_is_valid ),
       .io_processor_output( SystemControl_io_processor_output )
  );
  OutputHandler OutputHandler(
       .io_input_valid( SystemControl_io_processor_output_is_valid ),
       .io_data_in( SystemControl_io_processor_output )
  );
endmodule

