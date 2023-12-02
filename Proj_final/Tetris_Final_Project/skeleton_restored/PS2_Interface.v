module PS2_Interface(inclock, resetn, ps2_clock, ps2_data, ps2_key_data, ps2_key_pressed, last_data_received);

 input    inclock, resetn;
 inout    ps2_clock, ps2_data;
 output    ps2_key_pressed;
 output  [7:0]  ps2_key_data;
 output  [7:0]  last_data_received;
 reg key_realease;
 reg [23:0]cnt;

 // Internal Registers
 reg   [7:0] last_data_received; 
 
 always @(posedge inclock)
 begin
  if (resetn == 1'b0)
   last_data_received <= 8'h00;
  else if (ps2_key_pressed == 1'b1) begin
      cnt <= 24'h000000;
   //if(key_realease == 1) begin
                //last_data_received <= ps2_key_data;
      if(ps2_key_data==8'h1c)
      last_data_received<=8'h61;
     else if(ps2_key_data==8'h1D)
      last_data_received<=8'h77;
     else if(ps2_key_data==8'h1b)
      last_data_received<=8'h73;
     else if(ps2_key_data==8'h23)
      last_data_received<=8'h64;
     else
      last_data_received <= ps2_key_data;
     key_realease <= 1'b0; 
   //end
  end
  else begin
   if(cnt == 24'hffffff)
    last_data_received <= 8'h00;
   else
    cnt <= cnt + 1'b1;
  end
  //if(ps2_key_data == 8'hf0)
   // key_realease <= 1'b1;   
 end
 
 PS2_Controller PS2 (.CLOCK_50    (inclock),
      .reset     (~resetn),
      .PS2_CLK   (ps2_clock),
      .PS2_DAT   (ps2_data),  
      .received_data  (ps2_key_data),
      .received_data_en (ps2_key_pressed)
      );

endmodule