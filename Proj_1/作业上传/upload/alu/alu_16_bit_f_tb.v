// set the timescale
`timescale 1 ns / 100 ps

module alu_16_bit_f_tb;
    // set up clock
    reg clock;

    // count errors
    integer num_errors;

    // Inputs
    reg [15:0] operandA, operandB;
    reg Ainvert, Binvert, carry_in;
    reg [1:0] Operation;

    // Outputs
    wire [15:0] out;
    wire carry_out, overflow;

    // Instantiate the DUT
    alu_16_bit_f dut (
        .operandA(operandA),
        .operandB(operandB),
        .Ainvert(Ainvert),
        .Binvert(Binvert),
        .Operation(Operation),
        .carry_in(carry_in),
        .carry_out(carry_out),
        .out(out),
        .overflow(overflow)
    );
  
// begin simulation
  initial begin
    $display($time, " simulation start");

    clock = 1'b0;
    num_errors = 0; 

    // Testcase 1: 正数相加的overflow
    @(negedge clock);
    operandA = 16'b0111111111111111;
    operandB = 16'b0000000000000001;
    Ainvert = 0;
    Binvert = 0;
    carry_in = 0;
    Operation = 2'b10;  // add

    @(negedge clock);
    if (overflow !== 1'b1) begin
        $display("Testcase 1 failed, got overflow = %b, expected overflow = 1", overflow);
        num_errors = num_errors + 1;
    end


    // Testcase 2: 正常的减法
    @(negedge clock);
    operandA = 16'b0101101011110010;
    operandB = 16'b0010010101101101;
    Ainvert = 0;
    Binvert = 1'b1;     
    carry_in = 1'b1;
    Operation = 2'b10;  // subtract

    @(negedge clock);
    if (out !== 16'b0011010110000101) begin
          $display("Testcase 2 failed, got (out = %b) supposed (out = 0011010110000101)", out);
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