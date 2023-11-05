module DFFE_with_Async_Clear_Posedge(Q, D, clk, reset, enable);
    input D, reset, clk, enable;
    output Q;
    reg Q;

    initial begin
        Q = 1'b0;
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 1'b0;  // 异步清零
        end else if (enable) begin
            Q <= D;     // 在上升沿进行置位
        end
    end
endmodule