// set the timescale
`timescale 1 ns / 100 ps

module register_tb;
    // set up clock
    reg clock;

    // count errors
    integer num_errors;

    // Inputs
    reg [31:0]in;
    reg enable, reset;


    // Outputs
    wire [31:0]out;

    // Instantiate the DUT
    register dut (
      .in(in),
      .enable(enable),
      .clock(clock),
      .out(out),
      .reset(reset)      
    );
  
// begin simulation
  initial begin
    $display($time, " simulation start");

    clock = 1'b0;
    num_errors = 0; 
    enable = 1'b1;

    // Testcase 1
    $display("reset");
    reset = 1'b1;
    @(negedge clock);
    reset = 1'b0;
    $display("The output of reset is %b", out);


    // Testcase 1
    $display("The input is: 00000000000000000000000000000011");
    in = 32'b00000000000000000000000000000011;
    @(negedge clock);
    $display("The output is %b", out);

    // Testcase 2
    $display("The input is: 10001100000100100110000000000011");
    in = 32'b10001100000100100110000000000011;
    @(negedge clock);
    $display("The output is %b", out);

    // Testcase 1
    $display("reset");
    reset = 1'b1;
    @(negedge clock);
    reset = 1'b0;
    $display("The output of reset is %b", out);


    // Testcase 1
    $display("The input is: 00000000000000000000000000000011");
    in = 32'b00000000000000000000000000000011;
    @(negedge clock);
    $display("The output is %b", out);

    // Testcase 2
    $display("The input is: 10001100000100100110000000000011");
    in = 32'b10001100000100100110000000000011;
    @(negedge clock);
    $display("The output is %b", out);
    
    
    if (num_errors == 0) begin
      $display("Simulation succeeded with no errors.");
    end else begin
      $display("Simulation failed with %d error(s).", num_errors);
    end

  end

  always
  #10 clock = ~clock; // toggle clock every 10 timescale units

endmodule