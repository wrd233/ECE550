module register(in, enable, clock, out, reset);
    input [31:0] in;
    input clock,enable,reset;
    output [31:0] out;

    wire [31:0] reset_bit;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : reset_loop
            or og(reset_bit[i], reset, in[i]);
        end
    endgenerate

    genvar j;
    generate
        for (j = 0; j < 32; j = j + 1) begin : dff_loop
            d_flip_flop dff (.enable(enable), .clock(clock),.D(reset_bit[j]),.Q(out[j]),.Qbar());
        end
    endgenerate

endmodule
