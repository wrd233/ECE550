// set the timescale
`timescale 1 ns / 100 ps

module d_latch_tb;
    // set up clock
    reg clock;

    // count errors
    integer num_errors;

    // Inputs
    reg data, enable, reset;


    // Outputs
    wire Q, Qbar;

    // Instantiate the DUT
    d_latch dut (
        .data(data),
        .enable(enable),
        .clock(clock),
        .reset(reset),
        .Q(Q),
        .Qbar(Qbar)
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
    @(negedge clock);
    reset = 1'b0;
    $display("The output of reset is %b", Q);


    // Testcase 1
    $display("input:1");
    data = 1'b1;
    @(negedge clock);
    @(negedge clock);
    $display("The output is %b", Q);

    // Testcase 2
    $display("input:0");
    data = 1'b0;
    @(negedge clock);
    @(negedge clock);
    $display("The output is %b", Q);

    // Testcase 3
    $display("input:1");
    data = 1'b1;
    @(negedge clock);
    @(negedge clock);
    $display("The output is %b", Q);
    
    
    if (num_errors == 0) begin
      $display("Simulation succeeded with no errors.");
    end else begin
      $display("Simulation failed with %d error(s).", num_errors);
    end

  end

  always
  #10 clock = ~clock; // toggle clock every 10 timescale units

endmodule