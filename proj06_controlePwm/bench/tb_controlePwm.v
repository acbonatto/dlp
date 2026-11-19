// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module tb_controlePwm;
  
  // Sinais internos 
  reg  clk, rst;
  reg  En_I, Incr_I, Decr_I;
  reg  pwm_O;
  reg [7:0] Dec0_out, Dec1_out, Dec2_out;
  
  // instancia o dut
  controlePwm u_controlePwm(
    .clk(clk), 
    .rst(rst), 
    .En_I(En_I),
    .Incr_I(Incr_I),
    .Decr_I(Decr_I),
    .pwm_O(pwm_O),
    .Dec0_out(), .Dec1_out(), .Dec2_out()
  );
  
  // gera o reset e estímulos
  initial begin
    rst = 1'b1; #10;
    rst = 1'b0; #10;
    
    En_I = 1'b1;
    
    Incr_I = 1'b1;
    #50;
    Incr_I = 1'b0;
    #50;
    
    #5000;
    
    Decr_I = 1'b1;
    #25;
    Decr_I = 1'b0;
    #25;
    
    #5000;
    
    $finish;
    
  end
  
  //gera o clock
  initial begin
    forever #5 clk = ~clk;
  end
    
  // gera forma de onda
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  
endmodule
  
  
  
  
