module d_flip_flop (
  clock,
  enable,
  D,
  Q,    		// TODO: Q can be a reg since it is assigned in an always block
  Qbar
);
  input clock, D, enable;
  output Q,Qbar;

  wire clockBar, Qmiddle, QbarMiddle;

  not ng1(clockBar, clock);
  d_latch dl1(.data(D), .enable(enable), .clock(clockBar), .Q(Qmiddle), .Qbar(QbarMiddle));
  d_latch dl2(.data(Qmiddle), .enable(enable), .clock(clock), .Q(Q), .Qbar(Qbar));

endmodule