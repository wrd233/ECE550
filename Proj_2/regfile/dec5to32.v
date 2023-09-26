// module dec2to4(in, out, enable);
//   //declare inputs and outputs
//   input [1:0] in;
//   output [4:0] out;

//   //declare nIn (the NOT of the input)
//   wire [1:0] nIn;

//   //wire in through not gates to nIn
//   not not0(nIn[0], in[0]);
//   not not1(nIn[1], in[1]);

//   //decode with AND gates
//   and and0(out[0], nIn[1], nIn[0]);
//   and and1(out[1], nIn[1], in[0]);
//   and and2(out[2], in[1], nIn[0]);
//   and and3(out[3], in[1], in[0]);
// endmodule

// module dec3to8(in, out, enable);
//   // 声明输入和输出
//   input [2:0] in;
//   output [7:0] out;

//   // 声明 nIn（输入的反相）
//   wire [2:0] nIn;

//   // 通过非门将输入连接到 nIn
//   not not0(nIn[0], in[0]);
//   not not1(nIn[1], in[1]);
//   not not2(nIn[2], in[2]);

//   // 使用与门进行解码
//   and and0(out[0], nIn[2], nIn[1], nIn[0]);
//   and and1(out[1], nIn[2], nIn[1], in[0]);
//   and and2(out[2], nIn[2], in[1], nIn[0]);
//   and and3(out[3], nIn[2], in[1], in[0]);
//   and and4(out[4], in[2], nIn[1], nIn[0]);
//   and and5(out[5], in[2], nIn[1], in[0]);
//   and and6(out[6], in[2], in[1], nIn[0]);
//   and and7(out[7], in[2], in[1], in[0]);
// endmodule


module dec5to32(in, out);
  // Declare inputs and outputs
  input [4:0] in;
  output [31:0] out;

  wire [5:0] nIn;
  not not0(nIn[0], in[0]);
  not not1(nIn[1], in[1]);
  not not2(nIn[2], in[2]);
  not not3(nIn[3], in[3]);
  not not4(nIn[4], in[4]);

  and and0(out[0], nIn[4], nIn[3], nIn[2], nIn[1], nIn[0]);
  and and1(out[1], nIn[4], nIn[3], nIn[2], nIn[1], in[0]);
  and and2(out[2], nIn[4], nIn[3], nIn[2], in[1], nIn[0]);
  and and3(out[3], nIn[4], nIn[3], nIn[2], in[1], in[0]);
  and and4(out[4], nIn[4], nIn[3], in[2], nIn[1], nIn[0]);
  and and5(out[5], nIn[4], nIn[3], in[2], nIn[1], in[0]);
  and and6(out[6], nIn[4], nIn[3], in[2], in[1], nIn[0]);
  and and7(out[7], nIn[4], nIn[3], in[2], in[1], in[0]);
  and and8(out[8], nIn[4], in[3], nIn[2], nIn[1], nIn[0]);
  and and9(out[9], nIn[4], in[3], nIn[2], nIn[1], in[0]);
  and and10(out[10], nIn[4], in[3], nIn[2], in[1], nIn[0]);
  and and11(out[11], nIn[4], in[3], nIn[2], in[1], in[0]);
  and and12(out[12], nIn[4], in[3], in[2], nIn[1], nIn[0]);
  and and13(out[13], nIn[4], in[3], in[2], nIn[1], in[0]);
  and and14(out[14], nIn[4], in[3], in[2], in[1], nIn[0]);
  and and15(out[15], nIn[4], in[3], in[2], in[1], in[0]);
  and and16(out[16], in[4], nIn[3], nIn[2], nIn[1], nIn[0]);
  and and17(out[17], in[4], nIn[3], nIn[2], nIn[1], in[0]);
  and and18(out[18], in[4], nIn[3], nIn[2], in[1], nIn[0]);
  and and19(out[19], in[4], nIn[3], nIn[2], in[1], in[0]);
  and and20(out[20], in[4], nIn[3], in[2], nIn[1], nIn[0]);
  and and21(out[21], in[4], nIn[3], in[2], nIn[1], in[0]);
  and and22(out[22], in[4], nIn[3], in[2], in[1], nIn[0]);
  and and23(out[23], in[4], nIn[3], in[2], in[1], in[0]);
  and and24(out[24], in[4], in[3], nIn[2], nIn[1], nIn[0]);
  and and25(out[25], in[4], in[3], nIn[2], nIn[1], in[0]);
  and and26(out[26], in[4], in[3], nIn[2], in[1], nIn[0]);
  and and27(out[27], in[4], in[3], nIn[2], in[1], in[0]);
  and and28(out[28], in[4], in[3], in[2], nIn[1], nIn[0]);
  and and29(out[29], in[4], in[3], in[2], nIn[1], in[0]);
  and and30(out[30], in[4], in[3], in[2], in[1], nIn[0]);
  and and31(out[31], in[4], in[3], in[2], in[1], in[0]);

endmodule