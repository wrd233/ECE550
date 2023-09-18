module ls1(select, data_in, data_out);
    input select;
    input [31:0] data_in;
    output [31:0] data_out;
    // 首先移位前几个特殊的
    mux_2 mx0(select, 1'b0, data_in[0], data_out[0]);
    genvar i;
    generate
        for (i = 0; i < 31; i = i + 1) begin:loop1
            mux_2 mx(select, data_in[i], data_in[i+1], data_out[i+1]);
        end
    endgenerate
endmodule

module ls2(select, data_in, data_out);
    input select;
    input [31:0] data_in;
    output [31:0] data_out;
    // 首先移位前几个特殊的
    mux_2 mx0(select, 1'b0, data_in[0], data_out[0]);
    mux_2 mx1(select, 1'b0, data_in[1], data_out[1]);
    genvar i;
    generate
        for (i = 0; i < 30; i = i + 1) begin:loop2
            mux_2 mx(select, data_in[i], data_in[i+2], data_out[i+2]);
        end
    endgenerate
endmodule

module ls4(select, data_in, data_out);
    input select;
    input [31:0] data_in;
    output [31:0] data_out;
    // 首先移位前几个特殊的
    mux_2 mx0(select, 1'b0, data_in[0], data_out[0]);
    mux_2 mx1(select, 1'b0, data_in[1], data_out[1]);
    mux_2 mx2(select, 1'b0, data_in[2], data_out[2]);
    mux_2 mx3(select, 1'b0, data_in[3], data_out[3]);
    genvar i;
    generate
        for (i = 0; i < 28; i = i + 1) begin:loop3
            mux_2 mx(select, data_in[i], data_in[i+4], data_out[i+4]);
        end
    endgenerate
endmodule

module ls8(select, data_in, data_out);
    input select;
    input [31:0] data_in;
    output [31:0] data_out;
    // 首先移位前几个特殊的
    mux_2 mx0(select, 1'b0, data_in[0], data_out[0]);
    mux_2 mx1(select, 1'b0, data_in[1], data_out[1]);
    mux_2 mx2(select, 1'b0, data_in[2], data_out[2]);
    mux_2 mx3(select, 1'b0, data_in[3], data_out[3]);
    mux_2 mx4(select, 1'b0, data_in[4], data_out[4]);
    mux_2 mx5(select, 1'b0, data_in[5], data_out[5]);
    mux_2 mx6(select, 1'b0, data_in[6], data_out[6]);
    mux_2 mx7(select, 1'b0, data_in[7], data_out[7]);
    genvar i;
    generate
        for (i = 0; i < 24; i = i + 1) begin:loop4
            mux_2 mx(select, data_in[i], data_in[i+8], data_out[i+8]);
        end
    endgenerate
endmodule

module ls16(select, data_in, data_out);
    input select;
    input [31:0] data_in;
    output [31:0] data_out;
    // 首先移位前几个特殊的
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : loop5
            mux_2 mx(select, 1'b0, data_in[i], data_out[i]);
        end
    endgenerate


    genvar j;
    generate
        for (j = 0; j < 16; j = j + 1) begin:loop6
            mux_2 mx(select, data_in[j], data_in[j+16], data_out[j+16]);
        end
    endgenerate
endmodule


module left_shift_32bit(ctrl_shiftamt, data_in, data_out);
    input [31:0] data_in;
    input [4:0] ctrl_shiftamt;
    output [31:0] data_out;

    wire [31:0] out_1, out_2, out_3, out_4;

    wire ctrl0,ctrl1,ctrl2,ctrl3,ctrl4;
    not_gate ng1(ctrl_shiftamt[0], ctrl0);
    not_gate ng2(ctrl_shiftamt[1], ctrl1);
    not_gate ng3(ctrl_shiftamt[2], ctrl2);
    not_gate ng4(ctrl_shiftamt[3], ctrl3);
    not_gate ng5(ctrl_shiftamt[4], ctrl4);


    ls1 ls1(ctrl0, data_in, out_1);
    ls2 ls2(ctrl1, out_1, out_2);
    ls4 ls3(ctrl2, out_2, out_3);
    ls8 ls4(ctrl3, out_3, out_4);
    ls16 ls5(ctrl4, out_4, data_out);

endmodule
