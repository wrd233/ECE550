module alu_16_bit(operandA, operandB, Ainvert, Binvert, Operation, carry_in, carry_out, out);
    input [15:0] operandA, operandB;
    input Ainvert, Binvert, carry_in;
    input [1:0]Operation;
    output [15:0] out;
    output carry_out;

    wire [15:0]carry;

    alu_1_bit fa0(operandA[0], operandB[0], Ainvert, Binvert, Operation, carry_in, carry[0], out[0]);
    alu_1_bit fa1(operandA[1], operandB[1], Ainvert, Binvert, Operation, carry[0], carry[1], out[1]);
    alu_1_bit fa2(operandA[2], operandB[2], Ainvert, Binvert, Operation, carry[1], carry[2], out[2]);
    alu_1_bit fa3(operandA[3], operandB[3], Ainvert, Binvert, Operation, carry[2], carry[3], out[3]);
    alu_1_bit fa4(operandA[4], operandB[4], Ainvert, Binvert, Operation, carry[3], carry[4], out[4]);
    alu_1_bit fa5(operandA[5], operandB[5], Ainvert, Binvert, Operation, carry[4], carry[5], out[5]);
    alu_1_bit fa6(operandA[6], operandB[6], Ainvert, Binvert, Operation, carry[5], carry[6], out[6]);
    alu_1_bit fa7(operandA[7], operandB[7], Ainvert, Binvert, Operation, carry[6], carry[7], out[7]);
    alu_1_bit fa8(operandA[8], operandB[8], Ainvert, Binvert, Operation, carry[7], carry[8], out[8]);
    alu_1_bit fa9(operandA[9], operandB[9], Ainvert, Binvert, Operation, carry[8], carry[9], out[9]);
    alu_1_bit fa10(operandA[10], operandB[10], Ainvert, Binvert, Operation, carry[9], carry[10], out[10]);
    alu_1_bit fa11(operandA[11], operandB[11], Ainvert, Binvert, Operation, carry[10], carry[11], out[11]);
    alu_1_bit fa12(operandA[12], operandB[12], Ainvert, Binvert, Operation, carry[11], carry[12], out[12]);
    alu_1_bit fa13(operandA[13], operandB[13], Ainvert, Binvert, Operation, carry[12], carry[13], out[13]);
    alu_1_bit fa14(operandA[14], operandB[14], Ainvert, Binvert, Operation, carry[13], carry[14], out[14]);
    alu_1_bit fa15(operandA[15], operandB[15], Ainvert, Binvert, Operation, carry[14], carry_out, out[15]);

endmodule
