module alu_1_bit_f(operandA, operandB, Ainvert, Binvert, Operation, carry_in, carry_out, out, overflow);
    input operandA, operandB, Ainvert, Binvert, carry_in;
    input [1:0]Operation;
    output carry_out, out, overflow;
    
    wire AV_negative, BV_negative;    // A和B反转的全部可能性
    wire AV, BV;    // A和B的尝试反转结果
    wire AandB, AorB;
    wire addOut;    // 加法器的结果(sum)
    
    // 尝试反转A和B
    not_gate ng1(operandA, AV_negative);
    mux_2 mx1(Ainvert, operandA, AV_negative, AV);    // 0:不翻转

    not_gate ng2(operandB, BV_negative);
    mux_2 mx2(Binvert, operandB, BV_negative, BV);    // 0:不翻转

    // 计算AandB
    and_gate ad(AV, BV, AandB);

    // 计算AorB
    or_gate og(AV, BV, AorB);

    // 计算A+B
    full_adder fa(AV, BV, carry_in, addOut, carry_out);

    // 通过Operation选择结果
    mux_4 mx3(Operation, AandB, AorB, addOut, 1'b0, out);

    // 计算overflow
    overflow_check oc(AV, BV, addOut, overflow);


endmodule
