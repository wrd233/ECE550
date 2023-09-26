module E_signal(ctrl_writeEnable, ctrl_writeReg, enables);
    input [4:0] ctrl_writeReg;
    input ctrl_writeEnable;
    output [31:0] enables;

    wire [31:0]midRes;

    dec5to32 dec(ctrl_writeReg, midRes);

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : loop1
            and (enables[i], midRes[i], ctrl_writeEnable);
        end
    endgenerate
endmodule


module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

    input clock, ctrl_writeEnable, ctrl_reset;
    input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    input [31:0] data_writeReg;

    output [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE HERE */
    // write port
    wire [31:0]Wenables;
    E_signal es(.ctrl_writeEnable(ctrl_writeEnable), .ctrl_writeReg(ctrl_writeReg), .enables(Wenables));

    wire [31:0] out[0:31];
    
    register rg(.in(data_writeReg), .enable(Wenables[0]), .clock(clock), .out(out[0]), .reset(1'b1));
    genvar i;
    generate
        for (i = 1; i < 32; i = i + 1) begin : loop2
            register rg(.in(data_writeReg), .enable(Wenables[i]), .clock(clock), .out(out[i]), .reset(ctrl_reset));
        end
    endgenerate

   
    // read port
    wire [31:0] RenablesA, RenablesB;
    dec5to32 dec1(ctrl_readRegA, RenablesA);
    dec5to32 dec2(ctrl_readRegB, RenablesB);

    generate
        for (i = 0; i < 32; i = i + 1) begin : loop3
            assign data_readRegA = RenablesA[i]?out[i]:32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
        end
    endgenerate

    generate
        for (i = 0; i < 32; i = i + 1) begin : loop4
            assign data_readRegB = RenablesB[i]?out[i]:32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
        end
    endgenerate

endmodule
