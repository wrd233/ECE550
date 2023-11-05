// module register(out, in, clk, reset, enable);
//     input [31:0] in;
//     input clk,enable,reset;
//     output [31:0] out;

//     genvar j;
//     generate
//         for (j = 0; j < 32; j = j + 1) begin : dffe_loop
//             DFFE_with_Async_Clear_Posedge dffe (.enable(enable), .clk(clk), .reset(reset), .D(in[j]),.Q(out[j]));
//         end
//     endgenerate

// endmodule

module register(out, in, clk, enable, reset);

	//Inputs
   input [31:0] in;
	input clk, enable, reset;

   //Output
   output [31:0] out;
	
	genvar i;
   generate
     for (i = 0; i < 32; i = i + 1) begin: register_intialize
   	dffe_ref dff(out[i], in[i], clk, enable, reset);
     end
   endgenerate
	
	
endmodule
