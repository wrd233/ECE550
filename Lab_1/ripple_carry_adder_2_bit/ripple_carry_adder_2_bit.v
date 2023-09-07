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


module ripple_carry_adder_2_bit(in0, in1, sum, carry_out);
	input [1:0] in0, in1;  
	output [1:0] sum;  
	output carry_out;  
	wire carry_out_1;  
	  
	full_adder fa1(in0[0], in1[0], 1'b0, sum[0], carry_out_1);  
	full_adder fa2(in0[1], in1[1], carry_out_1, sum[1], carry_out);  
  
endmodule