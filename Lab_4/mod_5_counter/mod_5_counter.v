module mod_5_counter(out, clock, reset, reach4);
    input  clock;
    input reset;
    output [2:0]out;
    output reach4;

    wire [2:0]nextState; // 为什么reg不行？

    register rg(.in(nextState), .enable(1'b1), .clock(clock), .out(out), .reset(reset));

    

    mux_8 mx (out, 3'd1, 3'd2, 3'd3, 3'd4, 3'd0, 3'd0, 3'd0, 3'd0, nextState);
    
    mux_8 mx2(out, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, reach4);

endmodule
