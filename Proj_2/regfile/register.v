module register(in, enable, clock, out);
    input [31:0] in;
    input clock,enable;
    output [31:0] out;

genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin : dff_loop
        d_flip_flop dff (.enable(enable), .clock(clock),.D(in[i]),.Q(out[i]),.Qbar());
    end
endgenerate

endmodule
