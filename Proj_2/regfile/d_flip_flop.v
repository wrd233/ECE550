module d_flip_flop (
  clock,
  D,
  Q,    		// Q is a reg since it is assigned in an always block
  Qbar
);
  input clock, D;
  output Q,Qbar;

  wire clockBar, Qmiddle, QbarMiddle;

  not_gate ng1(clock, clockBar);
  d_latch dl1(D, clockBar, Qmiddle, QbarMiddle);
  d_latch dl2(Qmiddle, clock, Q, Qbar);

endmodule