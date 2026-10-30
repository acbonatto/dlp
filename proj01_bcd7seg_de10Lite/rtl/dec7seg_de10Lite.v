// Decodificador BCD para display de 7 segmentos - anodo comum

module bcd7seg (
	input  wire [3:0] bcd_in,
	output reg  [7:0] hex0_out // (dp, g, f, e, d, c, b, a)
);

	always @(*) begin

		if (bcd_in == 4'd0) 
			hex0_out = 8'b11000000;
		else if (bcd_in == 4'd1) 
			hex0_out = 8'b11111001;
		else if (bcd_in == 4'd2) 
			hex0_out = 8'b10100100;
		else if (bcd_in == 4'd3) 
			hex0_out = 8'b10110000;
		else if (bcd_in == 4'd4) 
			hex0_out = 8'b10011001;
		else if (bcd_in == 4'd5) 
			hex0_out = 8'b10010010;
		else if (bcd_in == 4'd6) 
			hex0_out = 8'b10000010;
		else if (bcd_in == 4'd7) 
			hex0_out = 8'b11111000;
		else if (bcd_in == 4'd8) 
			hex0_out = 8'b10000000;
		else if (bcd_in == 4'd9) 
			hex0_out = 8'b10011000;
		else if (bcd_in == 4'd10) // A 
			hex0_out = 8'b10001000;
		else if (bcd_in == 4'd11) // B 
			hex0_out = 8'b10000011;
		else if (bcd_in == 4'd12) // C 
			hex0_out = 8'b11000110;
		else if (bcd_in == 4'd13) // D 
			hex0_out = 8'b10100001;
		else if (bcd_in == 4'd14) // E 
			hex0_out = 8'b10000110;
		else if (bcd_in == 4'd15) // F 
			hex0_out = 8'b10001110;
		else
			hex0_out = 8'b11111111;
			
	end
	
endmodule
