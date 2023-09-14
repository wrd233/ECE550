// set the timescale
`timescale 1 ns / 100 ps

module nand_adder_tb;
  // set up clock
  reg clock;

  // count errors
  integer num_errors;

  // Inputs
  reg in0;
  reg in1;
  reg carry_in;

  // Outputs
  wire sum;
  wire carry_out;

  // Instantiate the DUT
  nand_adder dut (
    .in0(in0),
    .in1(in1),
    .carry_in(carry_in),
    .sum(sum),
    .carry_out(carry_out)
  );
  
// begin simulation
  initial begin
    $display($time, " simulation start");

    clock = 1'b0;
    num_errors = 0; 

    // Testcase 1
    @(negedge clock);
    in0 = 0;
    in1 = 0;
    carry_in = 0;

    @(negedge clock);
    if (sum !== 1'b0 || carry_out !== 1'b0) begin
      $display("Testcase 1 failed,got (%b, %b)", sum, carry_out);
      num_errors = num_errors + 1;
    end

    // Testcase 2
    @(negedge clock);
    in0 = 0;
    in1 = 0;
    carry_in = 1;

    @(negedge clock);
    if (sum !== 1'b1 || carry_out !== 1'b0) begin
      $display("Testcase 2 failed,got (%b, %b)", sum, carry_out);
      num_errors = num_errors + 1;
    end

    // Testcase 3
    @(negedge clock);
    in0 = 0;
    in1 = 1;
    carry_in = 0;

    @(negedge clock);
    if (sum !== 1'b1 || carry_out !== 1'b0) begin
      $display("Testcase 3 failed,got (%b, %b)", sum, carry_out);
      num_errors = num_errors + 1;
    end

    // Testcase 4
    @(negedge clock);
    in0 = 0;
    in1 = 1;
    carry_in = 1;

    @(negedge clock);
    if (sum !== 1'b0 || carry_out !== 1'b1) begin
      $display("Testcase 4 failed,got (%b, %b)", sum, carry_out);
      num_errors = num_errors + 1;
    end

    // Testcase 5
    @(negedge clock);
    in0 = 1;
    in1 = 0;
    carry_in = 0;

    @(negedge clock);
    if (sum !== 1'b1 || carry_out !== 1'b0) begin
      $display("Testcase 5 failed,got (%b, %b)", sum, carry_out);
      num_errors = num_errors + 1;
    end

    // Testcase 6
    @(negedge clock);
    in0 = 1;
    in1 = 0;
    carry_in = 1;

    @(negedge clock);
    if (sum !== 1'b0 || carry_out !== 1'b1) begin
      $display("Testcase 6 failed,got (%b, %b)", sum, carry_out);
      num_errors = num_errors + 1;
    end

    // Testcase 7
    @(negedge clock);
    in0 = 1;
    in1 = 1;
    carry_in = 0;

    @(negedge clock);
    if (sum !== 1'b0 || carry_out !== 1'b1) begin
      $display("Testcase 7 failed,got (%b, %b)", sum, carry_out);
      num_errors = num_errors + 1;
    end

    // Testcase 8
    @(negedge clock);
    in0 = 1;
    in1 = 1;
    carry_in = 1;

    @(negedge clock);
    if (sum !== 1'b1 || carry_out !== 1'b1) begin
      $display("Testcase 8 failed,got (%b, %b)", sum, carry_out);
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