module half_adder(in0, in1, sum, carry_out);
	input in0, in1;  
	output sum, carry_out;  
	xor(sum, in0, in1);  
	and(carry_out, in0, in1);  
endmodule

  
module full_adder(in0, in1, carry_in, sum, carry_out);
	input in0, in1, carry_in;  
	output sum, carry_out;  
	wire hf_sum, hf_co1, hf_co2;  
	  
	// 1 full_adder = 2 half_adder  
	half_adder ha1(in0, in1, hf_sum, hf_co1);  
	half_adder ha2(hf_sum, carry_in, sum, hf_co2);  
	or(carry_out, hf_co1, hf_co2);  
endmodule  


module multiplier_W_tree_5_bit (in0, in1, multi_out);
    input [4:0] in0, in1;
    output [9:0] multi_out;

    wire x0y0, x0y1, x0y2, x0y3, x0y4;
    wire x1y0, x1y1, x1y2, x1y3, x1y4;
    wire x2y0, x2y1, x2y2, x2y3, x2y4;
    wire x3y0, x3y1, x3y2, x3y3, x3y4;
    wire x4y0, x4y1, x4y2, x4y3, x4y4;
    wire a,b,c,d,e,f,g,h,i,j,k,l;
    wire coutA, coutB, coutC, coutD, coutE, coutF, coutG, coutH, coutI, coutJ, coutK, coutL;

    and and_gate00 (x0y0, in0[0], in1[0]);
    and and_gate01 (x0y1, in0[0], in1[1]);
    and and_gate02 (x0y2, in0[0], in1[2]);
    and and_gate03 (x0y3, in0[0], in1[3]);
    and and_gate04 (x0y4, in0[0], in1[4]);

    and and_gate10 (x1y0, in0[1], in1[0]);
    and and_gate11 (x1y1, in0[1], in1[1]);
    and and_gate12 (x1y2, in0[1], in1[2]);
    and and_gate13 (x1y3, in0[1], in1[3]);
    and and_gate14 (x1y4, in0[1], in1[4]);

    and and_gate20 (x2y0, in0[2], in1[0]);
    and and_gate21 (x2y1, in0[2], in1[1]);
    and and_gate22 (x2y2, in0[2], in1[2]);
    and and_gate23 (x2y3, in0[2], in1[3]);
    and and_gate24 (x2y4, in0[2], in1[4]);

    and and_gate30 (x3y0, in0[3], in1[0]);
    and and_gate31 (x3y1, in0[3], in1[1]);
    and and_gate32 (x3y2, in0[3], in1[2]);
    and and_gate33 (x3y3, in0[3], in1[3]);
    and and_gate34 (x3y4, in0[3], in1[4]);

    and and_gate40 (x4y0, in0[4], in1[0]);
    and and_gate41 (x4y1, in0[4], in1[1]);
    and and_gate42 (x4y2, in0[4], in1[2]);
    and and_gate43 (x4y3, in0[4], in1[3]);
    and and_gate44 (x4y4, in0[4], in1[4]);

    full_adder fa1(.in0(x3y1), .in1(x4y0), .carry_in(1'b0), .sum(a), .carry_out(coutA));
    full_adder fa2(.in0(x3y2), .in1(x4y1), .carry_in(1'b0), .sum(b), .carry_out(coutB));
    full_adder fa3(.in0(x2y1), .in1(x3y0), .carry_in(1'b0), .sum(c), .carry_out(coutC));
    full_adder fa4(.in0(x1y3), .in1(x2y2), .carry_in(a), .sum(d), .carry_out(coutD));
    full_adder fa5(.in0(x2y3), .in1(b), .carry_in(coutA), .sum(e), .carry_out(coutE));
    full_adder fa6(.in0(x3y3), .in1(x4y2), .carry_in(coutB), .sum(f), .carry_out(coutF));
    full_adder fa7(.in0(x1y1), .in1(x2y0), .carry_in(1'b0), .sum(g), .carry_out(coutG));
    full_adder fa8(.in0(x0y3), .in1(x1y2), .carry_in(c), .sum(h), .carry_out(coutH));
    full_adder fa9(.in0(x0y4), .in1(d), .carry_in(coutC), .sum(i), .carry_out(coutI));
    full_adder fa10(.in0(x1y4), .in1(e), .carry_in(coutD), .sum(j), .carry_out(coutJ));
    full_adder fa11(.in0(x2y4), .in1(f), .carry_in(coutE), .sum(k), .carry_out(coutK));
    full_adder fa12(.in0(x3y4), .in1(x4y3), .carry_in(coutF), .sum(l), .carry_out(coutL));

    // ripple一下
    wire cout0, cout1, cout2, cout3, cout4, cout5, cout6, cout7, cout8, cout9;  
    full_adder fa13(.in0(x0y0), .in1(1'b0), .carry_in(1'b0), .sum(multi_out[0]), .carry_out(cout0));
    full_adder fa14(.in0(x0y1), .in1(x1y0), .carry_in(cout0), .sum(multi_out[1]), .carry_out(cout1));
    full_adder fa15(.in0(x0y2), .in1(g), .carry_in(cout1), .sum(multi_out[2]), .carry_out(cout2));
    full_adder fa16(.in0(h), .in1(coutG), .carry_in(cout2), .sum(multi_out[3]), .carry_out(cout3));
    full_adder fa17(.in0(i), .in1(coutH), .carry_in(cout3), .sum(multi_out[4]), .carry_out(cout4));
    full_adder fa18(.in0(j), .in1(coutI), .carry_in(cout4), .sum(multi_out[5]), .carry_out(cout5));
    full_adder fa19(.in0(k), .in1(coutJ), .carry_in(cout5), .sum(multi_out[6]), .carry_out(cout6));
    full_adder fa20(.in0(i), .in1(coutK), .carry_in(cout6), .sum(multi_out[7]), .carry_out(cout7));
    full_adder fa21(.in0(x4y4), .in1(coutI), .carry_in(cout7), .sum(multi_out[8]), .carry_out(multi_out[9]));

endmodule