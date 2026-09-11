module mux21 (
    input  wire E0, E1, SEL,
    output reg  Y
);

    always @(*) begin
        if (SEL) begin
            Y = E1;
        end else begin
            Y = E0;
        end
    end

endmodule
