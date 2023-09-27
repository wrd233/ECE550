module register(in, enable, clock, out, reset);
    input [2:0] in;
    input clock,enable,reset;
    output [2:0] out;

    genvar j;
    generate
        for (j = 0; j < 3; j = j + 1) begin : dff_loop
            d_flip_flop dff (.enable(enable), .clock(clock), .reset(reset), .D(in[j]),.Q(out[j]),.Qbar());
        end
    endgenerate

endmodule
