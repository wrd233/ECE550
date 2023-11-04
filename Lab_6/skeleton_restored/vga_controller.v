module vga_controller(iRST_n,
                      iVGA_CLK,
                      oBLANK_n,
                      oHS,
                      oVS,
                      b_data,
                      g_data,
                      r_data,
							 ps2_key_pressed,
							 ps2_out);

	
input iRST_n;
input iVGA_CLK;
input ps2_key_pressed;
input [7:0] ps2_out;
output reg oBLANK_n;
output reg oHS;
output reg oVS;
output [7:0] b_data;
output [7:0] g_data;  
output [7:0] r_data;                        
///////// ////                     
reg [18:0] ADDR;
reg [23:0] bgr_data;
wire VGA_CLK_n;
wire [7:0] index;
wire [23:0] bgr_data_raw;
wire cBLANK_n,cHS,cVS,rst;

reg [15:0] x = 16'd340;
reg [15:0] y = 16'd200;
parameter width = 4'd30;
parameter height = 4'd30;
////
assign rst = ~iRST_n;
video_sync_generator LTM_ins (.vga_clk(iVGA_CLK),
                              .reset(rst),
                              .blank_n(cBLANK_n),
                              .HS(cHS),
                              .VS(cVS));
////
////Addresss generator
always@(posedge iVGA_CLK,negedge iRST_n)
begin
  if (!iRST_n)
     ADDR<=19'd0;
  else if (cHS==1'b0 && cVS==1'b0)
     ADDR<=19'd0;
  else if (cBLANK_n==1'b1)
     ADDR<=ADDR+1;
end
//////////////////////////
//////INDEX addr.
assign VGA_CLK_n = ~iVGA_CLK;
img_data	img_data_inst (
	.address ( ADDR ),
	.clock ( VGA_CLK_n ),
	.q ( index )
	);
	
/////////////////////////
//////Add switch-input logic here
always@(posedge VGA_CLK_n)
begin
  if(ADDR%640 >= x && ADDR%640 <= x + width)
		if (ADDR/640 >= y && ADDR/640 <= y + height)
		bgr_data <= 24'hFF0000;
		else 
		bgr_data <= bgr_data_raw;
	else
	bgr_data <= bgr_data_raw;		
end

always@(negedge ps2_key_pressed)
begin
if(ps2_out == 8'h1c)
x <= x - 4'hf;
if(ps2_out == 8'h23)
x <= x + 4'hf;
if(ps2_out == 8'h1d)
y <= y - 4'hf;
if(ps2_out == 8'h1b)
y <= y + 4'hf;	
end
	
//////Color table output
img_index	img_index_inst (
	.address ( index ),
	.clock ( iVGA_CLK ),
	.q ( bgr_data_raw)
	);	
//////
//////latch valid data at falling edge;
//always@(posedge VGA_CLK_n) bgr_data <= bgr_data_raw;
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
 	















