//altmem_init CBX_SINGLE_OUTPUT_FILE="ON" INIT_TO_ZERO="NO" INTENDED_DEVICE_FAMILY=""Cyclone IV E"" LPM_TYPE="altmem_init" NUMWORDS=12 PORT_ROM_DATA_READY="PORT_UNUSED" ROM_READ_LATENCY=1 WIDTH=1 WIDTHAD=4 clock dataout init init_busy ram_address ram_wren
//VERSION_BEGIN 16.0 cbx_mgl 2016:04:27:18:06:48:SJ cbx_stratixii 2016:04:27:18:05:34:SJ cbx_util_mgl 2016:04:27:18:05:34:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, the Altera Quartus Prime License Agreement,
//  the Altera MegaCore Function License Agreement, or other 
//  applicable license agreement, including, without limitation, 
//  that your use is for the sole purpose of programming logic 
//  devices manufactured by Altera and sold by Altera or its 
//  authorized distributors.  Please refer to the applicable 
//  agreement for further details.



//synthesis_resources = altmem_init 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mg9ln
	( 
	clock,
	dataout,
	init,
	init_busy,
	ram_address,
	ram_wren) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	output   [0:0]  dataout;
	input   init;
	output   init_busy;
	output   [3:0]  ram_address;
	output   ram_wren;

	wire  [0:0]   wire_mgl_prim1_dataout;
	wire  wire_mgl_prim1_init_busy;
	wire  [3:0]   wire_mgl_prim1_ram_address;
	wire  wire_mgl_prim1_ram_wren;

	altmem_init   mgl_prim1
	( 
	.clock(clock),
	.dataout(wire_mgl_prim1_dataout),
	.init(init),
	.init_busy(wire_mgl_prim1_init_busy),
	.ram_address(wire_mgl_prim1_ram_address),
	.ram_wren(wire_mgl_prim1_ram_wren));
	defparam
		mgl_prim1.init_to_zero = "NO",
		mgl_prim1.intended_device_family = ""Cyclone IV E"",
		mgl_prim1.lpm_type = "altmem_init",
		mgl_prim1.numwords = 12,
		mgl_prim1.port_rom_data_ready = "PORT_UNUSED",
		mgl_prim1.rom_read_latency = 1,
		mgl_prim1.width = 1,
		mgl_prim1.widthad = 4;
	assign
		dataout = wire_mgl_prim1_dataout,
		init_busy = wire_mgl_prim1_init_busy,
		ram_address = wire_mgl_prim1_ram_address,
		ram_wren = wire_mgl_prim1_ram_wren;
endmodule //mg9ln
//VALID FILE
