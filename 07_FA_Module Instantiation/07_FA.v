//HalfAdder

module HalfAdder(
    input A,
    input B,
    output Sum,
    output Carry
);

assign Sum = A ^ B;
assign Carry = A & B;

endmodule

//FullAdder

module FullAdder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

//내부 연결용 전선: HA1과 HA2를 연결하기 위한 전선
wire Sum1;
wire Carry1;
wire Carry2;

//첫번째 HalfAdder: A+B
HalfAdder HA1(
    .A(A),
    .B(B),
    .Sum(Sum1),
    .Carry(Carry1)
);

//두번째 HalfAdder: (A+B)의 Sum + Cin 계산
HalfAdder HA2(
    .A(Sum1),
    .B(Cin),
    .Sum(Sum),
    .Carry(Carry2)
);

//최종 Carry
assign Cout = Carry1 | Carry2;

endmodule

