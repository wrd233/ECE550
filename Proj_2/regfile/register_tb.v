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
    // TODO: 这里为啥不能是reg？
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

    // Testcase 1
    reset = 1'b1;
    @(negedge clock);
    @(negedge clock);

    reset = 1'b0;
    $display("The output is %h", out);
    
    
    if (num_errors == 0) begin
      $display("Simulation succeeded with no errors.");
    end else begin
      $display("Simulation failed with %d error(s).", num_errors);
    end

  end

  always
  #10 clock = ~clock; // toggle clock every 10 timescale units

endmodule