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




//   wire and1, and2, and3, and4;
//   wire nor1, nor2;

//   assign and1 = enable & data;
//   assign and2 = enable & (~data);
//   assign and3 = clock & (~reset);
//   assign and4 = clock & reset;
//   assign nor1 = ~(and1 | Qbar);
//   assign nor2 = ~(and2 | Q);

//   and (nor1, and3, Q);
//   and (nor2, and3, Qbar);
//   and (Q, and4, Q);
//   and (Qbar, and4, Qbar);


endmodule
