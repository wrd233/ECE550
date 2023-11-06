/**
 * READ THIS DESCRIPTION!
 *
 * The processor takes in several inputs from a skeleton file.
 *
 * Inputs
 * clock: this is the clock for your processor at 50 MHz
 * reset: we should be able to assert a reset to start your pc from 0 (sync or
 * async is fine)
 *
 * Imem: input data from imem
 * Dmem: input data from dmem
 * Regfile: input data from regfile
 *
 * Outputs
 * Imem: output control signals to interface with imem
 * Dmem: output control signals and data to interface with dmem
 * Regfile: output control signals and data to interface with regfile
 *
 * Notes
 *
 * Ultimately, your processor will be tested by subsituting a master skeleton, imem, dmem, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file acts as a small wrapper around your processor for this purpose.
 *
 * You will need to figure out how to instantiate two memory elements, called
 * "syncram," in Quartus: one for imem and one for dmem. Each should take in a
 * 12-bit address and allow for storing a 32-bit value at each address. Each
 * should have a single clock.
 *
 * Each memory element should have a corresponding .mif file that initializes
 * the memory element to certain value on start up. These should be named
 * imem.mif and dmem.mif respectively.
 *
 * Importantly, these .mif files should be placed at the top level, i.e. there
 * should be an imem.mif and a dmem.mif at the same level as process.v. You
 * should figure out how to point your generated imem.v and dmem.v files at
 * these MIF files.
 *
 * imem
 * Inputs:  12-bit address, 1-bit clock enable, and a clock
 * Outputs: 32-bit instruction
 *
 * dmem
 * Inputs:  12-bit address, 1-bit clock, 32-bit data, 1-bit write enable
 * Outputs: 32-bit data at the given address
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
                                    // [hint] This is the clock for your processor running at 50 MHz.
    reset,                          // I: A reset signal
                                    // [hint] You should be able to assert a reset to start your PC from 0. It can be synchronous or asynchronous.

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for regfile
    ctrl_writeReg,                  // O: Register to write to in regfile
    ctrl_readRegA,                  // O: Register to read from port A of regfile
    ctrl_readRegB,                  // O: Register to read from port B of regfile
    data_writeReg,                  // O: Data to write to for regfile
    data_readRegA,                  // I: Data from port A of regfile
    data_readRegB                   // I: Data from port B of regfile
);
    // Control signals
    input clock, reset;

    // Imem
    output [11:0] address_imem;
    input [31:0] q_imem;

    // Dmem
    output [11:0] address_dmem;
    output [31:0] data;
    output wren;
    input [31:0] q_dmem;

    // Regfile
    output ctrl_writeEnable;
    output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
    output [31:0] data_writeReg;
    input [31:0] data_readRegA, data_readRegB;

    /* YOUR CODE STARTS HERE */
    wire[31:0] pc, pc_next;
    
    /* 指令获取 */
    register pc_register(.out(pc), .in(pc_next), .clk(clock), .reset(reset), .enable(1'b1));
    assign address_imem = pc[11:0];

    /* 指令解码 */
    wire Rtar, ALUinB, ALUop_ctrl, BR, Rwd,JP, DMwe, Rwe;
    wire is_addi, is_sw, is_lw, is_j, is_bne, is_jal, is_jr, is_blt, is_bex, is_setx;
    wire is_R,isR_add, isR_sub;   // 一些辅助的判断
    wire [16:0] N;
    wire [26:0] T;
    wire [4:0] opcode, ALUop, shamt, Rs, Rt, Rd;
    inst_decoder decoder (
        .inst(q_imem),
        .opcode(opcode), .ALUop(ALUop), .shamt(shamt), .Rs(Rs), .Rt(Rt), .Rd(Rd), .N(N), .T(T),
        .Rtar(Rtar), .ALUinB(ALUinB), .ALUop_ctrl(ALUop_ctrl), .BR(BR), .Rwd(Rwd), .JP(JP), .DMwe(DMwe), .Rwe(Rwe),
        .is_addi(is_addi), .is_sw(is_sw), .is_lw(is_lw), .is_j(is_j), .is_bne(is_bne), .is_jal(is_jal), .is_jr(is_jr), .is_blt(is_blt), .is_bex(is_bex), .is_setx(is_setx),
        .is_R(is_R), .isR_add(isR_add), .isR_sub(isR_sub),
    );

    /* 得到立即数和跳转地址(符号拓展) */
    wire [31:0]signex_N, unsignex_T;
    assign signex_N[31:16] = q_imem[16] ? 16'hFFFF:16'h0000;
    assign signex_N[15:0] = q_imem[15:0]; 
	
    assign unsignex_T[31:27] = 5'd0;
    assign unsignex_T[26:0] = q_imem[26:0]; 

    /* Register file的read和write指定 */

    /* ALU运算执行(overflow的指定) */
    wire [31:0] ovf_wrdata;

    /* 寄存器更新值 */

    /* DMem更新值 */

    /* PC更新 */

    /* 更新下一个PC */
    assign pc_next = pc + 32'd1;

endmodule