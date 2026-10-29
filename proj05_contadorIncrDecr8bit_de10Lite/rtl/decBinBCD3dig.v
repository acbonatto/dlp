// Decodificador de entrada binaria (8-bits) para saida BCD 
// com tamanho de 3 digitos, para faixa 0 a 255
//		dec0_out = unidade, 
//    dec1_out = dezena,
//		dec2_out = centena
module decBinBCD3dig (
	input  wire [7:0] bin_in,
	output wire [9:0] led_out,
	output reg [7:0] dec0_out,
	output reg [7:0] dec1_out,
	output reg [7:0] dec2_out
);

	wire [7:0] bcd_div_10, bcd_div_100;
	wire [3:0] bcd0_reg, bcd1_reg, bcd2_reg;
	
	// Divisao por 10
	assign bcd_div_10 = bin_in / 8'd10;
	
	// Digito Unidade (BCD-0): resto da divisao por 10
	assign bcd0_reg = bin_in % 8'd10;

	// Digito Dezena (BCD-1): resto da divisao por 100
	assign bcd1_reg = bcd_div_10 % 8'd10;

	// Digito Centena (BCD-2): resultado da divisao por 100
	assign bcd2_reg = bcd_div_10 / 8'd10;

	// Saida 7 segmentos
	always @(*) begin
		if (bcd0_reg == 4'd0) 
			dec0_out = 8'b11000000;
		else if (bcd0_reg == 4'd1) 
			dec0_out = 8'b11111001;
		else if (bcd0_reg == 4'd2) 
			dec0_out = 8'b10100100;
		else if (bcd0_reg == 4'd3) 
			dec0_out = 8'b10110000;
		else if (bcd0_reg == 4'd4) 
			dec0_out = 8'b10011001;
		else if (bcd0_reg == 4'd5) 
			dec0_out = 8'b10010010;
		else if (bcd0_reg == 4'd6) 
			dec0_out = 8'b10000011;
		else if (bcd0_reg == 4'd7) 
			dec0_out = 8'b11111000;
		else if (bcd0_reg == 4'd8) 
			dec0_out = 8'b10000000;
		else if (bcd0_reg == 4'd9) 
			dec0_out = 8'b10011000;
		else
			dec0_out = 8'b11111111;	
	end
	
	// Saida 7 segmentos
	always @(*) begin
		if (bcd1_reg == 4'd0) 
			dec1_out = 8'b11000000;
		else if (bcd1_reg == 4'd1) 
			dec1_out = 8'b11111001;
		else if (bcd1_reg == 4'd2) 
			dec1_out = 8'b10100100;
		else if (bcd1_reg == 4'd3) 
			dec1_out = 8'b10110000;
		else if (bcd1_reg == 4'd4) 
			dec1_out = 8'b10011001;
		else if (bcd1_reg == 4'd5) 
			dec1_out = 8'b10010010;
		else if (bcd1_reg == 4'd6) 
			dec1_out = 8'b10000011;
		else if (bcd1_reg == 4'd7) 
			dec1_out = 8'b11111000;
		else if (bcd1_reg == 4'd8) 
			dec1_out = 8'b10000000;
		else if (bcd1_reg == 4'd9) 
			dec1_out = 8'b10011000;
		else
			dec1_out = 8'b11111111;	
	end
	
	// Saida 7 segmentos
	always @(*) begin
		if (bcd2_reg == 4'd0) 
			dec2_out = 8'b11000000;
		else if (bcd2_reg == 4'd1) 
			dec2_out = 8'b11111001;
		else if (bcd2_reg == 4'd2) 
			dec2_out = 8'b10100100;
		else if (bcd2_reg == 4'd3) 
			dec2_out = 8'b10110000;
		else if (bcd2_reg == 4'd4) 
			dec2_out = 8'b10011001;
		else if (bcd2_reg == 4'd5) 
			dec2_out = 8'b10010010;
		else if (bcd2_reg == 4'd6) 
			dec2_out = 8'b10000011;
		else if (bcd2_reg == 4'd7) 
			dec2_out = 8'b11111000;
		else if (bcd2_reg == 4'd8) 
			dec2_out = 8'b10000000;
		else if (bcd2_reg == 4'd9) 
			dec2_out = 8'b10011000;
		else
			dec2_out = 8'b11111111;	
	end
	
	assign led_out[7:0] = bin_in;
	assign led_out[9:8] = 2'b00;
	
endmodule
