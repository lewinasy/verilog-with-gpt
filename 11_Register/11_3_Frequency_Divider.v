
module FrequencyDivider(
    input clk,
    output reg clk_div
);

always @(posedge clk) begin
    clk_div <= ~clk_div;
end

endmodule