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