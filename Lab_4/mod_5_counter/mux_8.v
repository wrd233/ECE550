module mux_2(select, in0, in1, out);
    input select;
    input [6:0]in0, in1;
    output [6:0]out;
    assign out = select ? in1 : in0;
endmodule

module mux_4(select, in0, in1, in2, in3, out);
	 input [1:0] select;
	 input [6:0]in0, in1, in2, in3;
	 output [6:0]out;
	 wire [6:0]w1, w2;
	 mux_2 first_top(.select(select[0]), .in0(in0), .in1(in1), .out(w1));
	 mux_2 first_bottom(.select(select[0]), .in0(in2), .in1(in3), .out(w2));
	 mux_2 second(.select(select[1]), .in0(w1), .in1(w2), .out(out));
endmodule

module mux_8(select, in0, in1, in2, in3, in4, in5, in6, in7, out);
	input [2:0] select;
	input [6:0]in0, in1, in2, in3, in4, in5, in6, in7;
	output [6:0]out;
	wire  [6:0]w1, w2;
	mux_4 first_top(select[1:0], in0, in1, in2, in3, w1);
	mux_4 first_bottom(select[1:0], in4, in5, in6, in7, w2);
	mux_2 third(select[2], w1, w2, out);
endmodule