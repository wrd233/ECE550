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
    wire [31:0] pc_plus1, pc_plusN1, mux_BR_out, mux_JP_out;
    // register pc_register(.out(pc), .in(mux_JP_out), .clk(clock), .reset(reset), .enable(1'b1));
    register pc_register(.out(pc), .in(mux_JP_out), .clk(clock), .reset(reset), .enable(1'b1));
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
        .is_R(is_R), .isR_add(isR_add), .isR_sub(isR_sub)
    );

    /* 得到立即数和跳转地址(符号拓展) */
    wire [31:0]signex_N, unsignex_T;
    assign signex_N[31:16] = q_imem[16] ? 16'hFFFF:16'h0000;
    assign signex_N[15:0] = q_imem[15:0]; 
	
    assign unsignex_T[31:27] = 5'd0;
    assign unsignex_T[26:0] = q_imem[26:0]; 

    /* Register file的read指定 */
    assign ctrl_readRegA = is_bex? 5'b00000: Rs;
    assign ctrl_readRegB = is_bex? 5'b11110: Rtar? Rd: Rt;

    /* ALU运算执行(overflow的指定) */
    wire[31:0] data_operandB, alu_out, ovf_wrdata;
    wire is_ne, is_lt, is_ovf;  // TODO: 把这些改成isNotEqual, isLessThan, overflow等等更容易理解的
    assign data_operandB = ALUinB ? signex_N: data_readRegB; 
    alu myalu(.data_operandA(data_readRegA), .data_operandB(data_operandB), .ctrl_ALUopcode(ALUop), .ctrl_shiftamt(shamt), .data_result(alu_out), .isNotEqual(is_ne), .isLessThan(is_lt), .overflow(is_ovf));
    assign ovf_wrdata= isR_add? 32'd1:isR_sub?32'd3:is_addi?32'd2:32'd0;    // 不同overflow情况下rstatus应该被赋予的值

    /* 寄存器更新值 */
    wire [31:0] regf_wrdata;
    wire [31:0] dmem_out;
    assign regf_wrdata = is_setx? unsignex_T: is_jal? pc_plus1:(is_lw? dmem_out:(isR_add|isR_sub|is_addi)?(is_ovf?ovf_wrdata:alu_out):alu_out); // TODO: 好好拆解一下
    assign ctrl_writeReg = is_setx? 5'b11110: is_jal? 5'b11111:((isR_add|isR_sub|is_addi)? (is_ovf? 5'b11110: Rd): Rd); // TODO: 好好拆解一下

    /* DMem更新值 */
    assign address_dmem = alu_out[11:0];  //output_dmem
    assign data = data_readRegB;
    assign dmem_out = q_dmem; //input_dmem
    assign wren = DMwe;       //output_dmem

    /* PC更新 */
    // TODO: 逻辑简化一下， 这里用了太多中间变量，我觉得可以将其类似if-else展开，然后每一步说明原因
    RCA_32bit myRCA1(pc_plus1,pc, 32'd1);
    RCA_32bit myRCA2(pc_plusN1, pc_plus1, signex_N);
    assign mux_BR_out = (is_bne&is_ne|is_blt&(~is_lt)&is_ne)? pc_plusN1:pc_plus1;
    assign mux_JP_out = is_jr?data_readRegB: (is_bex&is_ne)? unsignex_T: (JP?unsignex_T: mux_BR_out);

endmodule