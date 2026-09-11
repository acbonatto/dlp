`timescale 1ns / 1ps

module tb_full_adder;

    reg [3:0] a, b;
    reg ci;
    wire [3:0] s;
    wire co;

    full_adder uut ( 
		.a(a), .b(b), .ci(ci),
      .s(s), .co(co)
    );

    initial begin
    	  
    	$dumpfile("dump.vcd");
        $dumpvars(0, tb_full_adder);

        $monitor ("a=%d, b=%d, ci=%d, s=%d, co=%d", a, b, ci, s, co);
        a = 2; b = 4'd5; ci = 0; #10;	// s = 7
        a = 4'd2; b = 4'd5; ci = 1; #10;	// s = 8
        a = 4'd8; b = 4'd7; ci = 0; #10;	// co=0 s=15
        a = 4'd8; b = 4'd8; ci = 1; #10;	// co=1 s=0

    end

endmodule
