// set the timescale
`timescale 1 ns / 100 ps

module nand_gate_tb();
  // testbenches take no arguments
  // set up inputs of NAND gate as registers so they can be manipulated at will
  reg in1;
  reg in2;

  // clocks are useful for testbenches because they allow you to check your circuit at regular intervals large enough for signals to propagate
  reg clock;

  // set up output of NAND gate as wire
  wire out;

  // prepare any other variables you want - nothing is off-limits in a TB
  integer num_errors;

  // instantiate the NAND gate
  nand_gate test_nand_gate (in1, in2, out);

  // begin simulation
  initial begin
    $display($time, " simulation start");

    clock = 1'b0;
    num_errors = 0;

    @(negedge clock); // 表示等待时钟信号从高电平（positive edge）变为低电平（negative edge）
    // 在下一个时钟下降沿时，将in1和in2分别赋值为1'b0，即将它们都设置为0。
    in1 = 1'b0;
    in2 = 1'b0;

    @(negedge clock);
    if (out != 1'b1) begin
      $display("in1 %b in2 %b Error: expected 1 got %b", in1, in2, out);
      num_errors = num_errors + 1;
    end

    @(negedge clock);
    in1 = 1'b0;
    in2 = 1'b1;

    @(negedge clock);
    if (out != 1'b1) begin
      $display("in1 %b in2 %b Error: expected 0 got %b", in1, in2, out);
      num_errors = num_errors + 1;
    end

    @(negedge clock);
    in1 = 1'b1;
    in2 = 1'b0;

    @(negedge clock);
    if (out != 1'b1) begin
      $display("in1 %b in2 %b Error: expected 0 got %b", in1, in2, out);
      num_errors = num_errors + 1;
    end

    @(negedge clock);
    in1 = 1'b1;
    in2 = 1'b1;

    @(negedge clock);
    if (out != 1'b0) begin
      $display("in1 %b in2 %b Error: expected 0 got %b", in1, in2, out);
      num_errors = num_errors + 1;
    end

    if (num_errors == 0) begin
      $display("Simulation succeeded with no errors.");
    end else begin
      $display("Simulation failed with %d error(s).", num_errors);
    end
  end

  always
  #10 clock = ~clock; // toggle clock every 10 timescale units

endmodule