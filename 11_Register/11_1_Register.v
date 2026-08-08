module Register4(
    input [3:0] D,
    input clk,
    output reg [3:0] Q
);

always @(posedge clk) begin
    Q <= D;
end
endmodule