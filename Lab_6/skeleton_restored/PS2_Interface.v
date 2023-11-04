module PS2_Interface(inclock, resetn, ps2_clock, ps2_data, ps2_key_data, ps2_key_pressed, last_data_received,key_release);

	input 			inclock, resetn;
	inout 			ps2_clock, ps2_data;
	output 			ps2_key_pressed;
	output 	[7:0] 	ps2_key_data;
	output 	[7:0] 	last_data_received;
	output reg key_release;

	// Internal Registers
	reg			[7:0]	last_data_received;	
	
	always @(posedge inclock)
	begin
		if (resetn == 1'b0)
			last_data_received <= 8'h00;
		else if (ps2_key_pressed == 1'b1) begin
		if (key_release == 1)begin
			last_data_received <= ps2_key_data;
			key_release <= 1'b0;
			end
			end
			if(ps2_key_data == 8'hf0)
			key_release <= 1'b1;
	end
	
	
	
	PS2_Controller PS2 (.CLOCK_50 			(inclock),
						.reset 				(~resetn),
						.PS2_CLK			(ps2_clock),
						.PS2_DAT			(ps2_data),		
						.received_data		(ps2_key_data),
						.received_data_en	(ps2_key_pressed)
						);

endmodule
