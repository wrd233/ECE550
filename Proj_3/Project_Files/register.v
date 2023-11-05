module register(out, in, clk, reset, enable);
    input [31:0] in;
    input clk,enable,reset;
    output [31:0] out;

    genvar j;
    generate
        for (j = 0; j < 32; j = j + 1) begin : dffe_loop
            DFFE_with_Async_Clear_Posedge dffe (.enable(enable), .clk(clk), .reset(reset), .D(in[j]),.Q(out[j]));
        end
    endgenerate

endmodule