module d_latch(data, enable, Q, Qbar);
    input data;
    input enable;
    output Q, Qbar;

    wire EandDbar,Dbar,EandD;
    not_gate ng1(data, Dbar);
    and_gate ag1(Dbar, enable, EandDbar);
    and_gate ag2(enable, data, EandD);

    nor_gate ng2(Qbar, EandDbar,Q);
    nor_gate ng3(Q, EandD,Qbar);

endmodule
