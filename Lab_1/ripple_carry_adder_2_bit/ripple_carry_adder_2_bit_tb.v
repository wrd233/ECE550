// set the timescale
`timescale 1 ns / 100 ps

module ripple_carry_adder_2_bit_tb;
  //  set up inputs
  reg [1:0] in0;
  reg [1:0] in1;

  // set up outputs
  wire [1:0] sum;
  wire carry_out;

  // set up clock
  reg clock;

  // count errors
  integer num_errors;

  // Instantiate the ripple_carry_adder_2_bit module
  ripple_carry_adder_2_bit test(.in0(in0), .in1(in1), .sum(sum), .carry_out(carry_out));

// begin simulation
  initial begin
    $display($time, " simulation start");

    clock = 1'b0;
    num_errors = 0; 

    // Testcase 1
    @(negedge clock);
    in0 = 2'b00;
    in1 = 2'b00;

    @(negedge clock);
    if (sum != 2'b00 || carry_out != 1'b00) begin
      $display("Error: Test case 1 failed. Expected (0, 0), got (%b, %b)", sum, carry_out);
      num_errors = num_errors + 1;
    end

    // Testcase 2
    @(negedge clock);
    in0 = 2'b01;
    in1 = 2'b10;

    @(negedge clock);
    if (sum != 2'b11 || carry_out != 1'b00) begin
      $display("Error: Test case 2 failed. Expected (1, 0), got (%b, %b)", sum, carry_out);
      num_errors = num_errors + 1;
    end

    // Testcase 3
    @(negedge clock);
    in0 = 2'b11;
    in1 = 2'b01;

    @(negedge clock);
    if (sum != 2'b00 || carry_out != 1'b01) begin
      $display("Error: Test case 3 failed. Expected (0, 1), got (%b, %b)", sum, carry_out);
      num_errors = num_errors + 1;
    end

    // Testcase 4
    @(negedge clock);
    in0 = 2'b10;
    in1 = 2'b11;

    @(negedge clock);
    if (sum != 2'b01 || carry_out != 1'b01) begin
      $display("Error: Test case 4 failed. Expected (1, 1), got (%b, %b)", sum, carry_out);
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