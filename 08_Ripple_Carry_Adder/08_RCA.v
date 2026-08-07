//=================
//Half Adder
//=================

module HalfAdder(
    input A,
    input B,
    output Sum,
    output Carry
);

assign Sum = A ^ B;
assign Carry = A & B;

endmodule


//=================
//Full Adder
//=================

module FullAdder(
    input A,
    input B,
    input Cin,
    output Sum, 
    output Cout
);

wire Sum1;
wire Carry1;
wire Carry2;

//첫번째 HA
HalfAdder HA1(
    .A(A);
    .B(B);
    .Sum(Sum1);
    .Carry(Carry1)
);

//두번째 HA
HalfAdder HA2(
    .A(A);
    .B(B);
    .Sum(Sum),
    .Carry(Carry2)
);

//Carry OR
assign Cout = Carry1 | Carry2;

endmodule



//=================
//4-bit Ripple Carry Adder
//=================

module RippleCarryAdder4(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum,
    output Cout
);

// Carry 연결용 wire
wire C1;
wire C2;
wire C3;

//0번째 비트
FullAdder FA0(
    .A(A[0]), //HalfAdder의 A를 현재 회로의 A0에 연결
    .B(B[0]),
    .Cin(1'b0),
    .Sum(Sum[0]),
    .Cout(C1)
);

// 1번째 비트
FullAdder FA1(
    .A(A[1]),
    .B(B[1]),
    .Cin(C1),
    .Sum(Sum[1]),
    .Cout(C2)
);

// 2번째 비트
FullAdder FA2(
    .A(A[2]),
    .B(B[2]),
    .Cin(C2),
    .Sum(Sum[2]),
    .Cout(C3)
);

// 3번째 비트
FullAdder FA3(
    .A(A[3]),
    .B(B[3]),
    .Cin(C3),
    .Sum(Sum[3]),
    .Cout(Cout)
);

endmodule