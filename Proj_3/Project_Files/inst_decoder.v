/*
N->imme
T->target
Rtar->Rdst(这个有两种选择，第一种是删掉，然后外面用is_sw|is_bne|is_jr|is_blt进行判断，第二种是所有这种多个与的判断，都整成这种单个的控制信号)
is_R->is_alu
is_Radd->is_add
is_Rsub->is_sub
外部补充signex_N和unsignex_T
PC更新换成另一个人的，那个更加清晰
*/
module inst_decoder(inst,
opcode, ALUop, shamt, Rs, Rt, Rd, N, T, // 一些直接得到的部分
Rtar, ALUinB, ALUop_ctrl, BR, Rwd, JP, DMwe, Rwe,   // 常用的控制信号
is_addi, is_sw, is_lw, is_j, is_bne, is_jal, is_jr, is_blt, is_bex, is_setx,  //一些判断
is_R,isR_add, isR_sub
);
    input [31:0] inst;

    output Rtar, ALUinB, ALUop_ctrl, BR, Rwd,JP, DMwe, Rwe;
    output is_addi, is_sw, is_lw, is_j, is_bne, is_jal, is_jr, is_blt, is_bex, is_setx;
    output [16:0] N;
    output [26:0] T;
    output [4:0] opcode, ALUop, shamt, Rs, Rt, Rd;
    output is_R,isR_add, isR_sub;   // 一些辅助的判断


    assign opcode = inst[31:27];
    // TODO: 不知道要不要更新，就是当我们不用某个wire的时候，是否需要将其清零，反正我现在没有清零
    // assign ALUop = is_R? inst[6:2]: ALUop_ctrl? 5'b00001:5'b00000;
    // assign shamt = is_R? inst[11:7]: 5'b00000;
    // assign Rs = is_bex? 5'b00000: inst[21:17];
    // assign Rt = is_bex? 5'b11110: Rtar? inst[26:22]: inst[16:12];
    // assign Rd = is_setx? 5'b11110: is_jal? 5'b11111:((isR_add|isR_sub|is_addi)? (is_ovf? 5'b11110: inst[26:22]): inst[26:22]);
    assign ALU_op = is_R? inst[6:2] : 5'd0;   // alu if 1
    assign shamt  = is_R? inst[11:7] : 5'd0;  // alu if 1
    assign Rd = inst[26:22];
    assign Rs = inst[21:17];
    assign Rt = inst[16:12];
    assign N = inst[16:0];  // 立即数
    assign T = inst[26:0];  // 跳转的目标地址

	assign is_addi = (~opcode[4])&(~opcode[3])&(opcode[2])&(~opcode[1])&(opcode[0]);//00101
	assign is_sw = (~opcode[4])&(~opcode[3])&(opcode[2])&(opcode[1])&(opcode[0]);//00111
	assign is_lw = (~opcode[4])&(opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]);//01000
	assign is_j = (~opcode[4])&(~opcode[3])&(~opcode[2])&(~opcode[1])&(opcode[0]);//00001
	assign is_bne = (~opcode[4])&(~opcode[3])&(~opcode[2])&(opcode[1])&(~opcode[0]);//00010
	assign is_jal = (~opcode[4])&(~opcode[3])&(~opcode[2])&(opcode[1])&(opcode[0]);//00011
	assign is_jr = (~opcode[4])&(~opcode[3])&(opcode[2])&(~opcode[1])&(~opcode[0]);//00100
	assign is_blt = (~opcode[4])&(~opcode[3])&(opcode[2])&(opcode[1])&(~opcode[0]);//00110
	assign is_bex = (opcode[4])&(~opcode[3])&(opcode[2])&(opcode[1])&(~opcode[0]);//10110
	assign is_setx = (opcode[4])&(~opcode[3])&(opcode[2])&(~opcode[1])&(opcode[0]);//10101

    assign is_R = (~opcode[4])&(~opcode[3])&(~opcode[2])&(~opcode[1])&(~opcode[0]);//00000 
    assign isR_add = is_R&(~ALUop[4])&(~ALUop[3])&(~ALUop[2])&(~ALUop[1])&(~ALUop[0]); 
    assign isR_sub = is_R&(~ALUop[4])&(~ALUop[3])&(~ALUop[2])&(~ALUop[1])&(ALUop[0]); 

	assign Rtar = is_sw|is_bne|is_jr|is_blt;
	assign ALUinB = is_addi|is_sw|is_lw;
	assign ALUop_ctrl = is_bne|is_blt|is_bex;
	assign BR = is_bne|is_blt;
	assign JP = is_j|is_jal;
	assign DMwe = is_sw;
	assign Rwd = is_lw;
	assign Rwe = is_R|is_addi|is_lw|is_jal|is_setx;

    assign ovf_wrdata= isR_add? 32'd1:isR_sub?32'd3:is_addi?32'd2:32'd0;


endmodule