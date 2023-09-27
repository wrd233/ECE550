module d_flip_flop (
  clock,
  enable,
  reset,
  D,
  Q,    		// TODO: Q can be a reg since it is assigned in an always block
  Qbar
);
  input clock, D, enable, reset;
  output Q,Qbar;

  wire clockBar, Qmiddle, QbarMiddle;

  not ng1(clockBar, clock);
  d_latch dl1(.data(D), .enable(enable), .reset(reset), .clock(clockBar), .Q(Qmiddle), .Qbar(QbarMiddle));
  d_latch dl2(.data(Qmiddle), .enable(enable), .reset(reset), .clock(clock), .Q(Q), .Qbar(Qbar));

endmodule