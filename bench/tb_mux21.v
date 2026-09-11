`timescale 1ns / 1ps

module tb_mux21;

    reg  e0, e1, sel, y;

    mux21 uut ( 
      .E0(e0), .E1(e1), .SEL(sel),
      .Y(y)
    );

    initial begin
      
      	$dumpfile("dump.vcd");
        $dumpvars(0, tb_mux21);

        e0 = 0; e1 = 0; sel = 0; #10;
        e0 = 0; e1 = 1; sel = 0; #10;
        e0 = 1; e1 = 0; sel = 0; #10;
        e0 = 1; e1 = 1; sel = 0; #10;
        e0 = 0; e1 = 0; sel = 1; #10;
        e0 = 0; e1 = 1; sel = 1; #10;
        e0 = 1; e1 = 0; sel = 1; #10;
        e0 = 1; e1 = 1; sel = 1; #10;
      

    end

endmodule
