// set the timescale
`timescale 1 ns / 100 ps

module alu_16_bit_tb;
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
    wire carry_out;

    // Instantiate the DUT
    alu_16_bit dut (
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
    operandA = 16'b0011100001110000;
    operandB = 16'b0001000001010001;
    Ainvert = 0;
    Binvert = 0;
    carry_in = 0;
    Operation = 2'b00;  // and

    @(negedge clock);
    if (out !== 16'b0001000001010000) begin
        $display("Testcase 1 failed, got out = %b, expected out = 0001000001010000", out);      num_errors = num_errors + 1;
        num_errors = num_errors + 1;
    end

    // Testcase 2
    @(negedge clock);
    operandA = 16'b0011100001110000;
    operandB = 16'b0001000100010001;
    Ainvert = 0;
    Binvert = 0;
    carry_in = 0;
    Operation = 2'b01;  // or

    @(negedge clock);
    if (out !== 16'b0011100101110001) begin
        $display("Testcase 2 failed, got out = %b, expected out = 0011100101110001", out);      num_errors = num_errors + 1;
        num_errors = num_errors + 1;
    end

    // Testcase 3: add + no carry_out
    @(negedge clock);
    operandA = 16'b0011100001110000;
    operandB = 16'b0001000100010001;
    Ainvert = 0;
    Binvert = 0;
    carry_in = 0;
    Operation = 2'b10;  // add

    @(negedge clock);
    if (out !== 16'b0100100110000001 || carry_out != 1'b0) begin
        $display("Testcase 3 failed, got (out = %b, carryout = %b), supposed (out = 0100100110000001, carryout = 0)", out, carry_out);
        num_errors = num_errors + 1;
    end

    // Testcase 4: add + carry_out
    @(negedge clock);
    operandA = 16'b1011100001110000;
    operandB = 16'b1001000100010001;
    Ainvert = 0;
    Binvert = 0;
    carry_in = 0;
    Operation = 2'b10;  // add

    @(negedge clock);
    if (out !== 16'b0100100110000001 || carry_out != 1'b1) begin
        $display("Testcase 4 failed, got (out = %b, carryout = %b), supposed (out = 0100100110000001, carryout = 0)", out, carry_out);
        num_errors = num_errors + 1;
    end

    // // Testcase 5: negative subtracts negative + no overflow(未完成)
    // @(negedge clock);
    // operandA = 16'b1011100001110000;
    // operandB = 16'b1001000100010001;
    // Ainvert = 0;
    // Binvert = 1;
    // carry_in = 1;
    // Operation = 2'b10;  // subtract

    // @(negedge clock);
    // if (out !== 16'b0100100110000001 || carry_out != 1'b1) begin
    //     // $display("Testcase 5 failed, got (out = %b, carryout = %b), supposed (out = 0100100110000001, carryout = 0)", out, carry_out);
    //     num_errors = num_errors + 1;
    // end


    
    if (num_errors == 0) begin
      $display("Simulation succeeded with no errors.");
    end else begin
      $display("Simulation failed with %d error(s).", num_errors);
    end

  end

  always
  #10 clock = ~clock; // toggle clock every 10 timescale units

endmodule