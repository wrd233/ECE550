module vga_controller(iRST_n,
                      iVGA_CLK,
                      oBLANK_n,
                      oHS,
                      oVS,
                      b_data,
                      g_data,
                      r_data,
							 ps2_out,rowData1,rowData2,rowData3,rowData4,rowData5,rowData6,rowData7,rowData8,rowData9,rowData10,
			rowData11,rowData12,rowData13,rowData14,rowData15,rowData16,rowData17,rowData18,rowData19,rowData20,scoreOut);
input[7:0] ps2_out;
input iRST_n;
input iVGA_CLK;
input  [14:0] rowData1;
input  [14:0] rowData2;
input  [14:0] rowData3;
input  [14:0] rowData4;
input  [14:0] rowData5;
input  [14:0] rowData6;
input  [14:0] rowData7;
input  [14:0] rowData8;
input  [14:0] rowData9;
input  [14:0] rowData10;
input  [14:0] rowData11;
input  [14:0] rowData12;
input  [14:0] rowData13;
input  [14:0] rowData14;
input  [14:0] rowData15;
input  [14:0] rowData16;
input  [14:0] rowData17;
input  [14:0] rowData18;
input  [14:0] rowData19;
input  [14:0] rowData20;
input [31:0] scoreOut;
wire iVGA_CLK_div2_10;
wire iVGA_CLK_div2_20;

frequency_divider_by2_10 ( iVGA_CLK,rst,iVGA_CLK_div2_10 );
frequency_divider_by2_10 ( iVGA_CLK_div2_10,rst,iVGA_CLK_div2_20);

register15(rowData1,row1,1,~iVGA_CLK_div2_20,rst);
register15(rowData2,row2,1,~iVGA_CLK_div2_20,rst);
register15(rowData3,row3,1,~iVGA_CLK_div2_20,rst);
register15(rowData4,row4,1,~iVGA_CLK_div2_20,rst);
register15(rowData5,row5,1,~iVGA_CLK_div2_20,rst);
register15(rowData6,row6,1,~iVGA_CLK_div2_20,rst);
register15(rowData7,row7,1,~iVGA_CLK_div2_20,rst);
register15(rowData8,row8,1,~iVGA_CLK_div2_20,rst);
register15(rowData9,row9,1,~iVGA_CLK_div2_20,rst);
register15(rowData10,row10,1,~iVGA_CLK_div2_20,rst);
register15(rowData11,row11,1,~iVGA_CLK_div2_20,rst);
register15(rowData12,row12,1,~iVGA_CLK_div2_20,rst);
register15(rowData13,row13,1,~iVGA_CLK_div2_20,rst);
register15(rowData14,row14,1,~iVGA_CLK_div2_20,rst);
register15(rowData15,row15,1,~iVGA_CLK_div2_20,rst);

register15(rowData16,row16,1,~iVGA_CLK_div2_20,rst);
register15(rowData17,row17,1,~iVGA_CLK_div2_20,rst);
register15(rowData18,row18,1,~iVGA_CLK_div2_20,rst);
register15(rowData19,row19,1,~iVGA_CLK_div2_20,rst);
register15(rowData20,row20,1,~iVGA_CLK_div2_20,rst);
reg [24:0] referenceNum[9:0];
integer  score_n0;
integer  score_n1;
integer score_n2;
integer relative_x;
integer relative_y;
wire [14:0] row1;
wire [14:0] row2;
wire [14:0] row3;
wire [14:0] row4;
wire [14:0] row5;
wire [14:0] row6;
wire [14:0] row7;
wire [14:0] row8;
wire [14:0] row9;
wire [14:0] row10;
wire [14:0] row11;
wire [14:0] row12;
wire [14:0] row13;
wire [14:0] row14;
wire [14:0] row15;
wire [14:0] row16;
wire [14:0] row17;
wire [14:0] row18;
wire [14:0] row19;
wire [14:0] row20;
output reg oBLANK_n;
output reg oHS;
output reg oVS;
output [7:0] b_data;
output [7:0] g_data;  
output [7:0] r_data;
reg[9:0] x;
reg[9:0] y;
reg shifted;
reg[24:0] num;
initial begin
	shifted<=0;
	x<=320;
	y<=240;      
	referenceNum[0]<=25'b1111110001100011000111111;
referenceNum[1]<=25'b0000100001000010000100001;
referenceNum[2]<=25'b1111100001111111000011111;
referenceNum[3]<=25'b1111100001111110000111111;
referenceNum[4]<=25'b1000110001111110000100001;
referenceNum[5]<=25'b1111110000111110000111111;
referenceNum[6]<=25'b1111110000111111000111111;
referenceNum[7]<=25'b1111100001000010000100001;
referenceNum[8]<=25'b1111110001111111000111111;
referenceNum[9]<=25'b1111110001111110000111111;
end                
///////// ////                     
reg [18:0] ADDR;
reg [7:0] index_DMEM;
reg [23:0] bgr_data;
wire VGA_CLK_n;
wire [7:0] index_VGA;
wire [7:0] index;
wire [23:0] bgr_data_raw;
wire [23:0] bgr_data_DMEM;
wire cBLANK_n,cHS,cVS,rst;
////
assign rst = ~iRST_n;
video_sync_generator LTM_ins (.vga_clk(iVGA_CLK),
                              .reset(rst),
                              .blank_n(cBLANK_n),
                              .HS(cHS),
                              .VS(cVS));
