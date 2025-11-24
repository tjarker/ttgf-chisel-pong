module VgaTimer(
  input        clock,
  input        reset,
  input        io_ena,
  output       io_hSync,
  output       io_vSync,
  output [9:0] io_pos_x,
  output [9:0] io_pos_y
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  pxlTick_tickReg; // @[TickGen.scala 11:26]
  wire  pxlTick = io_ena & pxlTick_tickReg; // @[TickGen.scala 13:20]
  reg [9:0] xReg; // @[Counter.scala 61:40]
  wire  wrap_wrap = xReg == 10'h31f; // @[Counter.scala 73:24]
  wire [9:0] _wrap_value_T_1 = xReg + 10'h1; // @[Counter.scala 77:24]
  wire  hWrap = pxlTick & wrap_wrap; // @[Counter.scala 118:{16,23} 117:24]
  reg [9:0] yReg; // @[Counter.scala 61:40]
  wire  wrap_wrap_1 = yReg == 10'h20c; // @[Counter.scala 73:24]
  wire [9:0] _wrap_value_T_3 = yReg + 10'h1; // @[Counter.scala 77:24]
  assign io_hSync = ~(xReg >= 10'h290 & xReg < 10'h2f0); // @[VgaTimer.scala 28:15]
  assign io_vSync = ~(yReg >= 10'h1ea & yReg < 10'h1ec); // @[VgaTimer.scala 27:15]
  assign io_pos_x = xReg; // @[VgaTimer.scala 29:12]
  assign io_pos_y = yReg; // @[VgaTimer.scala 30:12]
  always @(posedge clock) begin
    if (reset) begin // @[TickGen.scala 11:26]
      pxlTick_tickReg <= 1'h0; // @[TickGen.scala 11:26]
    end else if (pxlTick) begin // @[TickGen.scala 14:19]
      pxlTick_tickReg <= 1'h0;
    end else begin
      pxlTick_tickReg <= pxlTick_tickReg + 1'h1;
    end
    if (reset) begin // @[Counter.scala 61:40]
      xReg <= 10'h0; // @[Counter.scala 61:40]
    end else if (pxlTick) begin // @[Counter.scala 118:16]
      if (wrap_wrap) begin // @[Counter.scala 87:20]
        xReg <= 10'h0; // @[Counter.scala 87:28]
      end else begin
        xReg <= _wrap_value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Counter.scala 61:40]
      yReg <= 10'h0; // @[Counter.scala 61:40]
    end else if (hWrap) begin // @[Counter.scala 118:16]
      if (wrap_wrap_1) begin // @[Counter.scala 87:20]
        yReg <= 10'h0; // @[Counter.scala 87:28]
      end else begin
        yReg <= _wrap_value_T_3; // @[Counter.scala 77:15]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pxlTick_tickReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  xReg = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  yReg = _RAND_2[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Debouncer(
  input   clock,
  input   reset,
  input   io_in,
  output  io_out,
  input   io_tick
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] reg_; // @[Debouncer.scala 15:20]
  wire [1:0] _reg_T_1 = {io_in,reg_[1]}; // @[Cat.scala 33:92]
  assign io_out = &reg_; // @[Debouncer.scala 21:17]
  always @(posedge clock) begin
    if (reset) begin // @[Debouncer.scala 15:20]
      reg_ <= 2'h0; // @[Debouncer.scala 15:20]
    end else if (io_tick) begin // @[Debouncer.scala 17:17]
      reg_ <= _reg_T_1; // @[Debouncer.scala 18:9]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Pedal(
  input        clock,
  input        reset,
  input        gameIO_tick,
  input  [9:0] gameIO_rendering_pxlPos_x,
  input  [9:0] gameIO_rendering_pxlPos_y,
  output [1:0] gameIO_rendering_color_g,
  output [1:0] gameIO_rendering_color_b,
  output       gameIO_rendering_active,
  input        io_up,
  input        io_down,
  output [8:0] io_pos,
  input  [9:0] io_ballPos_x,
  input  [9:0] io_ballPos_y,
  input  [4:0] io_ballVel_x,
  input        io_force
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [8:0] pos; // @[Pedal.scala 31:20]
  wire  _T_2 = io_ballPos_x < 10'h140 & io_ballVel_x[4]; // @[Pedal.scala 40:54]
  wire [9:0] sPos = {1'h0,pos}; // @[Pedal.scala 45:33]
  wire [10:0] sBall = {1'h0,io_ballPos_y}; // @[Pedal.scala 46:43]
  wire [9:0] _err_T_2 = $signed(sPos) + 10'sh1e; // @[Pedal.scala 48:25]
  wire [10:0] _GEN_5 = {{1{_err_T_2[9]}},_err_T_2}; // @[Pedal.scala 48:48]
  wire [10:0] err = $signed(_GEN_5) - $signed(sBall); // @[Pedal.scala 48:48]
  wire  _correction_T = $signed(err) > 11'sh4; // @[Pedal.scala 53:18]
  wire [3:0] _correction_T_3 = 4'sh0 - 4'sh4; // @[Pedal.scala 53:32]
  wire  _correction_T_4 = $signed(err) > 11'sh0; // @[Pedal.scala 54:18]
  wire [10:0] _GEN_6 = {{7{_correction_T_3[3]}},_correction_T_3}; // @[Pedal.scala 55:18]
  wire  _correction_T_8 = $signed(err) < $signed(_GEN_6); // @[Pedal.scala 55:18]
  wire  _correction_T_9 = $signed(err) < 11'sh0; // @[Pedal.scala 56:18]
  wire [1:0] _correction_T_10 = _correction_T_9 ? $signed(2'sh1) : $signed(2'sh0); // @[Mux.scala 101:16]
  wire [3:0] _correction_T_11 = _correction_T_8 ? $signed(4'sh4) : $signed({{2{_correction_T_10[1]}},_correction_T_10}); // @[Mux.scala 101:16]
  wire [3:0] _correction_T_12 = _correction_T_4 ? $signed(-4'sh1) : $signed(_correction_T_11); // @[Mux.scala 101:16]
  wire [3:0] correction = _correction_T ? $signed(_correction_T_3) : $signed(_correction_T_12); // @[Mux.scala 101:16]
  wire [9:0] _GEN_7 = {{6{correction[3]}},correction}; // @[Pedal.scala 60:27]
  wire [9:0] newPos = $signed(sPos) + $signed(_GEN_7); // @[Pedal.scala 60:27]
  wire [9:0] _pos_T = $signed(sPos) + $signed(_GEN_7); // @[Pedal.scala 63:18]
  wire  _pos_T_1 = $signed(newPos) < 10'sh0; // @[Pedal.scala 65:21]
  wire  _pos_T_2 = $signed(newPos) > 10'sh1a4; // @[Pedal.scala 66:21]
  wire [9:0] _pos_T_3 = _pos_T_2 ? 10'h1a4 : _pos_T; // @[Mux.scala 101:16]
  wire [9:0] _pos_T_4 = _pos_T_1 ? 10'h0 : _pos_T_3; // @[Mux.scala 101:16]
  wire [9:0] _GEN_0 = _T_2 ? _pos_T_4 : {{1'd0}, pos}; // @[Pedal.scala 43:10 62:13 31:20]
  wire [8:0] _pos_T_6 = pos - 9'h4; // @[Pedal.scala 72:18]
  wire [8:0] _pos_T_8 = pos + 9'h4; // @[Pedal.scala 74:18]
  wire [8:0] _GEN_1 = io_down & pos < 9'h1a0 ? _pos_T_8 : pos; // @[Pedal.scala 73:71 74:11 31:20]
  wire [8:0] _GEN_2 = io_up & pos >= 9'h4 ? _pos_T_6 : _GEN_1; // @[Pedal.scala 71:41 72:11]
  wire [9:0] _GEN_3 = io_force ? _GEN_0 : {{1'd0}, _GEN_2}; // @[Pedal.scala 36:20]
  wire [9:0] _GEN_4 = gameIO_tick ? _GEN_3 : {{1'd0}, pos}; // @[Pedal.scala 31:20 35:21]
  wire  _active_T_1 = gameIO_rendering_pxlPos_x < 10'ha; // @[package.scala 16:55]
  wire [8:0] _active_T_4 = pos + 9'h3c; // @[Pedal.scala 85:50]
  wire [9:0] _GEN_8 = {{1'd0}, pos}; // @[package.scala 16:43]
  wire [9:0] _GEN_9 = {{1'd0}, _active_T_4}; // @[package.scala 16:55]
  wire  _active_T_7 = gameIO_rendering_pxlPos_y >= _GEN_8 & gameIO_rendering_pxlPos_y < _GEN_9; // @[package.scala 16:50]
  wire [9:0] _GEN_10 = reset ? 10'hd2 : _GEN_4; // @[Pedal.scala 31:{20,20}]
  assign gameIO_rendering_color_g = io_force ? 2'h0 : 2'h3; // @[Pedal.scala 87:32]
  assign gameIO_rendering_color_b = io_force ? 2'h3 : 2'h0; // @[Pedal.scala 87:32]
  assign gameIO_rendering_active = _active_T_1 & _active_T_7; // @[Pedal.scala 84:69]
  assign io_pos = pos; // @[Pedal.scala 89:10]
  always @(posedge clock) begin
    pos <= _GEN_10[8:0]; // @[Pedal.scala 31:{20,20}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pos = _RAND_0[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Pedal_1(
  input        clock,
  input        reset,
  input        gameIO_tick,
  input  [9:0] gameIO_rendering_pxlPos_x,
  input  [9:0] gameIO_rendering_pxlPos_y,
  output [1:0] gameIO_rendering_color_g,
  output [1:0] gameIO_rendering_color_b,
  output       gameIO_rendering_active,
  input        io_up,
  input        io_down,
  output [8:0] io_pos,
  input  [9:0] io_ballPos_x,
  input  [9:0] io_ballPos_y,
  input  [4:0] io_ballVel_x,
  input        io_force
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [8:0] pos; // @[Pedal.scala 31:20]
  wire  _T_3 = io_ballPos_x > 10'h140 & ~io_ballVel_x[4]; // @[Pedal.scala 42:54]
  wire [9:0] sPos = {1'h0,pos}; // @[Pedal.scala 45:33]
  wire [10:0] sBall = {1'h0,io_ballPos_y}; // @[Pedal.scala 46:43]
  wire [9:0] _err_T_2 = $signed(sPos) + 10'sh1e; // @[Pedal.scala 48:25]
  wire [10:0] _GEN_5 = {{1{_err_T_2[9]}},_err_T_2}; // @[Pedal.scala 48:48]
  wire [10:0] err = $signed(_GEN_5) - $signed(sBall); // @[Pedal.scala 48:48]
  wire  _correction_T = $signed(err) > 11'sh4; // @[Pedal.scala 53:18]
  wire [3:0] _correction_T_3 = 4'sh0 - 4'sh4; // @[Pedal.scala 53:32]
  wire  _correction_T_4 = $signed(err) > 11'sh0; // @[Pedal.scala 54:18]
  wire [10:0] _GEN_6 = {{7{_correction_T_3[3]}},_correction_T_3}; // @[Pedal.scala 55:18]
  wire  _correction_T_8 = $signed(err) < $signed(_GEN_6); // @[Pedal.scala 55:18]
  wire  _correction_T_9 = $signed(err) < 11'sh0; // @[Pedal.scala 56:18]
  wire [1:0] _correction_T_10 = _correction_T_9 ? $signed(2'sh1) : $signed(2'sh0); // @[Mux.scala 101:16]
  wire [3:0] _correction_T_11 = _correction_T_8 ? $signed(4'sh4) : $signed({{2{_correction_T_10[1]}},_correction_T_10}); // @[Mux.scala 101:16]
  wire [3:0] _correction_T_12 = _correction_T_4 ? $signed(-4'sh1) : $signed(_correction_T_11); // @[Mux.scala 101:16]
  wire [3:0] correction = _correction_T ? $signed(_correction_T_3) : $signed(_correction_T_12); // @[Mux.scala 101:16]
  wire [9:0] _GEN_7 = {{6{correction[3]}},correction}; // @[Pedal.scala 60:27]
  wire [9:0] newPos = $signed(sPos) + $signed(_GEN_7); // @[Pedal.scala 60:27]
  wire [9:0] _pos_T = $signed(sPos) + $signed(_GEN_7); // @[Pedal.scala 63:18]
  wire  _pos_T_1 = $signed(newPos) < 10'sh0; // @[Pedal.scala 65:21]
  wire  _pos_T_2 = $signed(newPos) > 10'sh1a4; // @[Pedal.scala 66:21]
  wire [9:0] _pos_T_3 = _pos_T_2 ? 10'h1a4 : _pos_T; // @[Mux.scala 101:16]
  wire [9:0] _pos_T_4 = _pos_T_1 ? 10'h0 : _pos_T_3; // @[Mux.scala 101:16]
  wire [9:0] _GEN_0 = _T_3 ? _pos_T_4 : {{1'd0}, pos}; // @[Pedal.scala 43:10 62:13 31:20]
  wire [8:0] _pos_T_6 = pos - 9'h4; // @[Pedal.scala 72:18]
  wire [8:0] _pos_T_8 = pos + 9'h4; // @[Pedal.scala 74:18]
  wire [8:0] _GEN_1 = io_down & pos < 9'h1a0 ? _pos_T_8 : pos; // @[Pedal.scala 73:71 74:11 31:20]
  wire [8:0] _GEN_2 = io_up & pos >= 9'h4 ? _pos_T_6 : _GEN_1; // @[Pedal.scala 71:41 72:11]
  wire [9:0] _GEN_3 = io_force ? _GEN_0 : {{1'd0}, _GEN_2}; // @[Pedal.scala 36:20]
  wire [9:0] _GEN_4 = gameIO_tick ? _GEN_3 : {{1'd0}, pos}; // @[Pedal.scala 31:20 35:21]
  wire  _active_T_2 = gameIO_rendering_pxlPos_x >= 10'h276 & gameIO_rendering_pxlPos_x < 10'h280; // @[package.scala 16:50]
  wire [8:0] _active_T_4 = pos + 9'h3c; // @[Pedal.scala 85:50]
  wire [9:0] _GEN_8 = {{1'd0}, pos}; // @[package.scala 16:43]
  wire [9:0] _GEN_9 = {{1'd0}, _active_T_4}; // @[package.scala 16:55]
  wire  _active_T_7 = gameIO_rendering_pxlPos_y >= _GEN_8 & gameIO_rendering_pxlPos_y < _GEN_9; // @[package.scala 16:50]
  wire [9:0] _GEN_10 = reset ? 10'hd2 : _GEN_4; // @[Pedal.scala 31:{20,20}]
  assign gameIO_rendering_color_g = io_force ? 2'h0 : 2'h3; // @[Pedal.scala 87:32]
  assign gameIO_rendering_color_b = io_force ? 2'h3 : 2'h0; // @[Pedal.scala 87:32]
  assign gameIO_rendering_active = _active_T_2 & _active_T_7; // @[Pedal.scala 84:69]
  assign io_pos = pos; // @[Pedal.scala 89:10]
  always @(posedge clock) begin
    pos <= _GEN_10[8:0]; // @[Pedal.scala 31:{20,20}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pos = _RAND_0[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MaxPeriodFibonacciLFSR(
  input   clock,
  input   reset,
  input   io_increment,
  output  io_out_0,
  output  io_out_1,
  output  io_out_2,
  output  io_out_3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg  state_0; // @[PRNG.scala 55:49]
  reg  state_1; // @[PRNG.scala 55:49]
  reg  state_2; // @[PRNG.scala 55:49]
  reg  state_3; // @[PRNG.scala 55:49]
  wire  _T = state_3 ^ state_2; // @[LFSR.scala 15:41]
  wire  _GEN_0 = io_increment ? _T : state_0; // @[PRNG.scala 69:22 70:11 55:49]
  assign io_out_0 = state_0; // @[PRNG.scala 78:10]
  assign io_out_1 = state_1; // @[PRNG.scala 78:10]
  assign io_out_2 = state_2; // @[PRNG.scala 78:10]
  assign io_out_3 = state_3; // @[PRNG.scala 78:10]
  always @(posedge clock) begin
    state_0 <= reset | _GEN_0; // @[PRNG.scala 55:{49,49}]
    if (reset) begin // @[PRNG.scala 55:49]
      state_1 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_1 <= state_0; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_2 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_2 <= state_1; // @[PRNG.scala 70:11]
    end
    if (reset) begin // @[PRNG.scala 55:49]
      state_3 <= 1'h0; // @[PRNG.scala 55:49]
    end else if (io_increment) begin // @[PRNG.scala 69:22]
      state_3 <= state_2; // @[PRNG.scala 70:11]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  state_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  state_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  state_3 = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Ball(
  input        clock,
  input        reset,
  input        gameIO_newGame,
  input        gameIO_tick,
  input  [9:0] gameIO_rendering_pxlPos_x,
  input  [9:0] gameIO_rendering_pxlPos_y,
  output [1:0] gameIO_rendering_color_r,
  output [1:0] gameIO_rendering_color_g,
  output [1:0] gameIO_rendering_color_b,
  output       gameIO_rendering_active,
  input  [8:0] io_leftPedalPos,
  input  [8:0] io_rightPedalPos,
  output       io_lost_0,
  output       io_lost_1,
  output [9:0] io_pos_x,
  output [9:0] io_pos_y,
  output [4:0] io_vel_x
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  lfsr_prng_clock; // @[PRNG.scala 91:22]
  wire  lfsr_prng_reset; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_increment; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_0; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_1; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_2; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_3; // @[PRNG.scala 91:22]
  wire [3:0] lfsr = {lfsr_prng_io_out_3,lfsr_prng_io_out_2,lfsr_prng_io_out_1,lfsr_prng_io_out_0}; // @[PRNG.scala 95:17]
  reg [9:0] posReg_x; // @[Ball.scala 28:23]
  reg [9:0] posReg_y; // @[Ball.scala 28:23]
  reg [4:0] velReg_x; // @[Ball.scala 34:23]
  reg [4:0] velReg_y; // @[Ball.scala 34:23]
  wire [10:0] _T_2 = {1'h0,posReg_y}; // @[Ball.scala 44:55]
  wire [9:0] _T_4 = {1'h0,io_leftPedalPos}; // @[Ball.scala 45:32]
  wire [9:0] _T_7 = $signed(_T_4) - 10'sh5; // @[Ball.scala 45:39]
  wire [9:0] _T_12 = $signed(_T_4) + 10'sh37; // @[Ball.scala 46:39]
  wire [10:0] _GEN_143 = {{1{_T_7[9]}},_T_7}; // @[package.scala 16:43]
  wire [10:0] _GEN_144 = {{1{_T_12[9]}},_T_12}; // @[package.scala 16:55]
  wire  _T_15 = $signed(_T_2) >= $signed(_GEN_143) & $signed(_T_2) < $signed(_GEN_144); // @[package.scala 16:50]
  wire  _T_16 = posReg_x < 10'ha & _T_15; // @[Ball.scala 44:36]
  wire [4:0] _velReg_x_T_2 = 5'sh0 - $signed(velReg_x); // @[Ball.scala 49:19]
  wire [9:0] _T_21 = {1'h0,io_rightPedalPos}; // @[Ball.scala 54:35]
  wire [9:0] _T_24 = $signed(_T_21) - 10'sh5; // @[Ball.scala 54:42]
  wire [9:0] _T_29 = $signed(_T_21) + 10'sh37; // @[Ball.scala 55:42]
  wire [10:0] _GEN_145 = {{1{_T_24[9]}},_T_24}; // @[package.scala 16:43]
  wire [10:0] _GEN_146 = {{1{_T_29[9]}},_T_29}; // @[package.scala 16:55]
  wire  _T_32 = $signed(_T_2) >= $signed(_GEN_145) & $signed(_T_2) < $signed(_GEN_146); // @[package.scala 16:50]
  wire  _T_33 = posReg_x > 10'h26a & _T_32; // @[Ball.scala 52:61]
  wire [9:0] _GEN_147 = {{5{velReg_x[4]}},velReg_x}; // @[Ball.scala 61:36]
  wire [9:0] _posReg_x_T_4 = $signed(posReg_x) + $signed(_GEN_147); // @[Ball.scala 61:48]
  wire [4:0] _GEN_0 = _T_33 ? $signed(_velReg_x_T_2) : $signed(velReg_x); // @[Ball.scala 57:7 58:16 34:23]
  wire [9:0] _GEN_1 = _T_33 ? 10'h26a : _posReg_x_T_4; // @[Ball.scala 57:7 59:16 61:16]
  wire  _T_36 = posReg_y >= 10'h2 & posReg_y < 10'h1d3; // @[package.scala 16:50]
  wire [4:0] _velReg_y_T_2 = 5'sh0 - $signed(velReg_y); // @[Ball.scala 65:19]
  wire [9:0] _GEN_148 = {{5{velReg_y[4]}},velReg_y}; // @[Ball.scala 66:36]
  wire [9:0] _posReg_y_T_4 = $signed(posReg_y) - $signed(_GEN_148); // @[Ball.scala 66:48]
  wire [9:0] _posReg_y_T_9 = $signed(posReg_y) + $signed(_GEN_148); // @[Ball.scala 68:48]
  wire [9:0] _active_T_1 = posReg_x + 10'hb; // @[Ball.scala 73:58]
  wire  _active_T_4 = gameIO_rendering_pxlPos_x >= posReg_x & gameIO_rendering_pxlPos_x < _active_T_1; // @[package.scala 16:50]
  wire [9:0] _active_T_6 = posReg_y + 10'hb; // @[Ball.scala 74:60]
  wire  _active_T_9 = gameIO_rendering_pxlPos_y >= posReg_y & gameIO_rendering_pxlPos_y < _active_T_6; // @[package.scala 16:50]
  wire [9:0] spriteOffset_x = gameIO_rendering_pxlPos_x - posReg_x; // @[Ball.scala 77:31]
  wire [9:0] spriteOffset_y = gameIO_rendering_pxlPos_y - posReg_y; // @[Ball.scala 78:31]
  wire  lostLeft = posReg_x < 10'h3; // @[Ball.scala 83:27]
  wire  lostRight = posReg_x > 10'h274; // @[Ball.scala 84:28]
  wire [1:0] activeColor_r = lostLeft | lostRight ? 2'h3 : 2'h2; // @[Ball.scala 86:24]
  wire [1:0] activeColor_g = lostLeft | lostRight ? 2'h0 : 2'h3; // @[Ball.scala 86:24]
  wire  _GEN_17 = 4'h0 == spriteOffset_y[3:0] & 4'h7 == spriteOffset_x[3:0] ? 1'h0 : 4'h0 == spriteOffset_y[3:0] & 4'h6
     == spriteOffset_x[3:0] | (4'h0 == spriteOffset_y[3:0] & 4'h5 == spriteOffset_x[3:0] | 4'h0 == spriteOffset_y[3:0]
     & 4'h4 == spriteOffset_x[3:0]); // @[Ball.scala 87:{32,32}]
  wire  _GEN_18 = 4'h0 == spriteOffset_y[3:0] & 4'h8 == spriteOffset_x[3:0] ? 1'h0 : _GEN_17; // @[Ball.scala 87:{32,32}]
  wire  _GEN_19 = 4'h0 == spriteOffset_y[3:0] & 4'h9 == spriteOffset_x[3:0] ? 1'h0 : _GEN_18; // @[Ball.scala 87:{32,32}]
  wire  _GEN_20 = 4'h0 == spriteOffset_y[3:0] & 4'ha == spriteOffset_x[3:0] ? 1'h0 : _GEN_19; // @[Ball.scala 87:{32,32}]
  wire  _GEN_21 = 4'h1 == spriteOffset_y[3:0] & 4'h0 == spriteOffset_x[3:0] ? 1'h0 : _GEN_20; // @[Ball.scala 87:{32,32}]
  wire  _GEN_22 = 4'h1 == spriteOffset_y[3:0] & 4'h1 == spriteOffset_x[3:0] ? 1'h0 : _GEN_21; // @[Ball.scala 87:{32,32}]
  wire  _GEN_29 = 4'h1 == spriteOffset_y[3:0] & 4'h8 == spriteOffset_x[3:0] | (4'h1 == spriteOffset_y[3:0] & 4'h7 ==
    spriteOffset_x[3:0] | (4'h1 == spriteOffset_y[3:0] & 4'h6 == spriteOffset_x[3:0] | (4'h1 == spriteOffset_y[3:0] & 4'h5
     == spriteOffset_x[3:0] | (4'h1 == spriteOffset_y[3:0] & 4'h4 == spriteOffset_x[3:0] | (4'h1 == spriteOffset_y[3:0]
     & 4'h3 == spriteOffset_x[3:0] | (4'h1 == spriteOffset_y[3:0] & 4'h2 == spriteOffset_x[3:0] | _GEN_22)))))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_30 = 4'h1 == spriteOffset_y[3:0] & 4'h9 == spriteOffset_x[3:0] ? 1'h0 : _GEN_29; // @[Ball.scala 87:{32,32}]
  wire  _GEN_31 = 4'h1 == spriteOffset_y[3:0] & 4'ha == spriteOffset_x[3:0] ? 1'h0 : _GEN_30; // @[Ball.scala 87:{32,32}]
  wire  _GEN_32 = 4'h2 == spriteOffset_y[3:0] & 4'h0 == spriteOffset_x[3:0] ? 1'h0 : _GEN_31; // @[Ball.scala 87:{32,32}]
  wire  _GEN_39 = 4'h2 == spriteOffset_y[3:0] & 4'h7 == spriteOffset_x[3:0] | (4'h2 == spriteOffset_y[3:0] & 4'h6 ==
    spriteOffset_x[3:0] | (4'h2 == spriteOffset_y[3:0] & 4'h5 == spriteOffset_x[3:0] | (4'h2 == spriteOffset_y[3:0] & 4'h4
     == spriteOffset_x[3:0] | (4'h2 == spriteOffset_y[3:0] & 4'h3 == spriteOffset_x[3:0] | (4'h2 == spriteOffset_y[3:0]
     & 4'h2 == spriteOffset_x[3:0] | (4'h2 == spriteOffset_y[3:0] & 4'h1 == spriteOffset_x[3:0] | _GEN_32)))))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_42 = 4'h2 == spriteOffset_y[3:0] & 4'ha == spriteOffset_x[3:0] ? 1'h0 : 4'h2 == spriteOffset_y[3:0] & 4'h9
     == spriteOffset_x[3:0] | (4'h2 == spriteOffset_y[3:0] & 4'h8 == spriteOffset_x[3:0] | _GEN_39); // @[Ball.scala 87:{32,32}]
  wire  _GEN_43 = 4'h3 == spriteOffset_y[3:0] & 4'h0 == spriteOffset_x[3:0] ? 1'h0 : _GEN_42; // @[Ball.scala 87:{32,32}]
  wire  _GEN_50 = 4'h3 == spriteOffset_y[3:0] & 4'h7 == spriteOffset_x[3:0] | (4'h3 == spriteOffset_y[3:0] & 4'h6 ==
    spriteOffset_x[3:0] | (4'h3 == spriteOffset_y[3:0] & 4'h5 == spriteOffset_x[3:0] | (4'h3 == spriteOffset_y[3:0] & 4'h4
     == spriteOffset_x[3:0] | (4'h3 == spriteOffset_y[3:0] & 4'h3 == spriteOffset_x[3:0] | (4'h3 == spriteOffset_y[3:0]
     & 4'h2 == spriteOffset_x[3:0] | (4'h3 == spriteOffset_y[3:0] & 4'h1 == spriteOffset_x[3:0] | _GEN_43)))))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_53 = 4'h3 == spriteOffset_y[3:0] & 4'ha == spriteOffset_x[3:0] ? 1'h0 : 4'h3 == spriteOffset_y[3:0] & 4'h9
     == spriteOffset_x[3:0] | (4'h3 == spriteOffset_y[3:0] & 4'h8 == spriteOffset_x[3:0] | _GEN_50); // @[Ball.scala 87:{32,32}]
  wire  _GEN_60 = 4'h4 == spriteOffset_y[3:0] & 4'h6 == spriteOffset_x[3:0] | (4'h4 == spriteOffset_y[3:0] & 4'h5 ==
    spriteOffset_x[3:0] | (4'h4 == spriteOffset_y[3:0] & 4'h4 == spriteOffset_x[3:0] | (4'h4 == spriteOffset_y[3:0] & 4'h3
     == spriteOffset_x[3:0] | (4'h4 == spriteOffset_y[3:0] & 4'h2 == spriteOffset_x[3:0] | (4'h4 == spriteOffset_y[3:0]
     & 4'h1 == spriteOffset_x[3:0] | (4'h4 == spriteOffset_y[3:0] & 4'h0 == spriteOffset_x[3:0] | _GEN_53)))))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_67 = 4'h5 == spriteOffset_y[3:0] & 4'h2 == spriteOffset_x[3:0] | (4'h5 == spriteOffset_y[3:0] & 4'h1 ==
    spriteOffset_x[3:0] | (4'h5 == spriteOffset_y[3:0] & 4'h0 == spriteOffset_x[3:0] | (4'h4 == spriteOffset_y[3:0] & 4'ha
     == spriteOffset_x[3:0] | (4'h4 == spriteOffset_y[3:0] & 4'h9 == spriteOffset_x[3:0] | (4'h4 == spriteOffset_y[3:0]
     & 4'h8 == spriteOffset_x[3:0] | (4'h4 == spriteOffset_y[3:0] & 4'h7 == spriteOffset_x[3:0] | _GEN_60)))))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_74 = 4'h5 == spriteOffset_y[3:0] & 4'h9 == spriteOffset_x[3:0] | (4'h5 == spriteOffset_y[3:0] & 4'h8 ==
    spriteOffset_x[3:0] | (4'h5 == spriteOffset_y[3:0] & 4'h7 == spriteOffset_x[3:0] | (4'h5 == spriteOffset_y[3:0] & 4'h6
     == spriteOffset_x[3:0] | (4'h5 == spriteOffset_y[3:0] & 4'h5 == spriteOffset_x[3:0] | (4'h5 == spriteOffset_y[3:0]
     & 4'h4 == spriteOffset_x[3:0] | (4'h5 == spriteOffset_y[3:0] & 4'h3 == spriteOffset_x[3:0] | _GEN_67)))))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_81 = 4'h6 == spriteOffset_y[3:0] & 4'h5 == spriteOffset_x[3:0] | (4'h6 == spriteOffset_y[3:0] & 4'h4 ==
    spriteOffset_x[3:0] | (4'h6 == spriteOffset_y[3:0] & 4'h3 == spriteOffset_x[3:0] | (4'h6 == spriteOffset_y[3:0] & 4'h2
     == spriteOffset_x[3:0] | (4'h6 == spriteOffset_y[3:0] & 4'h1 == spriteOffset_x[3:0] | (4'h6 == spriteOffset_y[3:0]
     & 4'h0 == spriteOffset_x[3:0] | (4'h5 == spriteOffset_y[3:0] & 4'ha == spriteOffset_x[3:0] | _GEN_74)))))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_87 = 4'h7 == spriteOffset_y[3:0] & 4'h0 == spriteOffset_x[3:0] ? 1'h0 : 4'h6 == spriteOffset_y[3:0] & 4'ha
     == spriteOffset_x[3:0] | (4'h6 == spriteOffset_y[3:0] & 4'h9 == spriteOffset_x[3:0] | (4'h6 == spriteOffset_y[3:0]
     & 4'h8 == spriteOffset_x[3:0] | (4'h6 == spriteOffset_y[3:0] & 4'h7 == spriteOffset_x[3:0] | (4'h6 ==
    spriteOffset_y[3:0] & 4'h6 == spriteOffset_x[3:0] | _GEN_81)))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_94 = 4'h7 == spriteOffset_y[3:0] & 4'h7 == spriteOffset_x[3:0] | (4'h7 == spriteOffset_y[3:0] & 4'h6 ==
    spriteOffset_x[3:0] | (4'h7 == spriteOffset_y[3:0] & 4'h5 == spriteOffset_x[3:0] | (4'h7 == spriteOffset_y[3:0] & 4'h4
     == spriteOffset_x[3:0] | (4'h7 == spriteOffset_y[3:0] & 4'h3 == spriteOffset_x[3:0] | (4'h7 == spriteOffset_y[3:0]
     & 4'h2 == spriteOffset_x[3:0] | (4'h7 == spriteOffset_y[3:0] & 4'h1 == spriteOffset_x[3:0] | _GEN_87)))))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_97 = 4'h7 == spriteOffset_y[3:0] & 4'ha == spriteOffset_x[3:0] ? 1'h0 : 4'h7 == spriteOffset_y[3:0] & 4'h9
     == spriteOffset_x[3:0] | (4'h7 == spriteOffset_y[3:0] & 4'h8 == spriteOffset_x[3:0] | _GEN_94); // @[Ball.scala 87:{32,32}]
  wire  _GEN_98 = 4'h8 == spriteOffset_y[3:0] & 4'h0 == spriteOffset_x[3:0] ? 1'h0 : _GEN_97; // @[Ball.scala 87:{32,32}]
  wire  _GEN_105 = 4'h8 == spriteOffset_y[3:0] & 4'h7 == spriteOffset_x[3:0] | (4'h8 == spriteOffset_y[3:0] & 4'h6 ==
    spriteOffset_x[3:0] | (4'h8 == spriteOffset_y[3:0] & 4'h5 == spriteOffset_x[3:0] | (4'h8 == spriteOffset_y[3:0] & 4'h4
     == spriteOffset_x[3:0] | (4'h8 == spriteOffset_y[3:0] & 4'h3 == spriteOffset_x[3:0] | (4'h8 == spriteOffset_y[3:0]
     & 4'h2 == spriteOffset_x[3:0] | (4'h8 == spriteOffset_y[3:0] & 4'h1 == spriteOffset_x[3:0] | _GEN_98)))))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_108 = 4'h8 == spriteOffset_y[3:0] & 4'ha == spriteOffset_x[3:0] ? 1'h0 : 4'h8 == spriteOffset_y[3:0] & 4'h9
     == spriteOffset_x[3:0] | (4'h8 == spriteOffset_y[3:0] & 4'h8 == spriteOffset_x[3:0] | _GEN_105); // @[Ball.scala 87:{32,32}]
  wire  _GEN_109 = 4'h9 == spriteOffset_y[3:0] & 4'h0 == spriteOffset_x[3:0] ? 1'h0 : _GEN_108; // @[Ball.scala 87:{32,32}]
  wire  _GEN_110 = 4'h9 == spriteOffset_y[3:0] & 4'h1 == spriteOffset_x[3:0] ? 1'h0 : _GEN_109; // @[Ball.scala 87:{32,32}]
  wire  _GEN_117 = 4'h9 == spriteOffset_y[3:0] & 4'h8 == spriteOffset_x[3:0] | (4'h9 == spriteOffset_y[3:0] & 4'h7 ==
    spriteOffset_x[3:0] | (4'h9 == spriteOffset_y[3:0] & 4'h6 == spriteOffset_x[3:0] | (4'h9 == spriteOffset_y[3:0] & 4'h5
     == spriteOffset_x[3:0] | (4'h9 == spriteOffset_y[3:0] & 4'h4 == spriteOffset_x[3:0] | (4'h9 == spriteOffset_y[3:0]
     & 4'h3 == spriteOffset_x[3:0] | (4'h9 == spriteOffset_y[3:0] & 4'h2 == spriteOffset_x[3:0] | _GEN_110)))))); // @[Ball.scala 87:{32,32}]
  wire  _GEN_118 = 4'h9 == spriteOffset_y[3:0] & 4'h9 == spriteOffset_x[3:0] ? 1'h0 : _GEN_117; // @[Ball.scala 87:{32,32}]
  wire  _GEN_119 = 4'h9 == spriteOffset_y[3:0] & 4'ha == spriteOffset_x[3:0] ? 1'h0 : _GEN_118; // @[Ball.scala 87:{32,32}]
  wire  _GEN_120 = 4'ha == spriteOffset_y[3:0] & 4'h0 == spriteOffset_x[3:0] ? 1'h0 : _GEN_119; // @[Ball.scala 87:{32,32}]
  wire  _GEN_121 = 4'ha == spriteOffset_y[3:0] & 4'h1 == spriteOffset_x[3:0] ? 1'h0 : _GEN_120; // @[Ball.scala 87:{32,32}]
  wire  _GEN_122 = 4'ha == spriteOffset_y[3:0] & 4'h2 == spriteOffset_x[3:0] ? 1'h0 : _GEN_121; // @[Ball.scala 87:{32,32}]
  wire  _GEN_123 = 4'ha == spriteOffset_y[3:0] & 4'h3 == spriteOffset_x[3:0] ? 1'h0 : _GEN_122; // @[Ball.scala 87:{32,32}]
  wire  _GEN_127 = 4'ha == spriteOffset_y[3:0] & 4'h7 == spriteOffset_x[3:0] ? 1'h0 : 4'ha == spriteOffset_y[3:0] & 4'h6
     == spriteOffset_x[3:0] | (4'ha == spriteOffset_y[3:0] & 4'h5 == spriteOffset_x[3:0] | (4'ha == spriteOffset_y[3:0]
     & 4'h4 == spriteOffset_x[3:0] | _GEN_123)); // @[Ball.scala 87:{32,32}]
  wire  _GEN_128 = 4'ha == spriteOffset_y[3:0] & 4'h8 == spriteOffset_x[3:0] ? 1'h0 : _GEN_127; // @[Ball.scala 87:{32,32}]
  wire  _GEN_129 = 4'ha == spriteOffset_y[3:0] & 4'h9 == spriteOffset_x[3:0] ? 1'h0 : _GEN_128; // @[Ball.scala 87:{32,32}]
  wire  _GEN_130 = 4'ha == spriteOffset_y[3:0] & 4'ha == spriteOffset_x[3:0] ? 1'h0 : _GEN_129; // @[Ball.scala 87:{32,32}]
  wire [4:0] _GEN_132 = 2'h1 == lfsr[3:2] ? $signed(-5'sh2) : $signed(-5'sh3); // @[Vec2D.scala 23:{11,11}]
  wire [4:0] _GEN_136 = 2'h1 == lfsr[1:0] ? $signed(-5'sh2) : $signed(-5'sh3); // @[Vec2D.scala 24:{11,11}]
  MaxPeriodFibonacciLFSR lfsr_prng ( // @[PRNG.scala 91:22]
    .clock(lfsr_prng_clock),
    .reset(lfsr_prng_reset),
    .io_increment(lfsr_prng_io_increment),
    .io_out_0(lfsr_prng_io_out_0),
    .io_out_1(lfsr_prng_io_out_1),
    .io_out_2(lfsr_prng_io_out_2),
    .io_out_3(lfsr_prng_io_out_3)
  );
  assign gameIO_rendering_color_r = _GEN_130 ? activeColor_r : 2'h0; // @[Ball.scala 87:32]
  assign gameIO_rendering_color_g = _GEN_130 ? activeColor_g : 2'h0; // @[Ball.scala 87:32]
  assign gameIO_rendering_color_b = _GEN_130 ? activeColor_g : 2'h0; // @[Ball.scala 87:32]
  assign gameIO_rendering_active = _active_T_4 & _active_T_9; // @[Ball.scala 73:68]
  assign io_lost_0 = posReg_x < 10'h3; // @[Ball.scala 83:27]
  assign io_lost_1 = posReg_x > 10'h274; // @[Ball.scala 84:28]
  assign io_pos_x = posReg_x; // @[Ball.scala 91:10]
  assign io_pos_y = posReg_y; // @[Ball.scala 91:10]
  assign io_vel_x = velReg_x; // @[Ball.scala 92:10]
  assign lfsr_prng_clock = clock;
  assign lfsr_prng_reset = reset;
  assign lfsr_prng_io_increment = gameIO_newGame; // @[PRNG.scala 94:23]
  always @(posedge clock) begin
    if (reset) begin // @[Ball.scala 28:23]
      posReg_x <= 10'h13b; // @[Ball.scala 28:23]
    end else if (gameIO_newGame) begin // @[Ball.scala 94:24]
      posReg_x <= 10'h145; // @[Ball.scala 95:12]
    end else if (gameIO_tick) begin // @[Ball.scala 41:21]
      if (_T_16) begin // @[Ball.scala 48:7]
        posReg_x <= 10'ha; // @[Ball.scala 50:16]
      end else begin
        posReg_x <= _GEN_1;
      end
    end
    if (reset) begin // @[Ball.scala 28:23]
      posReg_y <= 10'heb; // @[Ball.scala 28:23]
    end else if (gameIO_newGame) begin // @[Ball.scala 94:24]
      posReg_y <= 10'hf5; // @[Ball.scala 95:12]
    end else if (gameIO_tick) begin // @[Ball.scala 41:21]
      if (~_T_36) begin // @[Ball.scala 64:61]
        posReg_y <= _posReg_y_T_4; // @[Ball.scala 66:16]
      end else begin
        posReg_y <= _posReg_y_T_9; // @[Ball.scala 68:16]
      end
    end
    if (reset) begin // @[Ball.scala 34:23]
      velReg_x <= 5'sh3; // @[Ball.scala 34:23]
    end else if (gameIO_newGame) begin // @[Ball.scala 94:24]
      if (2'h3 == lfsr[3:2]) begin // @[Vec2D.scala 23:11]
        velReg_x <= 5'sh3; // @[Vec2D.scala 23:11]
      end else if (2'h2 == lfsr[3:2]) begin // @[Vec2D.scala 23:11]
        velReg_x <= 5'sh2; // @[Vec2D.scala 23:11]
      end else begin
        velReg_x <= _GEN_132;
      end
    end else if (gameIO_tick) begin // @[Ball.scala 41:21]
      if (_T_16) begin // @[Ball.scala 48:7]
        velReg_x <= _velReg_x_T_2; // @[Ball.scala 49:16]
      end else begin
        velReg_x <= _GEN_0;
      end
    end
    if (reset) begin // @[Ball.scala 34:23]
      velReg_y <= 5'sh2; // @[Ball.scala 34:23]
    end else if (gameIO_newGame) begin // @[Ball.scala 94:24]
      if (2'h3 == lfsr[1:0]) begin // @[Vec2D.scala 24:11]
        velReg_y <= 5'sh3; // @[Vec2D.scala 24:11]
      end else if (2'h2 == lfsr[1:0]) begin // @[Vec2D.scala 24:11]
        velReg_y <= 5'sh2; // @[Vec2D.scala 24:11]
      end else begin
        velReg_y <= _GEN_136;
      end
    end else if (gameIO_tick) begin // @[Ball.scala 41:21]
      if (~_T_36) begin // @[Ball.scala 64:61]
        velReg_y <= _velReg_y_T_2; // @[Ball.scala 65:16]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  posReg_x = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  posReg_y = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  velReg_x = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  velReg_y = _RAND_3[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TextField(
  input        clock,
  input        reset,
  input  [9:0] gameIO_rendering_pxlPos_x,
  input  [9:0] gameIO_rendering_pxlPos_y,
  output [1:0] gameIO_rendering_color_r,
  output [1:0] gameIO_rendering_color_g,
  output [1:0] gameIO_rendering_color_b,
  output       gameIO_rendering_active,
  input        io_increaseScore_0,
  input        io_increaseScore_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] scores_0; // @[TextField.scala 13:23]
  reg [7:0] scores_1; // @[TextField.scala 13:23]
  wire [7:0] _scores_0_T_1 = scores_0 + 8'h1; // @[TextField.scala 17:18]
  wire [7:0] _scores_1_T_1 = scores_1 + 8'h1; // @[TextField.scala 17:18]
  wire [7:0] bcdIn = gameIO_rendering_pxlPos_x > 10'h140 ? scores_1 : scores_0; // @[TextField.scala 21:18]
  wire [7:0] _GEN_3 = 7'h1 == bcdIn[6:0] ? 8'h1 : 8'h0; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_4 = 7'h2 == bcdIn[6:0] ? 8'h2 : _GEN_3; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_5 = 7'h3 == bcdIn[6:0] ? 8'h3 : _GEN_4; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_6 = 7'h4 == bcdIn[6:0] ? 8'h4 : _GEN_5; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_7 = 7'h5 == bcdIn[6:0] ? 8'h5 : _GEN_6; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_8 = 7'h6 == bcdIn[6:0] ? 8'h6 : _GEN_7; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_9 = 7'h7 == bcdIn[6:0] ? 8'h7 : _GEN_8; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_10 = 7'h8 == bcdIn[6:0] ? 8'h8 : _GEN_9; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_11 = 7'h9 == bcdIn[6:0] ? 8'h9 : _GEN_10; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_12 = 7'ha == bcdIn[6:0] ? 8'h10 : _GEN_11; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_13 = 7'hb == bcdIn[6:0] ? 8'h11 : _GEN_12; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_14 = 7'hc == bcdIn[6:0] ? 8'h12 : _GEN_13; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_15 = 7'hd == bcdIn[6:0] ? 8'h13 : _GEN_14; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_16 = 7'he == bcdIn[6:0] ? 8'h14 : _GEN_15; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_17 = 7'hf == bcdIn[6:0] ? 8'h15 : _GEN_16; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_18 = 7'h10 == bcdIn[6:0] ? 8'h16 : _GEN_17; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_19 = 7'h11 == bcdIn[6:0] ? 8'h17 : _GEN_18; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_20 = 7'h12 == bcdIn[6:0] ? 8'h18 : _GEN_19; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_21 = 7'h13 == bcdIn[6:0] ? 8'h19 : _GEN_20; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_22 = 7'h14 == bcdIn[6:0] ? 8'h20 : _GEN_21; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_23 = 7'h15 == bcdIn[6:0] ? 8'h21 : _GEN_22; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_24 = 7'h16 == bcdIn[6:0] ? 8'h22 : _GEN_23; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_25 = 7'h17 == bcdIn[6:0] ? 8'h23 : _GEN_24; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_26 = 7'h18 == bcdIn[6:0] ? 8'h24 : _GEN_25; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_27 = 7'h19 == bcdIn[6:0] ? 8'h25 : _GEN_26; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_28 = 7'h1a == bcdIn[6:0] ? 8'h26 : _GEN_27; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_29 = 7'h1b == bcdIn[6:0] ? 8'h27 : _GEN_28; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_30 = 7'h1c == bcdIn[6:0] ? 8'h28 : _GEN_29; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_31 = 7'h1d == bcdIn[6:0] ? 8'h29 : _GEN_30; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_32 = 7'h1e == bcdIn[6:0] ? 8'h30 : _GEN_31; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_33 = 7'h1f == bcdIn[6:0] ? 8'h31 : _GEN_32; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_34 = 7'h20 == bcdIn[6:0] ? 8'h32 : _GEN_33; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_35 = 7'h21 == bcdIn[6:0] ? 8'h33 : _GEN_34; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_36 = 7'h22 == bcdIn[6:0] ? 8'h34 : _GEN_35; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_37 = 7'h23 == bcdIn[6:0] ? 8'h35 : _GEN_36; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_38 = 7'h24 == bcdIn[6:0] ? 8'h36 : _GEN_37; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_39 = 7'h25 == bcdIn[6:0] ? 8'h37 : _GEN_38; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_40 = 7'h26 == bcdIn[6:0] ? 8'h38 : _GEN_39; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_41 = 7'h27 == bcdIn[6:0] ? 8'h39 : _GEN_40; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_42 = 7'h28 == bcdIn[6:0] ? 8'h40 : _GEN_41; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_43 = 7'h29 == bcdIn[6:0] ? 8'h41 : _GEN_42; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_44 = 7'h2a == bcdIn[6:0] ? 8'h42 : _GEN_43; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_45 = 7'h2b == bcdIn[6:0] ? 8'h43 : _GEN_44; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_46 = 7'h2c == bcdIn[6:0] ? 8'h44 : _GEN_45; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_47 = 7'h2d == bcdIn[6:0] ? 8'h45 : _GEN_46; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_48 = 7'h2e == bcdIn[6:0] ? 8'h46 : _GEN_47; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_49 = 7'h2f == bcdIn[6:0] ? 8'h47 : _GEN_48; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_50 = 7'h30 == bcdIn[6:0] ? 8'h48 : _GEN_49; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_51 = 7'h31 == bcdIn[6:0] ? 8'h49 : _GEN_50; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_52 = 7'h32 == bcdIn[6:0] ? 8'h50 : _GEN_51; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_53 = 7'h33 == bcdIn[6:0] ? 8'h51 : _GEN_52; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_54 = 7'h34 == bcdIn[6:0] ? 8'h52 : _GEN_53; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_55 = 7'h35 == bcdIn[6:0] ? 8'h53 : _GEN_54; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_56 = 7'h36 == bcdIn[6:0] ? 8'h54 : _GEN_55; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_57 = 7'h37 == bcdIn[6:0] ? 8'h55 : _GEN_56; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_58 = 7'h38 == bcdIn[6:0] ? 8'h56 : _GEN_57; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_59 = 7'h39 == bcdIn[6:0] ? 8'h57 : _GEN_58; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_60 = 7'h3a == bcdIn[6:0] ? 8'h58 : _GEN_59; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_61 = 7'h3b == bcdIn[6:0] ? 8'h59 : _GEN_60; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_62 = 7'h3c == bcdIn[6:0] ? 8'h60 : _GEN_61; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_63 = 7'h3d == bcdIn[6:0] ? 8'h61 : _GEN_62; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_64 = 7'h3e == bcdIn[6:0] ? 8'h62 : _GEN_63; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_65 = 7'h3f == bcdIn[6:0] ? 8'h63 : _GEN_64; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_66 = 7'h40 == bcdIn[6:0] ? 8'h64 : _GEN_65; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_67 = 7'h41 == bcdIn[6:0] ? 8'h65 : _GEN_66; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_68 = 7'h42 == bcdIn[6:0] ? 8'h66 : _GEN_67; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_69 = 7'h43 == bcdIn[6:0] ? 8'h67 : _GEN_68; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_70 = 7'h44 == bcdIn[6:0] ? 8'h68 : _GEN_69; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_71 = 7'h45 == bcdIn[6:0] ? 8'h69 : _GEN_70; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_72 = 7'h46 == bcdIn[6:0] ? 8'h70 : _GEN_71; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_73 = 7'h47 == bcdIn[6:0] ? 8'h71 : _GEN_72; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_74 = 7'h48 == bcdIn[6:0] ? 8'h72 : _GEN_73; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_75 = 7'h49 == bcdIn[6:0] ? 8'h73 : _GEN_74; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_76 = 7'h4a == bcdIn[6:0] ? 8'h74 : _GEN_75; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_77 = 7'h4b == bcdIn[6:0] ? 8'h75 : _GEN_76; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_78 = 7'h4c == bcdIn[6:0] ? 8'h76 : _GEN_77; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_79 = 7'h4d == bcdIn[6:0] ? 8'h77 : _GEN_78; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_80 = 7'h4e == bcdIn[6:0] ? 8'h78 : _GEN_79; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_81 = 7'h4f == bcdIn[6:0] ? 8'h79 : _GEN_80; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_82 = 7'h50 == bcdIn[6:0] ? 8'h80 : _GEN_81; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_83 = 7'h51 == bcdIn[6:0] ? 8'h81 : _GEN_82; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_84 = 7'h52 == bcdIn[6:0] ? 8'h82 : _GEN_83; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_85 = 7'h53 == bcdIn[6:0] ? 8'h83 : _GEN_84; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_86 = 7'h54 == bcdIn[6:0] ? 8'h84 : _GEN_85; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_87 = 7'h55 == bcdIn[6:0] ? 8'h85 : _GEN_86; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_88 = 7'h56 == bcdIn[6:0] ? 8'h86 : _GEN_87; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_89 = 7'h57 == bcdIn[6:0] ? 8'h87 : _GEN_88; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_90 = 7'h58 == bcdIn[6:0] ? 8'h88 : _GEN_89; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_91 = 7'h59 == bcdIn[6:0] ? 8'h89 : _GEN_90; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_92 = 7'h5a == bcdIn[6:0] ? 8'h90 : _GEN_91; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_93 = 7'h5b == bcdIn[6:0] ? 8'h91 : _GEN_92; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_94 = 7'h5c == bcdIn[6:0] ? 8'h92 : _GEN_93; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_95 = 7'h5d == bcdIn[6:0] ? 8'h93 : _GEN_94; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_96 = 7'h5e == bcdIn[6:0] ? 8'h94 : _GEN_95; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_97 = 7'h5f == bcdIn[6:0] ? 8'h95 : _GEN_96; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_98 = 7'h60 == bcdIn[6:0] ? 8'h96 : _GEN_97; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_99 = 7'h61 == bcdIn[6:0] ? 8'h97 : _GEN_98; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_100 = 7'h62 == bcdIn[6:0] ? 8'h98 : _GEN_99; // @[TextField.scala 27:{13,13}]
  wire [7:0] _GEN_101 = 7'h63 == bcdIn[6:0] ? 8'h99 : _GEN_100; // @[TextField.scala 27:{13,13}]
  wire [3:0] characters_0 = _GEN_101[7:4]; // @[TextField.scala 27:13]
  wire [3:0] characters_1 = _GEN_101[3:0]; // @[TextField.scala 28:13]
  wire [9:0] offset_x = gameIO_rendering_pxlPos_x - 10'h124; // @[TextField.scala 41:31]
  wire [9:0] offset_y = gameIO_rendering_pxlPos_y - 10'h0; // @[TextField.scala 42:31]
  wire  _active_T_2 = gameIO_rendering_pxlPos_x >= 10'h124 & gameIO_rendering_pxlPos_x < 10'h15c; // @[package.scala 16:50]
  wire  _active_T_4 = gameIO_rendering_pxlPos_y < 10'h10; // @[package.scala 16:55]
  wire [3:0] _GEN_103 = 3'h1 == offset_x[5:3] ? characters_1 : characters_0; // @[TextField.scala 48:{25,25}]
  wire [3:0] _GEN_104 = 3'h2 == offset_x[5:3] ? 4'hb : _GEN_103; // @[TextField.scala 48:{25,25}]
  wire [3:0] _GEN_105 = 3'h3 == offset_x[5:3] ? 4'ha : _GEN_104; // @[TextField.scala 48:{25,25}]
  wire [3:0] _GEN_106 = 3'h4 == offset_x[5:3] ? 4'hb : _GEN_105; // @[TextField.scala 48:{25,25}]
  wire [3:0] _GEN_107 = 3'h5 == offset_x[5:3] ? characters_0 : _GEN_106; // @[TextField.scala 48:{25,25}]
  wire [3:0] char = 3'h6 == offset_x[5:3] ? characters_1 : _GEN_107; // @[TextField.scala 48:{25,25}]
  wire [7:0] _GEN_111 = 4'h0 == char & 4'h2 == offset_y[3:0] ? 8'h3e : 8'h0; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_112 = 4'h0 == char & 4'h3 == offset_y[3:0] ? 8'h63 : _GEN_111; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_113 = 4'h0 == char & 4'h4 == offset_y[3:0] ? 8'h63 : _GEN_112; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_114 = 4'h0 == char & 4'h5 == offset_y[3:0] ? 8'h73 : _GEN_113; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_115 = 4'h0 == char & 4'h6 == offset_y[3:0] ? 8'h7b : _GEN_114; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_116 = 4'h0 == char & 4'h7 == offset_y[3:0] ? 8'h6f : _GEN_115; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_117 = 4'h0 == char & 4'h8 == offset_y[3:0] ? 8'h67 : _GEN_116; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_118 = 4'h0 == char & 4'h9 == offset_y[3:0] ? 8'h63 : _GEN_117; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_119 = 4'h0 == char & 4'ha == offset_y[3:0] ? 8'h63 : _GEN_118; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_120 = 4'h0 == char & 4'hb == offset_y[3:0] ? 8'h3e : _GEN_119; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_121 = 4'h0 == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_120; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_122 = 4'h0 == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_121; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_123 = 4'h0 == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_122; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_124 = 4'h0 == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_123; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_125 = 4'h1 == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_124; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_126 = 4'h1 == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_125; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_127 = 4'h1 == char & 4'h2 == offset_y[3:0] ? 8'h18 : _GEN_126; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_128 = 4'h1 == char & 4'h3 == offset_y[3:0] ? 8'h1c : _GEN_127; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_129 = 4'h1 == char & 4'h4 == offset_y[3:0] ? 8'h1e : _GEN_128; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_130 = 4'h1 == char & 4'h5 == offset_y[3:0] ? 8'h18 : _GEN_129; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_131 = 4'h1 == char & 4'h6 == offset_y[3:0] ? 8'h18 : _GEN_130; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_132 = 4'h1 == char & 4'h7 == offset_y[3:0] ? 8'h18 : _GEN_131; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_133 = 4'h1 == char & 4'h8 == offset_y[3:0] ? 8'h18 : _GEN_132; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_134 = 4'h1 == char & 4'h9 == offset_y[3:0] ? 8'h18 : _GEN_133; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_135 = 4'h1 == char & 4'ha == offset_y[3:0] ? 8'h18 : _GEN_134; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_136 = 4'h1 == char & 4'hb == offset_y[3:0] ? 8'h7e : _GEN_135; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_137 = 4'h1 == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_136; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_138 = 4'h1 == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_137; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_139 = 4'h1 == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_138; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_140 = 4'h1 == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_139; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_141 = 4'h2 == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_140; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_142 = 4'h2 == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_141; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_143 = 4'h2 == char & 4'h2 == offset_y[3:0] ? 8'h3e : _GEN_142; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_144 = 4'h2 == char & 4'h3 == offset_y[3:0] ? 8'h63 : _GEN_143; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_145 = 4'h2 == char & 4'h4 == offset_y[3:0] ? 8'h60 : _GEN_144; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_146 = 4'h2 == char & 4'h5 == offset_y[3:0] ? 8'h30 : _GEN_145; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_147 = 4'h2 == char & 4'h6 == offset_y[3:0] ? 8'h18 : _GEN_146; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_148 = 4'h2 == char & 4'h7 == offset_y[3:0] ? 8'hc : _GEN_147; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_149 = 4'h2 == char & 4'h8 == offset_y[3:0] ? 8'h6 : _GEN_148; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_150 = 4'h2 == char & 4'h9 == offset_y[3:0] ? 8'h3 : _GEN_149; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_151 = 4'h2 == char & 4'ha == offset_y[3:0] ? 8'h63 : _GEN_150; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_152 = 4'h2 == char & 4'hb == offset_y[3:0] ? 8'h7f : _GEN_151; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_153 = 4'h2 == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_152; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_154 = 4'h2 == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_153; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_155 = 4'h2 == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_154; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_156 = 4'h2 == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_155; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_157 = 4'h3 == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_156; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_158 = 4'h3 == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_157; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_159 = 4'h3 == char & 4'h2 == offset_y[3:0] ? 8'h3e : _GEN_158; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_160 = 4'h3 == char & 4'h3 == offset_y[3:0] ? 8'h63 : _GEN_159; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_161 = 4'h3 == char & 4'h4 == offset_y[3:0] ? 8'h60 : _GEN_160; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_162 = 4'h3 == char & 4'h5 == offset_y[3:0] ? 8'h60 : _GEN_161; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_163 = 4'h3 == char & 4'h6 == offset_y[3:0] ? 8'h3c : _GEN_162; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_164 = 4'h3 == char & 4'h7 == offset_y[3:0] ? 8'h60 : _GEN_163; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_165 = 4'h3 == char & 4'h8 == offset_y[3:0] ? 8'h60 : _GEN_164; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_166 = 4'h3 == char & 4'h9 == offset_y[3:0] ? 8'h60 : _GEN_165; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_167 = 4'h3 == char & 4'ha == offset_y[3:0] ? 8'h63 : _GEN_166; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_168 = 4'h3 == char & 4'hb == offset_y[3:0] ? 8'h3e : _GEN_167; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_169 = 4'h3 == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_168; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_170 = 4'h3 == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_169; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_171 = 4'h3 == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_170; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_172 = 4'h3 == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_171; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_173 = 4'h4 == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_172; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_174 = 4'h4 == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_173; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_175 = 4'h4 == char & 4'h2 == offset_y[3:0] ? 8'h30 : _GEN_174; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_176 = 4'h4 == char & 4'h3 == offset_y[3:0] ? 8'h38 : _GEN_175; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_177 = 4'h4 == char & 4'h4 == offset_y[3:0] ? 8'h3c : _GEN_176; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_178 = 4'h4 == char & 4'h5 == offset_y[3:0] ? 8'h36 : _GEN_177; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_179 = 4'h4 == char & 4'h6 == offset_y[3:0] ? 8'h33 : _GEN_178; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_180 = 4'h4 == char & 4'h7 == offset_y[3:0] ? 8'h7f : _GEN_179; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_181 = 4'h4 == char & 4'h8 == offset_y[3:0] ? 8'h30 : _GEN_180; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_182 = 4'h4 == char & 4'h9 == offset_y[3:0] ? 8'h30 : _GEN_181; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_183 = 4'h4 == char & 4'ha == offset_y[3:0] ? 8'h30 : _GEN_182; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_184 = 4'h4 == char & 4'hb == offset_y[3:0] ? 8'h78 : _GEN_183; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_185 = 4'h4 == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_184; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_186 = 4'h4 == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_185; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_187 = 4'h4 == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_186; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_188 = 4'h4 == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_187; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_189 = 4'h5 == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_188; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_190 = 4'h5 == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_189; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_191 = 4'h5 == char & 4'h2 == offset_y[3:0] ? 8'h7f : _GEN_190; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_192 = 4'h5 == char & 4'h3 == offset_y[3:0] ? 8'h3 : _GEN_191; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_193 = 4'h5 == char & 4'h4 == offset_y[3:0] ? 8'h3 : _GEN_192; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_194 = 4'h5 == char & 4'h5 == offset_y[3:0] ? 8'h3 : _GEN_193; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_195 = 4'h5 == char & 4'h6 == offset_y[3:0] ? 8'h3f : _GEN_194; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_196 = 4'h5 == char & 4'h7 == offset_y[3:0] ? 8'h60 : _GEN_195; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_197 = 4'h5 == char & 4'h8 == offset_y[3:0] ? 8'h60 : _GEN_196; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_198 = 4'h5 == char & 4'h9 == offset_y[3:0] ? 8'h60 : _GEN_197; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_199 = 4'h5 == char & 4'ha == offset_y[3:0] ? 8'h63 : _GEN_198; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_200 = 4'h5 == char & 4'hb == offset_y[3:0] ? 8'h3e : _GEN_199; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_201 = 4'h5 == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_200; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_202 = 4'h5 == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_201; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_203 = 4'h5 == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_202; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_204 = 4'h5 == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_203; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_205 = 4'h6 == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_204; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_206 = 4'h6 == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_205; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_207 = 4'h6 == char & 4'h2 == offset_y[3:0] ? 8'h1c : _GEN_206; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_208 = 4'h6 == char & 4'h3 == offset_y[3:0] ? 8'h6 : _GEN_207; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_209 = 4'h6 == char & 4'h4 == offset_y[3:0] ? 8'h3 : _GEN_208; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_210 = 4'h6 == char & 4'h5 == offset_y[3:0] ? 8'h3 : _GEN_209; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_211 = 4'h6 == char & 4'h6 == offset_y[3:0] ? 8'h3f : _GEN_210; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_212 = 4'h6 == char & 4'h7 == offset_y[3:0] ? 8'h63 : _GEN_211; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_213 = 4'h6 == char & 4'h8 == offset_y[3:0] ? 8'h63 : _GEN_212; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_214 = 4'h6 == char & 4'h9 == offset_y[3:0] ? 8'h63 : _GEN_213; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_215 = 4'h6 == char & 4'ha == offset_y[3:0] ? 8'h63 : _GEN_214; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_216 = 4'h6 == char & 4'hb == offset_y[3:0] ? 8'h3e : _GEN_215; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_217 = 4'h6 == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_216; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_218 = 4'h6 == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_217; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_219 = 4'h6 == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_218; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_220 = 4'h6 == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_219; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_221 = 4'h7 == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_220; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_222 = 4'h7 == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_221; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_223 = 4'h7 == char & 4'h2 == offset_y[3:0] ? 8'h7f : _GEN_222; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_224 = 4'h7 == char & 4'h3 == offset_y[3:0] ? 8'h63 : _GEN_223; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_225 = 4'h7 == char & 4'h4 == offset_y[3:0] ? 8'h60 : _GEN_224; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_226 = 4'h7 == char & 4'h5 == offset_y[3:0] ? 8'h60 : _GEN_225; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_227 = 4'h7 == char & 4'h6 == offset_y[3:0] ? 8'h30 : _GEN_226; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_228 = 4'h7 == char & 4'h7 == offset_y[3:0] ? 8'h18 : _GEN_227; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_229 = 4'h7 == char & 4'h8 == offset_y[3:0] ? 8'hc : _GEN_228; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_230 = 4'h7 == char & 4'h9 == offset_y[3:0] ? 8'hc : _GEN_229; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_231 = 4'h7 == char & 4'ha == offset_y[3:0] ? 8'hc : _GEN_230; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_232 = 4'h7 == char & 4'hb == offset_y[3:0] ? 8'hc : _GEN_231; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_233 = 4'h7 == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_232; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_234 = 4'h7 == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_233; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_235 = 4'h7 == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_234; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_236 = 4'h7 == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_235; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_237 = 4'h8 == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_236; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_238 = 4'h8 == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_237; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_239 = 4'h8 == char & 4'h2 == offset_y[3:0] ? 8'h3e : _GEN_238; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_240 = 4'h8 == char & 4'h3 == offset_y[3:0] ? 8'h63 : _GEN_239; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_241 = 4'h8 == char & 4'h4 == offset_y[3:0] ? 8'h63 : _GEN_240; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_242 = 4'h8 == char & 4'h5 == offset_y[3:0] ? 8'h63 : _GEN_241; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_243 = 4'h8 == char & 4'h6 == offset_y[3:0] ? 8'h3e : _GEN_242; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_244 = 4'h8 == char & 4'h7 == offset_y[3:0] ? 8'h63 : _GEN_243; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_245 = 4'h8 == char & 4'h8 == offset_y[3:0] ? 8'h63 : _GEN_244; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_246 = 4'h8 == char & 4'h9 == offset_y[3:0] ? 8'h63 : _GEN_245; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_247 = 4'h8 == char & 4'ha == offset_y[3:0] ? 8'h63 : _GEN_246; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_248 = 4'h8 == char & 4'hb == offset_y[3:0] ? 8'h3e : _GEN_247; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_249 = 4'h8 == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_248; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_250 = 4'h8 == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_249; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_251 = 4'h8 == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_250; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_252 = 4'h8 == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_251; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_253 = 4'h9 == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_252; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_254 = 4'h9 == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_253; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_255 = 4'h9 == char & 4'h2 == offset_y[3:0] ? 8'h3e : _GEN_254; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_256 = 4'h9 == char & 4'h3 == offset_y[3:0] ? 8'h63 : _GEN_255; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_257 = 4'h9 == char & 4'h4 == offset_y[3:0] ? 8'h63 : _GEN_256; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_258 = 4'h9 == char & 4'h5 == offset_y[3:0] ? 8'h63 : _GEN_257; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_259 = 4'h9 == char & 4'h6 == offset_y[3:0] ? 8'h7e : _GEN_258; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_260 = 4'h9 == char & 4'h7 == offset_y[3:0] ? 8'h60 : _GEN_259; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_261 = 4'h9 == char & 4'h8 == offset_y[3:0] ? 8'h60 : _GEN_260; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_262 = 4'h9 == char & 4'h9 == offset_y[3:0] ? 8'h60 : _GEN_261; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_263 = 4'h9 == char & 4'ha == offset_y[3:0] ? 8'h30 : _GEN_262; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_264 = 4'h9 == char & 4'hb == offset_y[3:0] ? 8'h1e : _GEN_263; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_265 = 4'h9 == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_264; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_266 = 4'h9 == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_265; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_267 = 4'h9 == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_266; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_268 = 4'h9 == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_267; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_269 = 4'ha == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_268; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_270 = 4'ha == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_269; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_271 = 4'ha == char & 4'h2 == offset_y[3:0] ? 8'h0 : _GEN_270; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_272 = 4'ha == char & 4'h3 == offset_y[3:0] ? 8'h0 : _GEN_271; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_273 = 4'ha == char & 4'h4 == offset_y[3:0] ? 8'h0 : _GEN_272; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_274 = 4'ha == char & 4'h5 == offset_y[3:0] ? 8'h0 : _GEN_273; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_275 = 4'ha == char & 4'h6 == offset_y[3:0] ? 8'h0 : _GEN_274; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_276 = 4'ha == char & 4'h7 == offset_y[3:0] ? 8'h7e : _GEN_275; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_277 = 4'ha == char & 4'h8 == offset_y[3:0] ? 8'h0 : _GEN_276; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_278 = 4'ha == char & 4'h9 == offset_y[3:0] ? 8'h0 : _GEN_277; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_279 = 4'ha == char & 4'ha == offset_y[3:0] ? 8'h0 : _GEN_278; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_280 = 4'ha == char & 4'hb == offset_y[3:0] ? 8'h0 : _GEN_279; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_281 = 4'ha == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_280; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_282 = 4'ha == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_281; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_283 = 4'ha == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_282; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_284 = 4'ha == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_283; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_285 = 4'hb == char & 4'h0 == offset_y[3:0] ? 8'h0 : _GEN_284; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_286 = 4'hb == char & 4'h1 == offset_y[3:0] ? 8'h0 : _GEN_285; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_287 = 4'hb == char & 4'h2 == offset_y[3:0] ? 8'h0 : _GEN_286; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_288 = 4'hb == char & 4'h3 == offset_y[3:0] ? 8'h0 : _GEN_287; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_289 = 4'hb == char & 4'h4 == offset_y[3:0] ? 8'h0 : _GEN_288; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_290 = 4'hb == char & 4'h5 == offset_y[3:0] ? 8'h0 : _GEN_289; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_291 = 4'hb == char & 4'h6 == offset_y[3:0] ? 8'h0 : _GEN_290; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_292 = 4'hb == char & 4'h7 == offset_y[3:0] ? 8'h0 : _GEN_291; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_293 = 4'hb == char & 4'h8 == offset_y[3:0] ? 8'h0 : _GEN_292; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_294 = 4'hb == char & 4'h9 == offset_y[3:0] ? 8'h0 : _GEN_293; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_295 = 4'hb == char & 4'ha == offset_y[3:0] ? 8'h0 : _GEN_294; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_296 = 4'hb == char & 4'hb == offset_y[3:0] ? 8'h0 : _GEN_295; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_297 = 4'hb == char & 4'hc == offset_y[3:0] ? 8'h0 : _GEN_296; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_298 = 4'hb == char & 4'hd == offset_y[3:0] ? 8'h0 : _GEN_297; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_299 = 4'hb == char & 4'he == offset_y[3:0] ? 8'h0 : _GEN_298; // @[TextField.scala 52:{43,43}]
  wire [7:0] _GEN_300 = 4'hb == char & 4'hf == offset_y[3:0] ? 8'h0 : _GEN_299; // @[TextField.scala 52:{43,43}]
  wire [7:0] _charBit_T_4 = _GEN_300 >> offset_x[2:0]; // @[TextField.scala 52:43]
  wire  charBit = _charBit_T_4[0]; // @[TextField.scala 52:43]
  assign gameIO_rendering_color_r = charBit ? 2'h3 : 2'h0; // @[TextField.scala 54:32]
  assign gameIO_rendering_color_g = charBit ? 2'h3 : 2'h0; // @[TextField.scala 54:32]
  assign gameIO_rendering_color_b = charBit ? 2'h3 : 2'h0; // @[TextField.scala 54:32]
  assign gameIO_rendering_active = _active_T_2 & _active_T_4; // @[TextField.scala 45:73]
  always @(posedge clock) begin
    if (reset) begin // @[TextField.scala 13:23]
      scores_0 <= 8'h0; // @[TextField.scala 13:23]
    end else if (io_increaseScore_0) begin // @[TextField.scala 16:14]
      scores_0 <= _scores_0_T_1; // @[TextField.scala 17:11]
    end
    if (reset) begin // @[TextField.scala 13:23]
      scores_1 <= 8'h0; // @[TextField.scala 13:23]
    end else if (io_increaseScore_1) begin // @[TextField.scala 16:14]
      scores_1 <= _scores_1_T_1; // @[TextField.scala 17:11]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  scores_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  scores_1 = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Pong(
  input        clock,
  input        reset,
  output       io_hSync,
  output       io_vSync,
  output [1:0] io_rgb_r,
  output [1:0] io_rgb_g,
  output [1:0] io_rgb_b,
  input  [3:0] io_btn,
  input        io_autopilot_0,
  input        io_autopilot_1,
  input        io_ena,
  output [7:0] io_debug
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  vgaTimer_clock; // @[Pong.scala 32:24]
  wire  vgaTimer_reset; // @[Pong.scala 32:24]
  wire  vgaTimer_io_ena; // @[Pong.scala 32:24]
  wire  vgaTimer_io_hSync; // @[Pong.scala 32:24]
  wire  vgaTimer_io_vSync; // @[Pong.scala 32:24]
  wire [9:0] vgaTimer_io_pos_x; // @[Pong.scala 32:24]
  wire [9:0] vgaTimer_io_pos_y; // @[Pong.scala 32:24]
  wire  btn_debouncer_clock; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_reset; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_io_in; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_io_out; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_io_tick; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_1_clock; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_1_reset; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_1_io_in; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_1_io_out; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_1_io_tick; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_2_clock; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_2_reset; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_2_io_in; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_2_io_out; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_2_io_tick; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_3_clock; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_3_reset; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_3_io_in; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_3_io_out; // @[Debouncer.scala 27:27]
  wire  btn_debouncer_3_io_tick; // @[Debouncer.scala 27:27]
  wire  gameObjs_0_clock; // @[Pong.scala 40:25]
  wire  gameObjs_0_reset; // @[Pong.scala 40:25]
  wire  gameObjs_0_gameIO_tick; // @[Pong.scala 40:25]
  wire [9:0] gameObjs_0_gameIO_rendering_pxlPos_x; // @[Pong.scala 40:25]
  wire [9:0] gameObjs_0_gameIO_rendering_pxlPos_y; // @[Pong.scala 40:25]
  wire [1:0] gameObjs_0_gameIO_rendering_color_g; // @[Pong.scala 40:25]
  wire [1:0] gameObjs_0_gameIO_rendering_color_b; // @[Pong.scala 40:25]
  wire  gameObjs_0_gameIO_rendering_active; // @[Pong.scala 40:25]
  wire  gameObjs_0_io_up; // @[Pong.scala 40:25]
  wire  gameObjs_0_io_down; // @[Pong.scala 40:25]
  wire [8:0] gameObjs_0_io_pos; // @[Pong.scala 40:25]
  wire [9:0] gameObjs_0_io_ballPos_x; // @[Pong.scala 40:25]
  wire [9:0] gameObjs_0_io_ballPos_y; // @[Pong.scala 40:25]
  wire [4:0] gameObjs_0_io_ballVel_x; // @[Pong.scala 40:25]
  wire  gameObjs_0_io_force; // @[Pong.scala 40:25]
  wire  gameObjs_1_clock; // @[Pong.scala 44:26]
  wire  gameObjs_1_reset; // @[Pong.scala 44:26]
  wire  gameObjs_1_gameIO_tick; // @[Pong.scala 44:26]
  wire [9:0] gameObjs_1_gameIO_rendering_pxlPos_x; // @[Pong.scala 44:26]
  wire [9:0] gameObjs_1_gameIO_rendering_pxlPos_y; // @[Pong.scala 44:26]
  wire [1:0] gameObjs_1_gameIO_rendering_color_g; // @[Pong.scala 44:26]
  wire [1:0] gameObjs_1_gameIO_rendering_color_b; // @[Pong.scala 44:26]
  wire  gameObjs_1_gameIO_rendering_active; // @[Pong.scala 44:26]
  wire  gameObjs_1_io_up; // @[Pong.scala 44:26]
  wire  gameObjs_1_io_down; // @[Pong.scala 44:26]
  wire [8:0] gameObjs_1_io_pos; // @[Pong.scala 44:26]
  wire [9:0] gameObjs_1_io_ballPos_x; // @[Pong.scala 44:26]
  wire [9:0] gameObjs_1_io_ballPos_y; // @[Pong.scala 44:26]
  wire [4:0] gameObjs_1_io_ballVel_x; // @[Pong.scala 44:26]
  wire  gameObjs_1_io_force; // @[Pong.scala 44:26]
  wire  ball_clock; // @[Pong.scala 48:20]
  wire  ball_reset; // @[Pong.scala 48:20]
  wire  ball_gameIO_newGame; // @[Pong.scala 48:20]
  wire  ball_gameIO_tick; // @[Pong.scala 48:20]
  wire [9:0] ball_gameIO_rendering_pxlPos_x; // @[Pong.scala 48:20]
  wire [9:0] ball_gameIO_rendering_pxlPos_y; // @[Pong.scala 48:20]
  wire [1:0] ball_gameIO_rendering_color_r; // @[Pong.scala 48:20]
  wire [1:0] ball_gameIO_rendering_color_g; // @[Pong.scala 48:20]
  wire [1:0] ball_gameIO_rendering_color_b; // @[Pong.scala 48:20]
  wire  ball_gameIO_rendering_active; // @[Pong.scala 48:20]
  wire [8:0] ball_io_leftPedalPos; // @[Pong.scala 48:20]
  wire [8:0] ball_io_rightPedalPos; // @[Pong.scala 48:20]
  wire  ball_io_lost_0; // @[Pong.scala 48:20]
  wire  ball_io_lost_1; // @[Pong.scala 48:20]
  wire [9:0] ball_io_pos_x; // @[Pong.scala 48:20]
  wire [9:0] ball_io_pos_y; // @[Pong.scala 48:20]
  wire [4:0] ball_io_vel_x; // @[Pong.scala 48:20]
  wire  gameObjs_3_clock; // @[Pong.scala 59:21]
  wire  gameObjs_3_reset; // @[Pong.scala 59:21]
  wire [9:0] gameObjs_3_gameIO_rendering_pxlPos_x; // @[Pong.scala 59:21]
  wire [9:0] gameObjs_3_gameIO_rendering_pxlPos_y; // @[Pong.scala 59:21]
  wire [1:0] gameObjs_3_gameIO_rendering_color_r; // @[Pong.scala 59:21]
  wire [1:0] gameObjs_3_gameIO_rendering_color_g; // @[Pong.scala 59:21]
  wire [1:0] gameObjs_3_gameIO_rendering_color_b; // @[Pong.scala 59:21]
  wire  gameObjs_3_gameIO_rendering_active; // @[Pong.scala 59:21]
  wire  gameObjs_3_io_increaseScore_0; // @[Pong.scala 59:21]
  wire  gameObjs_3_io_increaseScore_1; // @[Pong.scala 59:21]
  reg [2:0] stateReg; // @[Pong.scala 30:25]
  reg  tick_REG; // @[package.scala 13:50]
  wire  tick = vgaTimer_io_vSync & ~tick_REG; // @[package.scala 13:39]
  wire [1:0] _io_rgb_T_r = gameObjs_3_gameIO_rendering_active ? gameObjs_3_gameIO_rendering_color_r : 2'h0; // @[Mux.scala 47:70]
  wire [1:0] _io_rgb_T_g = gameObjs_3_gameIO_rendering_active ? gameObjs_3_gameIO_rendering_color_g : 2'h0; // @[Mux.scala 47:70]
  wire [1:0] _io_rgb_T_b = gameObjs_3_gameIO_rendering_active ? gameObjs_3_gameIO_rendering_color_b : 2'h0; // @[Mux.scala 47:70]
  wire [1:0] _io_rgb_T_1_r = ball_gameIO_rendering_active ? ball_gameIO_rendering_color_r : _io_rgb_T_r; // @[Mux.scala 47:70]
  wire [1:0] _io_rgb_T_1_g = ball_gameIO_rendering_active ? ball_gameIO_rendering_color_g : _io_rgb_T_g; // @[Mux.scala 47:70]
  wire [1:0] _io_rgb_T_1_b = ball_gameIO_rendering_active ? ball_gameIO_rendering_color_b : _io_rgb_T_b; // @[Mux.scala 47:70]
  wire [1:0] _io_rgb_T_2_r = gameObjs_1_gameIO_rendering_active ? 2'h0 : _io_rgb_T_1_r; // @[Mux.scala 47:70]
  wire [1:0] _io_rgb_T_2_g = gameObjs_1_gameIO_rendering_active ? gameObjs_1_gameIO_rendering_color_g : _io_rgb_T_1_g; // @[Mux.scala 47:70]
  wire [1:0] _io_rgb_T_2_b = gameObjs_1_gameIO_rendering_active ? gameObjs_1_gameIO_rendering_color_b : _io_rgb_T_1_b; // @[Mux.scala 47:70]
  wire  _T_11 = btn_debouncer_io_out | btn_debouncer_1_io_out | btn_debouncer_2_io_out | btn_debouncer_3_io_out; // @[Pong.scala 80:25]
  wire [2:0] _GEN_2 = ~_T_11 ? 3'h4 : stateReg; // @[Pong.scala 93:33 94:18 30:25]
  wire [2:0] _GEN_3 = 3'h4 == stateReg ? 3'h0 : stateReg; // @[Pong.scala 78:20 98:16 30:25]
  wire [2:0] _GEN_4 = 3'h3 == stateReg ? _GEN_2 : _GEN_3; // @[Pong.scala 78:20]
  wire [4:0] io_debug_lo = {vgaTimer_io_hSync,vgaTimer_io_vSync,stateReg}; // @[Cat.scala 33:92]
  wire [2:0] io_debug_hi = {tick,ball_io_lost_1,ball_io_lost_0}; // @[Cat.scala 33:92]
  VgaTimer vgaTimer ( // @[Pong.scala 32:24]
    .clock(vgaTimer_clock),
    .reset(vgaTimer_reset),
    .io_ena(vgaTimer_io_ena),
    .io_hSync(vgaTimer_io_hSync),
    .io_vSync(vgaTimer_io_vSync),
    .io_pos_x(vgaTimer_io_pos_x),
    .io_pos_y(vgaTimer_io_pos_y)
  );
  Debouncer btn_debouncer ( // @[Debouncer.scala 27:27]
    .clock(btn_debouncer_clock),
    .reset(btn_debouncer_reset),
    .io_in(btn_debouncer_io_in),
    .io_out(btn_debouncer_io_out),
    .io_tick(btn_debouncer_io_tick)
  );
  Debouncer btn_debouncer_1 ( // @[Debouncer.scala 27:27]
    .clock(btn_debouncer_1_clock),
    .reset(btn_debouncer_1_reset),
    .io_in(btn_debouncer_1_io_in),
    .io_out(btn_debouncer_1_io_out),
    .io_tick(btn_debouncer_1_io_tick)
  );
  Debouncer btn_debouncer_2 ( // @[Debouncer.scala 27:27]
    .clock(btn_debouncer_2_clock),
    .reset(btn_debouncer_2_reset),
    .io_in(btn_debouncer_2_io_in),
    .io_out(btn_debouncer_2_io_out),
    .io_tick(btn_debouncer_2_io_tick)
  );
  Debouncer btn_debouncer_3 ( // @[Debouncer.scala 27:27]
    .clock(btn_debouncer_3_clock),
    .reset(btn_debouncer_3_reset),
    .io_in(btn_debouncer_3_io_in),
    .io_out(btn_debouncer_3_io_out),
    .io_tick(btn_debouncer_3_io_tick)
  );
  Pedal gameObjs_0 ( // @[Pong.scala 40:25]
    .clock(gameObjs_0_clock),
    .reset(gameObjs_0_reset),
    .gameIO_tick(gameObjs_0_gameIO_tick),
    .gameIO_rendering_pxlPos_x(gameObjs_0_gameIO_rendering_pxlPos_x),
    .gameIO_rendering_pxlPos_y(gameObjs_0_gameIO_rendering_pxlPos_y),
    .gameIO_rendering_color_g(gameObjs_0_gameIO_rendering_color_g),
    .gameIO_rendering_color_b(gameObjs_0_gameIO_rendering_color_b),
    .gameIO_rendering_active(gameObjs_0_gameIO_rendering_active),
    .io_up(gameObjs_0_io_up),
    .io_down(gameObjs_0_io_down),
    .io_pos(gameObjs_0_io_pos),
    .io_ballPos_x(gameObjs_0_io_ballPos_x),
    .io_ballPos_y(gameObjs_0_io_ballPos_y),
    .io_ballVel_x(gameObjs_0_io_ballVel_x),
    .io_force(gameObjs_0_io_force)
  );
  Pedal_1 gameObjs_1 ( // @[Pong.scala 44:26]
    .clock(gameObjs_1_clock),
    .reset(gameObjs_1_reset),
    .gameIO_tick(gameObjs_1_gameIO_tick),
    .gameIO_rendering_pxlPos_x(gameObjs_1_gameIO_rendering_pxlPos_x),
    .gameIO_rendering_pxlPos_y(gameObjs_1_gameIO_rendering_pxlPos_y),
    .gameIO_rendering_color_g(gameObjs_1_gameIO_rendering_color_g),
    .gameIO_rendering_color_b(gameObjs_1_gameIO_rendering_color_b),
    .gameIO_rendering_active(gameObjs_1_gameIO_rendering_active),
    .io_up(gameObjs_1_io_up),
    .io_down(gameObjs_1_io_down),
    .io_pos(gameObjs_1_io_pos),
    .io_ballPos_x(gameObjs_1_io_ballPos_x),
    .io_ballPos_y(gameObjs_1_io_ballPos_y),
    .io_ballVel_x(gameObjs_1_io_ballVel_x),
    .io_force(gameObjs_1_io_force)
  );
  Ball ball ( // @[Pong.scala 48:20]
    .clock(ball_clock),
    .reset(ball_reset),
    .gameIO_newGame(ball_gameIO_newGame),
    .gameIO_tick(ball_gameIO_tick),
    .gameIO_rendering_pxlPos_x(ball_gameIO_rendering_pxlPos_x),
    .gameIO_rendering_pxlPos_y(ball_gameIO_rendering_pxlPos_y),
    .gameIO_rendering_color_r(ball_gameIO_rendering_color_r),
    .gameIO_rendering_color_g(ball_gameIO_rendering_color_g),
    .gameIO_rendering_color_b(ball_gameIO_rendering_color_b),
    .gameIO_rendering_active(ball_gameIO_rendering_active),
    .io_leftPedalPos(ball_io_leftPedalPos),
    .io_rightPedalPos(ball_io_rightPedalPos),
    .io_lost_0(ball_io_lost_0),
    .io_lost_1(ball_io_lost_1),
    .io_pos_x(ball_io_pos_x),
    .io_pos_y(ball_io_pos_y),
    .io_vel_x(ball_io_vel_x)
  );
  TextField gameObjs_3 ( // @[Pong.scala 59:21]
    .clock(gameObjs_3_clock),
    .reset(gameObjs_3_reset),
    .gameIO_rendering_pxlPos_x(gameObjs_3_gameIO_rendering_pxlPos_x),
    .gameIO_rendering_pxlPos_y(gameObjs_3_gameIO_rendering_pxlPos_y),
    .gameIO_rendering_color_r(gameObjs_3_gameIO_rendering_color_r),
    .gameIO_rendering_color_g(gameObjs_3_gameIO_rendering_color_g),
    .gameIO_rendering_color_b(gameObjs_3_gameIO_rendering_color_b),
    .gameIO_rendering_active(gameObjs_3_gameIO_rendering_active),
    .io_increaseScore_0(gameObjs_3_io_increaseScore_0),
    .io_increaseScore_1(gameObjs_3_io_increaseScore_1)
  );
  assign io_hSync = vgaTimer_io_hSync; // @[Pong.scala 70:12]
  assign io_vSync = vgaTimer_io_vSync; // @[Pong.scala 71:12]
  assign io_rgb_r = gameObjs_0_gameIO_rendering_active ? 2'h0 : _io_rgb_T_2_r; // @[Mux.scala 47:70]
  assign io_rgb_g = gameObjs_0_gameIO_rendering_active ? gameObjs_0_gameIO_rendering_color_g : _io_rgb_T_2_g; // @[Mux.scala 47:70]
  assign io_rgb_b = gameObjs_0_gameIO_rendering_active ? gameObjs_0_gameIO_rendering_color_b : _io_rgb_T_2_b; // @[Mux.scala 47:70]
  assign io_debug = {io_debug_hi,io_debug_lo}; // @[Cat.scala 33:92]
  assign vgaTimer_clock = clock;
  assign vgaTimer_reset = reset;
  assign vgaTimer_io_ena = io_ena; // @[Pong.scala 33:19]
  assign btn_debouncer_clock = clock;
  assign btn_debouncer_reset = reset;
  assign btn_debouncer_io_in = io_btn[0]; // @[Pong.scala 36:20]
  assign btn_debouncer_io_tick = vgaTimer_io_vSync & ~tick_REG; // @[package.scala 13:39]
  assign btn_debouncer_1_clock = clock;
  assign btn_debouncer_1_reset = reset;
  assign btn_debouncer_1_io_in = io_btn[1]; // @[Pong.scala 36:20]
  assign btn_debouncer_1_io_tick = vgaTimer_io_vSync & ~tick_REG; // @[package.scala 13:39]
  assign btn_debouncer_2_clock = clock;
  assign btn_debouncer_2_reset = reset;
  assign btn_debouncer_2_io_in = io_btn[2]; // @[Pong.scala 36:20]
  assign btn_debouncer_2_io_tick = vgaTimer_io_vSync & ~tick_REG; // @[package.scala 13:39]
  assign btn_debouncer_3_clock = clock;
  assign btn_debouncer_3_reset = reset;
  assign btn_debouncer_3_io_in = io_btn[3]; // @[Pong.scala 36:20]
  assign btn_debouncer_3_io_tick = vgaTimer_io_vSync & ~tick_REG; // @[package.scala 13:39]
  assign gameObjs_0_clock = clock;
  assign gameObjs_0_reset = reset;
  assign gameObjs_0_gameIO_tick = tick & stateReg == 3'h1; // @[Pong.scala 66:51]
  assign gameObjs_0_gameIO_rendering_pxlPos_x = vgaTimer_io_pos_x; // @[Pong.scala 68:55]
  assign gameObjs_0_gameIO_rendering_pxlPos_y = vgaTimer_io_pos_y; // @[Pong.scala 68:55]
  assign gameObjs_0_io_up = btn_debouncer_io_out & tick; // @[Pong.scala 38:33]
  assign gameObjs_0_io_down = btn_debouncer_1_io_out & tick; // @[Pong.scala 38:33]
  assign gameObjs_0_io_ballPos_x = ball_io_pos_x; // @[Pong.scala 52:24]
  assign gameObjs_0_io_ballPos_y = ball_io_pos_y; // @[Pong.scala 52:24]
  assign gameObjs_0_io_ballVel_x = ball_io_vel_x; // @[Pong.scala 54:24]
  assign gameObjs_0_io_force = io_autopilot_0; // @[Pong.scala 56:22]
  assign gameObjs_1_clock = clock;
  assign gameObjs_1_reset = reset;
  assign gameObjs_1_gameIO_tick = tick & stateReg == 3'h1; // @[Pong.scala 66:51]
  assign gameObjs_1_gameIO_rendering_pxlPos_x = vgaTimer_io_pos_x; // @[Pong.scala 68:55]
  assign gameObjs_1_gameIO_rendering_pxlPos_y = vgaTimer_io_pos_y; // @[Pong.scala 68:55]
  assign gameObjs_1_io_up = btn_debouncer_2_io_out & tick; // @[Pong.scala 38:33]
  assign gameObjs_1_io_down = btn_debouncer_3_io_out & tick; // @[Pong.scala 38:33]
  assign gameObjs_1_io_ballPos_x = ball_io_pos_x; // @[Pong.scala 53:25]
  assign gameObjs_1_io_ballPos_y = ball_io_pos_y; // @[Pong.scala 53:25]
  assign gameObjs_1_io_ballVel_x = ball_io_vel_x; // @[Pong.scala 55:25]
  assign gameObjs_1_io_force = io_autopilot_1; // @[Pong.scala 57:23]
  assign ball_clock = clock;
  assign ball_reset = reset;
  assign ball_gameIO_newGame = stateReg == 3'h4; // @[Pong.scala 67:58]
  assign ball_gameIO_tick = tick & stateReg == 3'h1; // @[Pong.scala 66:51]
  assign ball_gameIO_rendering_pxlPos_x = vgaTimer_io_pos_x; // @[Pong.scala 68:55]
  assign ball_gameIO_rendering_pxlPos_y = vgaTimer_io_pos_y; // @[Pong.scala 68:55]
  assign ball_io_leftPedalPos = gameObjs_0_io_pos; // @[Pong.scala 49:24]
  assign ball_io_rightPedalPos = gameObjs_1_io_pos; // @[Pong.scala 50:25]
  assign gameObjs_3_clock = clock;
  assign gameObjs_3_reset = reset;
  assign gameObjs_3_gameIO_rendering_pxlPos_x = vgaTimer_io_pos_x; // @[Pong.scala 68:55]
  assign gameObjs_3_gameIO_rendering_pxlPos_y = vgaTimer_io_pos_y; // @[Pong.scala 68:55]
  assign gameObjs_3_io_increaseScore_0 = ~ball_io_lost_0 & stateReg == 3'h2; // @[Pong.scala 61:36]
  assign gameObjs_3_io_increaseScore_1 = ~ball_io_lost_1 & stateReg == 3'h2; // @[Pong.scala 61:36]
  always @(posedge clock) begin
    if (reset) begin // @[Pong.scala 30:25]
      stateReg <= 3'h0; // @[Pong.scala 30:25]
    end else if (3'h0 == stateReg) begin // @[Pong.scala 78:20]
      if ((btn_debouncer_io_out | btn_debouncer_1_io_out | btn_debouncer_2_io_out | btn_debouncer_3_io_out) & io_ena
        ) begin // @[Pong.scala 80:42]
        stateReg <= 3'h1; // @[Pong.scala 81:18]
      end
    end else if (3'h1 == stateReg) begin // @[Pong.scala 78:20]
      if (ball_io_lost_0 | ball_io_lost_1) begin // @[Pong.scala 85:41]
        stateReg <= 3'h2; // @[Pong.scala 86:18]
      end
    end else if (3'h2 == stateReg) begin // @[Pong.scala 78:20]
      stateReg <= 3'h3; // @[Pong.scala 90:16]
    end else begin
      stateReg <= _GEN_4;
    end
    tick_REG <= vgaTimer_io_vSync; // @[package.scala 13:50]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  tick_REG = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ChiselTop(
  input        clock,
  input        reset,
  input  [7:0] io_ui_in,
  output [7:0] io_uo_out,
  input  [7:0] io_uio_in,
  output [7:0] io_uio_out,
  output [7:0] io_uio_oe,
  input        io_ena
);
  wire  pong_clock; // @[ChiselTop.scala 31:20]
  wire  pong_reset; // @[ChiselTop.scala 31:20]
  wire  pong_io_hSync; // @[ChiselTop.scala 31:20]
  wire  pong_io_vSync; // @[ChiselTop.scala 31:20]
  wire [1:0] pong_io_rgb_r; // @[ChiselTop.scala 31:20]
  wire [1:0] pong_io_rgb_g; // @[ChiselTop.scala 31:20]
  wire [1:0] pong_io_rgb_b; // @[ChiselTop.scala 31:20]
  wire [3:0] pong_io_btn; // @[ChiselTop.scala 31:20]
  wire  pong_io_autopilot_0; // @[ChiselTop.scala 31:20]
  wire  pong_io_autopilot_1; // @[ChiselTop.scala 31:20]
  wire  pong_io_ena; // @[ChiselTop.scala 31:20]
  wire [7:0] pong_io_debug; // @[ChiselTop.scala 31:20]
  wire [3:0] io_uo_out_lo = {pong_io_vSync,pong_io_rgb_b[1],pong_io_rgb_g[1],pong_io_rgb_r[1]}; // @[Cat.scala 33:92]
  wire [3:0] io_uo_out_hi = {pong_io_hSync,pong_io_rgb_b[0],pong_io_rgb_g[0],pong_io_rgb_r[0]}; // @[Cat.scala 33:92]
  Pong pong ( // @[ChiselTop.scala 31:20]
    .clock(pong_clock),
    .reset(pong_reset),
    .io_hSync(pong_io_hSync),
    .io_vSync(pong_io_vSync),
    .io_rgb_r(pong_io_rgb_r),
    .io_rgb_g(pong_io_rgb_g),
    .io_rgb_b(pong_io_rgb_b),
    .io_btn(pong_io_btn),
    .io_autopilot_0(pong_io_autopilot_0),
    .io_autopilot_1(pong_io_autopilot_1),
    .io_ena(pong_io_ena),
    .io_debug(pong_io_debug)
  );
  assign io_uo_out = {io_uo_out_hi,io_uo_out_lo}; // @[Cat.scala 33:92]
  assign io_uio_out = pong_io_debug; // @[ChiselTop.scala 37:14]
  assign io_uio_oe = 8'hff; // @[Bitwise.scala 77:12]
  assign pong_clock = clock;
  assign pong_reset = reset;
  assign pong_io_btn = io_ui_in[3:0]; // @[ChiselTop.scala 32:26]
  assign pong_io_autopilot_0 = io_ui_in[5]; // @[ChiselTop.scala 33:40]
  assign pong_io_autopilot_1 = io_ui_in[4]; // @[ChiselTop.scala 33:53]
  assign pong_io_ena = io_ena; // @[ChiselTop.scala 34:15]
endmodule
