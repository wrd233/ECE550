module alu_32_bit(operandA, operandB, Ainvert, Binvert, Operation, carry_in, carry_out, out, overflow);
    input [31:0] operandA, operandB;
    input Ainvert, Binvert, carry_in;
    input [1:0]Operation;
    output carry_out, overflow;
    output [31:0]out;


    wire carry_out_low;                 // 存储的是低16位的carry_out
    wire [31:0] out1, out0;             // 存储的是高16位的输出
    wire carry_out1, carry_out0;    
    wire overflow1, overflow0;

    // 独立计算低16位的
    alu_16_bit a16b(operandA[15:0], operandB[15:0], Ainvert, Binvert, Operation, carry_in, carry_out_low, out[15:0]);

    // 并行计算高16位的
    alu_16_bit_f a16bf1(operandA[31:16], operandB[31:16], Ainvert, Binvert, Operation, 1'b0, carry_out0, out0[31:16], overflow0);
    alu_16_bit_f a16bf2(operandA[31:16], operandB[31:16], Ainvert, Binvert, Operation, 1'b1, carry_out1, out1[31:16], overflow1);

    // 枚举一波
    mux_2 mx1(carry_out_low, carry_out0, carry_out1, carry_out);
    mux_2 mx2(carry_out_low, overflow0, overflow1, overflow);
    mux_2 mx3(carry_out_low, out0[31], out1[31], out[31]);
    mux_2 mx4(carry_out_low, out0[30], out1[30], out[30]);
    mux_2 mx5(carry_out_low, out0[29], out1[29], out[29]);
    mux_2 mx6(carry_out_low, out0[28], out1[28], out[28]);
    mux_2 mx7(carry_out_low, out0[27], out1[27], out[27]);
    mux_2 mx8(carry_out_low, out0[26], out1[26], out[26]);
    mux_2 mx9(carry_out_low, out0[25], out1[25], out[25]);
    mux_2 mx10(carry_out_low, out0[24], out1[24], out[24]);
    mux_2 mx11(carry_out_low, out0[23], out1[23], out[23]);
    mux_2 mx12(carry_out_low, out0[22], out1[22], out[22]);
    mux_2 mx13(carry_out_low, out0[21], out1[21], out[21]);
    mux_2 mx14(carry_out_low, out0[20], out1[20], out[20]);
    mux_2 mx15(carry_out_low, out0[19], out1[19], out[19]);
    mux_2 mx16(carry_out_low, out0[18], out1[18], out[18]);
    mux_2 mx17(carry_out_low, out0[17], out1[17], out[17]);
    mux_2 mx18(carry_out_low, out0[16], out1[16], out[16]);


endmodule