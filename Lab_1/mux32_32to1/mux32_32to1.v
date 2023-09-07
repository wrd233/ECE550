module mux_2(select, in0, in1, out);
 input select;
 input [31:0] in0, in1;
 output [31:0] out;
 assign out = select ? in1 : in0;
endmodule

module mux_4(select, in0, in1, in2, in3, out);
 input [1:0] select;
 input [31:0] in0, in1, in2, in3;
 output [31:0] out;
 wire [31:0] w1, w2;
 mux_2 first_top(.select(select[0]), .in0(in0), .in1(in1), .out(w1));
 mux_2 first_bottom(.select(select[0]), .in0(in2), .in1(in3), .out(w2));
 mux_2 second(.select(select[1]), .in0(w1), .in1(w2), .out(out));
endmodule

module mux_8(select, in0, in1, in2, in3, in4, in5, in6, in7, out);
	input [2:0] select;
	input [31:0] in0, in1, in2, in3, in4, in5, in6, in7;
	output [31:0] out;
	wire [31:0] w1, w2;
	mux_4 first_top(select[1:0], in0, in1, in2, in3, w1);
	mux_4 first_bottom(select[1:0], in4, in5, in6, in7, w2);
	mux_2 third(select[2], w1, w2, out);
endmodule

//
//module mux32_32to1(select, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, out);
//	input [3:0] select;
//	input [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15;
//	output [31:0] out;
//	wire [31:0] w1, w2;
//	mux_8 first_top(select[2:0], in0, in1, in2, in3, in4, in5, in6, in7, w1);
//	mux_8 first_bottom(select[2:0], in8, in9, in10, in11, in12, in13, in14, in15, w2);
//	mux_2 forth(select[3], w1, w2, out);
//endmodule
//
//
module mux32_32to1(select, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, 
									in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31, out);
	input [4:0] select;
	input [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
	output [31:0] out;
	wire [31:0] w1, w2, w3, w4;
	mux_8 first1(select[2:0], in0, in1, in2, in3, in4, in5, in6, in7, w1);
	mux_8 first2(select[2:0], in8, in9, in10, in11, in12, in13, in14, in15, w2);
	mux_8 first3(select[2:0], in16, in17, in18, in19, in20, in21, in22, in23, w3);
	mux_8 first4(select[2:0], in24, in25, in26, in27, in28, in29, in30, in31, w4);
	
	mux_4 forth(select[4:3], w1, w2, w3, w4, out);
endmodule
