module d_latch(data, enable, clock, reset, Q, Qbar);
    input data;
    input enable, clock, reset;
    output Q, Qbar;

    wire EandClock;
    wire EandDbar,Dbar,EandD, Qres;
    and ag0(EandClock, enable, clock);
    not ng1(Dbar, data);
    and ag1(EandDbar, Dbar, EandClock);
    and ag2(EandD, EandClock, data);

    nor ng2(Qres, Qbar, EandDbar);
    nor ng3(Qbar, EandD,Qres);

    mux_2 mx(reset, Qres, 1'b0, Q);


endmodule
