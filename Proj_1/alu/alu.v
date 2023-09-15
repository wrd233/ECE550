module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;

    // 接收返回值
    wire [31:0] andOut, orOut, addOut, subOut;
    wire andCarryOut, orCarryOut, addCarryOut, subCarryOut;
    wire andOverflow, orOverflow, addOverflow, subOverflow;

    // TODO:还没写完，还有两个
    alu_32_bit a32b_and(.operandA(data_operandA), .operandB(data_operandB), .Ainvert(1'b0), .Binvert(1'b0), .Operation(2'b00), .carry_in(1'b0), .carry_out(andCarryOut), .out(andOut), .overflow(andOverflow));
    alu_32_bit a32b_or(.operandA(data_operandA), .operandB(data_operandB), .Ainvert(1'b0), .Binvert(1'b0), .Operation(2'b01), .carry_in(1'b0), .carry_out(orCarryOut), .out(orOut), .overflow(orOverflow));
    alu_32_bit a32b_add(.operandA(data_operandA), .operandB(data_operandB), .Ainvert(1'b0), .Binvert(1'b0), .Operation(2'b10), .carry_in(1'b0), .carry_out(addCarryOut), .out(addOut), .overflow(addOverflow));
    alu_32_bit a32b_sub(.operandA(data_operandA), .operandB(data_operandB), .Ainvert(1'b0), .Binvert(1'b1), .Operation(2'b10), .carry_in(1'b1), .carry_out(subCarryOut), .out(subOut), .overflow(subOverflow));

    // TODO: mux进行选择
    mux32_8to1 mx1(.select(ctrl_ALUopcode), .in0(addOut), .in1(subOut), .in2(andOut), .in3(orOut), .in4(32'h00000000), .in5(32'h00000000), .in6(32'h00000000), .in7(32'h00000000), .out(data_result));
    mux_8 mx2(.select(ctrl_ALUopcode), .in0(addOverflow), .in1(subOverflow), .in2(andOverflow), .in3(orOverflow), .in4(1'b0), .in5(1'b0), .in6(1'b0), .in7(1'b0), .out(overflow));


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
