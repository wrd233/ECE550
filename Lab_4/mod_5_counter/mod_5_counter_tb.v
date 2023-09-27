// set the timescale
`timescale 1 ns / 100 ps

module mod_5_counter_tb;
    // set up clock
    reg clock;

    // count errors
    integer num_errors;
    integer index; 

    // Inputs
    reg reset;

    // Outputs
    wire [6:0]out;
    wire reach4;

    // Instantiate the DUT
    mod_5_counter dut (
        .clock(clock),
        .out(out),
		  .reset(reset),
      .reach4(reach4)
    );
  
// begin simulation
  initial begin
    $display($time, " simulation start");

    clock = 1'b0;
	  reset = 1'b1;
    num_errors = 0; 
    @(negedge clock);
	  reset = 1'b0;
    // Testcase 1
    for(index = 1; index <= 100; index = index + 1) begin        
        @(negedge clock);
          $display("%b",out);
         if (reach4 == 1'b1) begin
             $display("reach 4");
         end
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