////
////Addresss generator
always@(posedge iVGA_CLK_div2_20,negedge iRST_n)
begin
	
end
always@(posedge iVGA_CLK,negedge iRST_n)
begin
  if (!iRST_n)begin 
     ADDR<=19'd0;
		index_DMEM <= 2;
  end
  else if (cHS==1'b0 && cVS==1'b0)begin
     ADDR<=19'd0;
		index_DMEM <= 2;

  end
  else if (cBLANK_n==1'b1)begin
      ADDR <= ADDR+1;
		
		score_n0=scoreOut%10;
		score_n1=(scoreOut/10)%10;
		score_n2=(scoreOut/100)%10;
		if (ADDR%640<120&&ADDR%640>20)	begin
			if(ADDR/640>20&&ADDR/640<120)	begin
				relative_x=4-(ADDR%640-20)/20;
				relative_y=4-(ADDR/640-20)/20;
				num<=referenceNum[score_n2];
				index_DMEM<=num[relative_y*5+relative_x];
			end
			if(ADDR/640>140&&ADDR/640<240)	begin
				relative_x=4-(ADDR%640-20)/20;
				relative_y=4-(ADDR/640-140)/20;
				num<=referenceNum[score_n1];
				index_DMEM<=num[relative_y*5+relative_x];
			end
			if(ADDR/640>260&&ADDR/640<360)	begin
				relative_x=4-(ADDR%640-20)/20;
				relative_y=4-(ADDR/640-260)/20;
				num<=referenceNum[score_n0];
				index_DMEM<=num[relative_y*5+relative_x];
			end
		end
		else if (((ADDR%640)<500)&&((ADDR%640)>140))begin
			index_DMEM<=1;
			if(ADDR%640>0&&ADDR/640<24&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row1[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>24&&ADDR/640<48&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row2[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>48&&ADDR/640<72&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row3[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>72&&ADDR/640<96&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row4[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>96&&ADDR/640<120&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row5[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>120&&ADDR/640<144&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row6[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>144&&ADDR/640<168&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row7[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>168&&ADDR/640<192&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row8[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>192&&ADDR/640<216&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row9[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>216&&ADDR/640<240&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row10[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>240&&ADDR/640<264&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row11[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>264&&ADDR/640<288&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row12[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>288&&ADDR/640<312&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row13[((ADDR%640)-140)/24];
			end
			
			else if(ADDR/640>312&&ADDR/640<336&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row14[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>336&&ADDR/640<360&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row15[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>360&&ADDR/640<384&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row16[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>384&&ADDR/640<408&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row17[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>408&&ADDR/640<432&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row18[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>432&&ADDR/640<456&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row19[((ADDR%640)-140)/24];
			end
			else if(ADDR/640>456&&ADDR/640<480&&((ADDR%640)-140)%24!=0)begin
				index_DMEM<=row20[((ADDR%640)-140)/24];
			end
		end
	   else begin
			index_DMEM <= 2;
	   end
  end
  
end
//////////////////////////
//////INDEX addr.
assign VGA_CLK_n = ~iVGA_CLK;
//img_data	img_data_VGA (
//	.address ( ADDR ),
//	.clock ( VGA_CLK_n ),
//	.q ( index_VGA )
//	);
//	
//
dmem dmem_ins(
	.address ( index_DMEM ),
	.clock ( VGA_CLK_n ),
	.q ( index)
);

/////////////////////////
//////Add switch-input logic here
	
//////Color table output
	
img_index	img_index_inst (
	.address ( index ),
	.clock ( iVGA_CLK ),
	.q ( bgr_data_DMEM)
	);	
	

//////
//////latch valid data at falling edge;
always@(posedge VGA_CLK_n)
begin
	bgr_data <= bgr_data_DMEM;
end 

//begin
//if	(((x-10)<(ADDR%640))&&((ADDR%640)<(x+10))&&(((y-10)<(ADDR/640))&&((ADDR/640)<(y+10))))begin
//			bgr_data<=24'h009900;
//	end
//	else begin
//		bgr_data <= bgr_data_raw;
//	end
//	if(ADDR==1)begin
//		if(ps2_out==8'h6b) begin
//			if(x>=11)	x<=x-1;
//		end
//		else if(ps2_out==8'h75)begin
//			if (y>=11)	y<=y-1;
//		end
//		else if(ps2_out==8'h72)begin
//			if (y<470)	y<=y+1;
//			end
//		else if(ps2_out==8'h74)begin
//			if (x<=630) x<=x+1;
//		end
//	end
//end
assign b_data = bgr_data[23:16];
assign g_data = bgr_data[15:8];
assign r_data = bgr_data[7:0]; 
	
///////////////////
//////Delay the iHD, iVD,iDEN for one clock cycle;
always@(negedge iVGA_CLK)
begin
  oHS<=cHS;
  oVS<=cVS;
  oBLANK_n<=cBLANK_n;
end

endmodule
 	















