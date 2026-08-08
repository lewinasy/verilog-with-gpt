module Counter4(
    input clk,
    output reg [3:0] Q
);

always @(posedge clk) begin
    Q <= Q + 4'b0001;
end

endmodule