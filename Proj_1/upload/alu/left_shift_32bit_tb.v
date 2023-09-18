
// set the timescale
`timescale 1 ns / 100 ps

module left_shift_32bit_tb;
    // set up clock
    reg clock;

    // count errors
    integer num_errors;

    // Inputs
    reg [31:0] data_in;
    reg [4:0] ctrl_shiftamt;

    // Outputs
    wire [31:0] data_out;

    // Instantiate the DUT
    left_shift_32bit dut (
        .data_in(data_in),
        .ctrl_shiftamt(ctrl_shiftamt),
        .data_out(data_out)
    );
  
// begin simulation
  initial begin
    $display($time, " simulation start");

    clock = 1'b0;
    num_errors = 0; 

    // Testcase 1
    @(negedge clock);
    data_in = 32'b00000000000000000000000000000001;
    ctrl_shiftamt = 5'b00001;

    @(negedge clock);
    if (data_out !== 32'b00000000000000000000000000000010) begin
      $display("Testcase failed. Expected data_out = 32'b00000000000000000000000000000010, Got data_out = %b", data_out);
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