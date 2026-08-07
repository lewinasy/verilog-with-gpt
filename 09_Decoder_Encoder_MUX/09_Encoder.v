//======================
//4-to-2 Encoder
//======================

module Encodre4to2(
    input [3:0] Y,
    output reg [1:0] A
);

always @(*) begin
    case(Y)

        4'0001 : A = 2'b00;
        4'0010 : A = 2'b01;
        4'0100 : A = 2'b10;
        4'1000 : A = 2'b11;
    endcase
end
endmodule

