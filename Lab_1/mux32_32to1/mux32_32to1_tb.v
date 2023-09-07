// set the timescale
`timescale 1 ns / 100 ps

module mux32_32to1_tb;
    // set up inputs
    reg [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
    reg [4:0]select;

    // set up outputs
    wire out;

    // set up clock
    reg clock;

    // count errors
    integer num_errors;

    // Instantiate the mux32_32to1 module
    mux32_32to1 test(.in0(in0), .in1(in1), .sum(sum), .carry_out(carry_out));

    // begin simulation
    initial begin
        $display($time, " simulation start");

        clock = 1'b0;
        num_errors = 0; 
        in0 = 6'b00000;
        in1 = 6'b00001;
        in2 = 6'b00010;
        in3 = 6'b00011;
        in4 = 6'b00100;
        in5 = 6'b00101;
        in6 = 6'b00110;
        in7 = 6'b00111;
        in8 = 6'b01000;
        in9 = 6'b01001;
        in10 = 6'b01010;
        in11 = 6'b01011;
        in12 = 6'b01100;
        in13 = 6'b01101;
        in14 = 6'b01110;
        in15 = 6'b01111;
        in16 = 6'b10000;
        in17 = 6'b10001;
        in18 = 6'b10010;
        in19 = 6'b10011;
        in20 = 6'b10100;
        in21 = 6'b10101;
        in22 = 6'b10110;
        in23 = 6'b10111;
        in24 = 6'b11000;
        in25 = 6'b11001;
        in26 = 6'b11010;
        in27 = 6'b11011;
        in28 = 6'b11100;
        in29 = 6'b11101;
        in30 = 6'b11110;
        in31 = 6'b11111;

        // Testcase 1
        @(negedge clock);
        select = 4'b0000;

        @(negedge clock);
        if (out != 6'b000000) begin
        $display("Error: Test case 1 failed. Expected 0, got %b", out);
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