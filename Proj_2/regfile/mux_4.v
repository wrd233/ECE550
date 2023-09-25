module mux_2(select, in0, in1, out);
    input select;
    input in0, in1;
    output out;
    assign out = select ? in1 : in0;
endmodule

module mux_4(select, in0, in1, in2, in3, out);
	 input [1:0] select;
	 input in0, in1, in2, in3;
	 output out;
	 wire w1, w2;
	 mux_2 first_top(.select(select[0]), .in0(in0), .in1(in1), .out(w1));
	 mux_2 first_bottom(.select(select[0]), .in0(in2), .in1(in3), .out(w2));
	 mux_2 second(.select(select[1]), .in0(w1), .in1(w2), .out(out));
endmodule