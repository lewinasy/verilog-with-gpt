# 08강. Ripple Carry Adder (4-bit Adder)

## 학습목표
- Ripple Carry Adder(RCA) 이해
- 4개의 Full Adder를 연결하여 4-bit Adder 구성
- Carry가 다음 Full Adder로 전달되는 과정 이해
- 여러 module을 이용하여 큰 회로를 설계하는 과정 이해

## 1. Ripple Carry Adder(RCA)

Full Adder는 1비트만 계산하기 때문에,
Full Adder를 여러개 붙여서 n비트 덧셈 계산을 할 수 있다.

Carry가 FA0 -> FA1 -> FA2 -> FA3로 차례대로 연결된다.

### ex

1011 + 0110

오른쪽부터 계산, LSB -> MSB

**FA0**

1 + 0 + Cin(0)
-> Sum0 = 1
-> Carry0 = 0

**FA1**

1 + 1 + Carry0
-> Sum = 0
-> Carry1 = 1

**FA2**

0 + 1 + Carry1
-> Sum = 0
-> Carry2 = 1

**FA3**

1 + 0 + Carry2
-> Sum = 0 
-> Cout = 1




 ## 2. Verilog에서

 ### 입출력

 ```verilog
 module Adder4(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum,
    output Cout
 );
```

`input [3:0] A;`
-> A가 4비트 입력
(A3, A2, A1, A0을 한번에 묶어서 표현)

ex. A=1011
A[3] = 1
A[2] = 0
A[1] = 1
A[0] = 0


### Carry용 wire
```verilog
wire C1;
wire C2;
wire C3;
```

Carry는
Cin -> C1 -> C2 -> C3 -> Cout
으로 전달되기 때문에 wire가 세개


### 첫번째 FullAdder
```verilog
FullAdder FA0(
    .A(A[0]),
    .B(B[0]),
    .Cin(1'b0),
    .Sum(Sum[0]),
    .Cout(C1)
);
```

`A[0]` -> A의 가장 오른쪽 비트


### 두번째 FullAdder
```verilog
FullAdder FA1(
    .A(A[1]),
    .B(B[1]),
    .Cin(C1),
    .Sum(Sum[1]),
    .Cout(C2)
);
```

`.Cin(C1)` -> FA0에서 나온 Carry가 FA1의 입력으로 들어감