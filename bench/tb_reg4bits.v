`timescale 1ns / 1ps

module tb_reg4bits;

  reg [3:0] Data_I, Data_O;
  reg 		Clk=0, Rst=1;
  
  reg4bits dut ( 
    .Clk(Clk),
    .Rst(Rst),
    .Data_I(Data_I),
    .Data_O(Data_O) 
  );

  initial begin
      
    $dumpfile("dump.vcd"); 
    $dumpvars();

    Rst = 0; #20;
    Rst = 1; #12.5;
    
	Data_I = 4'h0; #10;
    Data_I = 4'd3; #10;    
    Data_I = 4'd5; #10;
    
    Rst = 0; #2.5;
    Rst = 1;
    
	Data_I = 4'b0110; #10;
	Data_I = 4'hF; #10;
    
    $finish;
    
  end 
   
  initial begin
  	forever #5 Clk = ~Clk;
  end

endmodule
