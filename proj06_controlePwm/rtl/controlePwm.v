// Controle de saída PWM com incremento e decremento do 
// duty-cycle, feito através de um contador de 8-bits.
//
// Prof. Bonatto - IFRS
//
//---------------------------------------------------------------------
// Módulo topo
//---------------------------------------------------------------------
module controlePwm (
  input  clk, rst, 
  input  En_I, Incr_I, Decr_I,
  output [9:0] led_out,
  output       dc_motor_p_out, dc_motor_n_out,
  output [7:0] Dec0_out, Dec1_out, Dec2_out
);
  
  // Sinais internos
  parameter C_PRESCALER = 8'd2;
  wire [7:0] duty;
  wire pwm_reg;
  
  // Coneta os módulos
  pwm u_pwm(
  	 .clk(clk), 
  	 .rst(rst), 
  	 .Prescaler_I(C_PRESCALER),
    .Duty_I(duty),
    .pwm_O(pwm_reg)
  );

  contadorIncrDecr8bit u_contadorIncrDecr8bit(
	.clk(clk), .rst(rst), .en(En_I),
	.incr(Incr_I), 
	.decr(Decr_I),
	.duty(duty)
  );
	
  // Modulo decodificador binário 8-bits para BCD 3 dígitos
  decBinBCD3dig u_decBinBCD3dig(
    .bin_in(duty),
    .led_out(), // não conectado
    .dec0_out(Dec0_out),
    .dec1_out(Dec1_out),
    .dec2_out(Dec2_out)
  );

  // Saida para os 10 LEDs
  assign led_out = {10{pwm_reg}};
  
  // Saida para o motor
  assign dc_motor_p_out = pwm_reg;
  assign dc_motor_n_out = 1'b0;
  
endmodule
