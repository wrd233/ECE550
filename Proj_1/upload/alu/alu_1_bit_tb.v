// set the timescale
`timescale 1 ns / 100 ps

module alu_1_bit_tb;
    // set up clock
    reg clock;

    // count errors
    integer num_errors;

    // Inputs
    reg operandA, operandB, Ainvert, Binvert, carry_in;
    reg [1:0]Operation;

    // Outputs
    wire carry_out, out;

    // Instantiate the DUT
    alu_1_bit dut (
        .operandA(operandA),
        .operandB(operandB),
        .Ainvert(Ainvert),
        .Binvert(Binvert),
        .Operation(Operation),
        .carry_in(carry_in),
        .carry_out(carry_out),
        .out(out)
    );
  
// begin simulation
  initial begin
    $display($time, " simulation start");

    clock = 1'b0;
    num_errors = 0; 

    // Testcase 1
    @(negedge clock);
    operandA = 1;
    operandB = 1;
    Ainvert = 0;
    Binvert = 0;
    Operation = 2'b00; // A and B operation
    carry_in = 0;

    @(negedge clock);
    if (carry_out !== 1'b1 || out !== 1'b1) begin
      $display("Testcase 1 failed,got (carry_out = %b, out = %b)", carry_out, out);
      num_errors = num_errors + 1;
    end

    // Testcase 2
    @(negedge clock);
    operandA = 1;
    operandB = 0;
    Ainvert = 0;
    Binvert = 0;
    Operation = 2'b01; // A or B operation
    carry_in = 0;

    @(negedge clock);
    if (carry_out !== 1'b0 || out !== 1'b1) begin
      $display("Testcase 2 failed,got (carry_out = %b, out = %b)", carry_out, out);
      num_errors = num_errors + 1;
    end

    // Testcase 3
    @(negedge clock);
    operandA = 1;
    operandB = 1;
    Ainvert = 0;
    Binvert = 0;
    Operation = 2'b10; // A add B operation
    carry_in = 1;

    @(negedge clock);
    if (carry_out !== 1'b1 || out !== 1'b1) begin
      $display("Testcase 3 failed,got (carry_out = %b, out = %b)", carry_out, out);
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