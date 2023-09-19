module mux_8(select, in0, in1, in2, in3, in4, in5, in6, in7, out);
	input [2:0] select;
	input in0, in1, in2, in3, in4, in5, in6, in7;
	output out;
	wire  w1, w2;
	mux_4 first_top(select[1:0], in0, in1, in2, in3, w1);
	mux_4 first_bottom(select[1:0], in4, in5, in6, in7, w2);
	mux_2 third(select[2], w1, w2, out);
endmodule