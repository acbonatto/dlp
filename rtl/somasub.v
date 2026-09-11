module somasub (
  input wire [1:0] A, B, 
  input wire OP,
  output reg [1:0] S
);

    always @(*) begin
      if (OP) begin
            S = A + B;
        end else begin
            S = A - B;
        end
    end

endmodule
