module d_latch(data, enable, clock, Q, Qbar);
    input data;
    input enable, clock;
    output Q, Qbar;

    wire EandClock;
    wire EandDbar,Dbar,EandD;
    and ag0(EandClock, enable, clock);
    not ng1(Dbar, data);
    and ag1(EandDbar, Dbar, EandClock);
    and ag2(EandD, EandClock, data);

    nor ng2(Q, Qbar, EandDbar);
    nor ng3(Qbar, EandD,Q);

endmodule
