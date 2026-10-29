// Contador binario de 8 bits com entradas de incremento e decremento

module contadorIncrDecr8bit (
	input wire clk, rst, en,
	input wire incr, decr,
	output wire [9:0] led_out,
	output wire [7:0] dec0_out,
	output wire [7:0] dec1_out,
	output wire [7:0] dec2_out	
);

	// sinais internos
	reg [7:0] conta_reg;
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
	
	// Contador
	always @(posedge clk or posedge rst) begin
		if (rst) 
			conta_reg = 0;
		else if (habConta) begin
			if (incr==1'b1 & decr==1'b0)
				conta_reg = conta_reg + 1;
			else if (incr==1'b0 & decr==1'b1)
				conta_reg = conta_reg - 1;
			else
				conta_reg = conta_reg;
		end
	end

	// Modulo decodificador binário 8-bits para BCD 3 dígitos
	decBinBCD3dig u_decBinBCD3dig(
		.bin_in(conta_reg),
		.led_out(led_out),
		.dec0_out(dec0_out),
	   .dec1_out(dec1_out),
		.dec2_out(dec2_out)
	);

endmodule
