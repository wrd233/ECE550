// set the timescale
`timescale 1 ns / 100 ps

module dec5to32_tb;
    // set up clock
    reg clock;

    // count errors
    integer num_errors;

    // Inputs
    reg[4:0] in;


    // Outputs
    wire[31:0] out;

    // Instantiate the DUT
    dec5to32 dut (
        .in(in),
        .out(out)
    );
  
// begin simulation
  initial begin
    $display($time, " simulation start");

    clock = 1'b0;
    num_errors = 0; 

    // Testcase 1
    @(negedge clock);
    in = 5'b00010;
    $display("%b",out);
    @(negedge clock);
    if (out !== 32'b00000000000000000000000000000100) begin
      $display("Testcase 1 failed,got (%b)", out);
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