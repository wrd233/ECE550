module rs1(select, data_in, data_out, sign);
    input select, sign;
    input [31:0] data_in;
    output [31:0] data_out;
    // 首先移位前几个特殊的
    mux_2 mx0(select, data_in[31], sign, data_out[31]);
    genvar i;
    generate
        for (i = 31; i > 0; i = i - 1) begin:loop1
            mux_2 mx(select, data_in[i-1], data_in[i], data_out[i-1]);
        end
    endgenerate
endmodule

module rs2(select, data_in, data_out);
    input select;
    input [31:0] data_in;
    output [31:0] data_out;
    // 首先移位前几个特殊的
    mux_2 mx0(select, data_in[30], 1'b0, data_out[30]);
    mux_2 mx1(select, data_in[31], 1'b0, data_out[31]);
    genvar i;
    generate
        for (i = 30; i > 1; i = i - 1) begin:loop2
            mux_2 mx(select, data_in[i-2], data_in[i], data_out[i-2]);
        end
    endgenerate
endmodule

module rs4(select, data_in, data_out);
    input select;
    input [31:0] data_in;
    output [31:0] data_out;
    // 首先移位前几个特殊的
    mux_2 mx0(select, data_in[28], 1'b0, data_out[28]);
    mux_2 mx1(select, data_in[29], 1'b0, data_out[29]);
    mux_2 mx2(select, data_in[30], 1'b0, data_out[30]);
    mux_2 mx3(select, data_in[31], 1'b0, data_out[31]);
    genvar i;
    generate
        for (i = 28; i > 3; i = i - 1) begin:loop3
            mux_2 mx(select, data_in[i-4], data_in[i], data_out[i-4]);
        end
    endgenerate
endmodule

module rs8(select, data_in, data_out);
    input select;
    input [31:0] data_in;
    output [31:0] data_out;
    // 首先移位前几个特殊的
    mux_2 mx0(select, data_in[24], 1'b0, data_out[24]);
    mux_2 mx1(select, data_in[25], 1'b0, data_out[25]);
    mux_2 mx2(select, data_in[26], 1'b0, data_out[26]);
    mux_2 mx3(select, data_in[27], 1'b0, data_out[27]);
    mux_2 mx4(select, data_in[28], 1'b0, data_out[28]);
    mux_2 mx5(select, data_in[29], 1'b0, data_out[29]);
    mux_2 mx6(select, data_in[30], 1'b0, data_out[30]);
    mux_2 mx7(select, data_in[31], 1'b0, data_out[31]);
    genvar i;
    generate
        for (i = 24; i > 7; i = i - 1) begin:loop4
        mux_2 mx(select, data_in[i-8], data_in[i], data_out[i-8]);
        end
    endgenerate
endmodule

module rs16(select, data_in, data_out);
    input select;
    input [31:0] data_in;
    output [31:0] data_out;
    // 首先移位前几个特殊的
    genvar i;
    generate
    for (i = 0; i < 16; i = i + 1) begin : loop5
    mux_2 mx(select, data_in[i+16], 1'b0, data_out[i+16]);
    end
    endgenerate
    genvar j;
    generate
        for (j = 16; j < 16; j = j + 1) begin:loop6
            mux_2 mx(select, data_in[j-16], data_in[j], data_out[j-16]);
        end
    endgenerate
endmodule

module signed_right_shift_32(ctrl_shiftamt, data_in, data_out);
    input [31:0] data_in;
    input [4:0] ctrl_shiftamt;
    output [31:0] data_out;

    wire [31:0] out_1, out_2, out_3, out_4;
    wire sign;

    assign sign = data_in[31];
    wire ctrl0,ctrl1,ctrl2,ctrl3,ctrl4;
    // not_gate ng1(ctrl_shiftamt[0], ctrl0);
    // not_gate ng2(ctrl_shiftamt[1], ctrl1);
    // not_gate ng3(ctrl_shiftamt[2], ctrl2);
    // not_gate ng4(ctrl_shiftamt[3], ctrl3);
    // not_gate ng5(ctrl_shiftamt[4], ctrl4);


    // rs1 rs1(ctrl_shiftamt[0], data_in, out_1);
    // rs2 rs2(ctrl_shiftamt[1], out_1, out_2);
    // rs4 rs3(ctrl_shiftamt[2], out_2, out_3);
    // rs8 rs4(ctrl_shiftamt[3], out_3, out_4);
    // rs16 rs5(ctrl_shiftamt[4], out_4, data_out);

    // 测试的
    // rs1 rs1(ctrl_shiftamt[0], data_in, data_out);
    // rs2 rs2(ctrl_shiftamt[1], data_in, data_out);

endmodule
