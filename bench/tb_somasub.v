`timescale 1ns / 1ps

module tb_somasub;

  	reg [1:0] a, b, s;
  	reg op;
  
    somasub uut ( 
      	.A(a), .B(b), .OP(op),
      	.S(s)
    );

    initial begin
      
      	$dumpfile("dump.vcd");
      	$dumpvars(0, tb_somasub);

      	// Testes de adição
      	a = 0; b = 0; op = 1; #10;
      	a = 0; b = 1; op = 1; #10;
      	a = 0; b = 2; op = 1; #10;
      	a = 0; b = 3; op = 1; #10;
      	a = 1; b = 1; op = 1; #10;
      	a = 1; b = 2; op = 1; #10;
      	a = 2; b = 0; op = 1; #10;
      	a = 2; b = 1; op = 1; #10;
      	a = 3; b = 0; op = 1; #10;
      
      	// Testes de subtração
      	a = 3; b = 0; op = 0; #10;
      	a = 3; b = 1; op = 0; #10;
      	a = 3; b = 2; op = 0; #10;
      	a = 3; b = 3; op = 0; #10;
      	a = 2; b = 0; op = 0; #10;
      	a = 2; b = 1; op = 0; #10;
      	a = 2; b = 2; op = 0; #10;
      	a = 1; b = 0; op = 0; #10;
      	a = 1; b = 1; op = 0; #10;
      	a = 0; b = 0; op = 0; #10;


    end

endmodule
