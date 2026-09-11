module reg4bits (
  input [3:0] 		Data_I,
  input 			Clk, Rst,
  output reg [3:0] 	Data_O
);

  always @( posedge Clk or negedge Rst ) begin
    
    if (~Rst)
      Data_O <= 4'd0;
    else
      Data_O <= Data_I;
    
  end
  
endmodule
