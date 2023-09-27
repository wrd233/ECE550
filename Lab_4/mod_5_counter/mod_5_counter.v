module dec3to8 (
  input [2:0] in,
  output [7:0] out
);

  wire nIn0, nIn1, nIn2;

  not u1 (nIn0, in[0]);
  not u2 (nIn1, in[1]);
  not u3 (nIn2, in[2]);

  and u4 (out[0], nIn2, nIn1, nIn0);
  and u5 (out[1], nIn2, nIn1, in[0]);
  and u6 (out[2], nIn2, in[1], nIn0);
  and u7 (out[3], nIn2, in[1], in[0]);
  and u8 (out[4], in[2], nIn1, nIn0);
  and u9 (out[5], in[2], nIn1, in[0]);
  and u10 (out[6], in[2], in[1], nIn0);
  and u11 (out[7], in[2], in[1], in[0]);

endmodule

module mod_5_counter(out, clock, reach4, clockout);
    input  clock;
    // input reset;

    output reg [6:0]out;
    output reg reach4;
    output clockout;

    reg [2:0]tempState;
    reg [2:0]nextState;

    and ag(clockout, 1'b1, clock);

    always @(posedge clock) begin
        case(tempState)
            3'd0:begin
                reach4 <= 1'b0;
                nextState <= 3'd1;
                out <= 7'b1000000;
            end
            3'd1:begin
                reach4 <= 1'b0;
                nextState <= 3'd2;
                out <= 7'b1111001;
            end
            3'd2:begin
                reach4 <= 1'b0;
                nextState <= 3'd3;
                out <= 7'b0100100;
            end
            3'd3:begin
                reach4 <= 1'b0;
                nextState <= 3'd4;
                out <= 7'b0110000;
            end
            3'd4:begin
                reach4 <= 1'b1;
                nextState <= 3'd0;
                out <= 7'b0011001;
            end
            default:begin
                reach4 <= 1'b0;
                nextState <= 3'd0;
                out <= 7'b000000;
            end
        endcase

        tempState <= nextState;

        // mux_8 mx2(tempState, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, reach4);
        // mux_8 mx3(tempState, 7'b1000000, 7'b1111001, 7'b0100100, 7'b0110000, 7'b0011001, 7'b000000, 7'b000000, 7'b000000, out);
        // tempState = nextState;
    end

    // wire [2:0]tempState;
    // wire [2:0]nextState; // 为什么reg不行？

    // and ag(clockout, 1'b1, clock);

    // register rg(.in(nextState), .enable(1'b1), .clock(clock), .out(tempState), .reset(1'b0));

    // mux_8 mx (tempState, 3'd1, 3'd2, 3'd3, 3'd4, 3'd0, 3'd0, 3'd0, 3'd0, nextState);

    // mux_8 mx2(tempState, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, reach4);

    // mux_8 mx3(tempState, 7'b1000000, 7'b1111001, 7'b0100100, 7'b0110000, 7'b0011001, 7'b000000, 7'b000000, 7'b000000, out);

endmodule
