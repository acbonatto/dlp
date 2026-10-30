// Contador BCD com habilitaçao e limpeza da contagem

module bcdCounter7seg (
	input wire clk, rst, en,
	output reg 			co_out,			
	output reg [3:0] 	bcd_out,
	output reg [7:0] hex0_out // (dp, g, f, e, d, c, b, a)
);

	reg habConta; // pulso para habilitar contagem 
	reg [31:0] divConta;
	
	// Divisor de clock - gera pulso em habConta
	always @(posedge clk or posedge rst) begin
		if (rst)
			divConta = 32'd0;
		else begin
			if (en) begin
				if (divConta == 4999999) begin // 50e6 Hz / 5e6 = 10 Hz
					habConta = 1'b1;
					divConta = 32'd0;
				end else begin
					habConta = 1'b0;
					divConta = divConta + 1'b1;
				end
			end else
				divConta = divConta;
		end
	end

	// Contador BCD
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			bcd_out <= 4'd0;
			co_out <= 1'b0;
		end else begin
			if (en & habConta) begin
				// Contador
				if (bcd_out == 9)
					bcd_out <= 4'd0;
				else
					bcd_out <= bcd_out + 1'd1;
				// Oferflow
				if (bcd_out == 8)
					co_out <= 4'd0;
				else
					co_out <= 1'b1;				
			end 
		end
	end
	
	// Saida 7 segmentos
	always @(*) begin

		if (bcd_out == 4'd0) 
			hex0_out = 8'b11000000;
		else if (bcd_out == 4'd1) 
			hex0_out = 8'b11111001;
		else if (bcd_out == 4'd2) 
			hex0_out = 8'b10100100;
		else if (bcd_out == 4'd3) 
			hex0_out = 8'b10110000;
		else if (bcd_out == 4'd4) 
			hex0_out = 8'b10011001;
		else if (bcd_out == 4'd5) 
			hex0_out = 8'b10010010;
		else if (bcd_out == 4'd6) 
			hex0_out = 8'b10000011;
		else if (bcd_out == 4'd7) 
			hex0_out = 8'b11111000;
		else if (bcd_out == 4'd8) 
			hex0_out = 8'b10000000;
		else if (bcd_out == 4'd9) 
			hex0_out = 8'b10011000;
		else
			hex0_out = 8'b11111111;
			
	end
	
endmodule