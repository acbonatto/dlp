`timescale 1ns / 1ps

module tb_regSoma4bits;

  reg [3:0] Data_A, Data_B, Data_O;
  reg 		Clk, Rst;
  
  regSoma4bits dut ( 
    .Clk(Clk),
    .Rst(Rst),
    .Data_A(Data_A),
    .Data_B(Data_B),
    .Data_O(Data_O) 
  );

  initial begin
      
    $dumpfile("dump.vcd"); 
    $dumpvars();

    Rst = 0; #20;
    Rst = 1; #12.5;
    
	Data_A = 2; Data_B = 4; #10;
    
    $finish;
    
  end 
   
  always #5 Clk = ~Clk;

endmodule
