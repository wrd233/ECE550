module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;

    // 接收返回值
    wire [31:0] andOut, orOut, addOut, subOut, sllOut;
    wire andCarryOut, orCarryOut, addCarryOut, subCarryOut;
    wire andOverflow, orOverflow, addOverflow, subOverflow;

    // TODO:还有个右移
    alu_32_bit a32b_and(.operandA(data_operandA), .operandB(data_operandB), .Ainvert(1'b0), .Binvert(1'b0), .Operation(2'b00), .carry_in(1'b0), .carry_out(andCarryOut), .out(andOut), .overflow(andOverflow));
    alu_32_bit a32b_or(.operandA(data_operandA), .operandB(data_operandB), .Ainvert(1'b0), .Binvert(1'b0), .Operation(2'b01), .carry_in(1'b0), .carry_out(orCarryOut), .out(orOut), .overflow(orOverflow));
    alu_32_bit a32b_add(.operandA(data_operandA), .operandB(data_operandB), .Ainvert(1'b0), .Binvert(1'b0), .Operation(2'b10), .carry_in(1'b0), .carry_out(addCarryOut), .out(addOut), .overflow(addOverflow));
    alu_32_bit a32b_sub(.operandA(data_operandA), .operandB(data_operandB), .Ainvert(1'b0), .Binvert(1'b1), .Operation(2'b10), .carry_in(1'b1), .carry_out(subCarryOut), .out(subOut), .overflow(subOverflow));
    left_shift_32bit ls(.ctrl_shiftamt(ctrl_shiftamt), .data_in(data_operandA), .data_out(sllOut));


    // mux进行选择
    mux32_8to1 mx1(.select(ctrl_ALUopcode), .in0(addOut), .in1(subOut), .in2(andOut), .in3(orOut), .in4(sllOut), .in5(32'h00000000), .in6(32'h00000000), .in7(32'h00000000), .out(data_result));
    mux_8 mx2(.select(ctrl_ALUopcode), .in0(addOverflow), .in1(subOverflow), .in2(andOverflow), .in3(orOverflow), .in4(1'b0), .in5(1'b0), .in6(1'b0), .in7(1'b0), .out(overflow));

    // 判断结果是否全0
    or o(isNotEqual, subOut[0], subOut[1], subOut[2], subOut[3], subOut[4], subOut[5], subOut[6], subOut[7], subOut[8], subOut[9], subOut[10], subOut[11], subOut[12], subOut[13], subOut[14], subOut[15], subOut[16], subOut[17], subOut[18], subOut[19], subOut[20], subOut[21], subOut[22], subOut[23], subOut[24], subOut[25], subOut[26], subOut[27], subOut[28], subOut[29], subOut[30], subOut[31]);

    // 判断是否小于，如果溢出了，那么需要反转
    wire sign_negative; //存储符号位的反转
    not_gate ng(subOut[31],sign_negative);
    mux_2 mx3(overflow, subOut[31], sign_negative, isLessThan);
    // not_gate ng2(subOut[31],isLessThan);

//    // YOUR CODE HERE //
//    always @(ctrl_ALUopcode, data_operandA, data_operandB) begin
//        case(ctrl_ALUopcode)
//            // TODO: 根据情况调用函数
//            0:  // ADD
//            1:  // SUBTRACT
//            2:  // AND
//            3:  // OR
//            4:  // SLL
//            5:  // SRA
//        endcase
//    end
endmodule
