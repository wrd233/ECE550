module nand_gate(in1, in2, out);
  input in1, in2;
  output out;
  nand my_nand(out, in1, in2);
endmodule

module nand_adder(in0, in1, carry_in, sum, carry_out);
	input in0, in1, carry_in;  
	output sum, carry_out;  
    wire Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9;
    nand_gate ng1(in0,in1,Out1);
    nand_gate ng2(in1,Out1,Out2);
    nand_gate ng3(in0,Out1,Out3);
    nand_gate ng4(Out2,Out3,Out4);
    nand_gate ng5(carry_in,Out4,Out5);
    nand_gate ng6(Out5,Out4,Out6);
    nand_gate ng7(Out5,carry_in,Out7);
    nand_gate ng8(Out1,Out5,Out8);
    nand_gate ng9(Out7,Out6,Out9);

    assign sum = Out9;
    assign carry_out = Out8;

endmodule
	