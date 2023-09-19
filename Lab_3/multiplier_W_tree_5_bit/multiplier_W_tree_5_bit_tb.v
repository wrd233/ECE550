// set the timescale
`timescale 1 ns / 100 ps

module multiplier_W_tree_5_bit_tb;
    // set up clock
    reg clock;

    // count errors
    integer num_errors;

    // Inputs
    reg [4:0] in0;
    reg [4:0] in1;
    // Outputs
    wire [9:0] multi_out;

    // Instantiate the multiplier_W_tree_5_bit module
    multiplier_W_tree_5_bit dut (
        .in0(in0),
        .in1(in1),
        .multi_out(multi_out)
    );
  
// begin simulation
  initial begin
    $display($time, " simulation start");

    clock = 1'b0;
    num_errors = 0; 

    // Testcase 1
    @(negedge clock);
    in0 = 5'b00000;
    in1 = 5'b00000;

    @(negedge clock);
    if (multi_out !== 10'b0000000000) begin
        $display("Testcase 1 failed, got multi_out = %b, expected multi_out = 10'b0000000000", multi_out);
        num_errors = num_errors + 1;
    end

    // Testcase 2
    @(negedge clock);
    in0 = 5'b00001;
    in1 = 5'b00110;

    @(negedge clock);
    if (multi_out !== 10'b0000000110) begin
        $display("Testcase 2 failed, got multi_out = %b, expected multi_out = 10'b0000000110", multi_out);
        num_errors = num_errors + 1;
    end

    // Testcase 3
    @(negedge clock);
    in0 = 5'b00101;
    in1 = 5'b01010;

    @(negedge clock);
    if (multi_out !== 10'b0000110010) begin
        $display("Testcase 3 failed, got multi_out = %b, expected multi_out = 10'b0000110010", multi_out);
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