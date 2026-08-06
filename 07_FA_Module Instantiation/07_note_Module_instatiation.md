# 07.5강. Module Instatiation

## 학습목표
- module과 instance의 차이
- HalfAdder HA1(...)
- .A(A) 문법 읽기
- wire가 왜 필요한지
- FullAdder를 처음부터 직접 작성하기


## 1. Module은 설계도다

```verilog
module HalfAdder(
    input A,
    input B,
    output Sum,
    output Carry
);

assign Sum = A ^ B;
assign Carry = A & B;

endmodule
```

HalfAdder라는 회로를 어떻게 만드는지 적어놓은 설계도
-> 회로를 만든 게 아니라, 가구 설명서를 만든 느낌

## 2. Instance는 실제 제품이다.

```verilog
HalfAdder HA1(
    ...
);
```
-> HA1이라는 이름의 HalfAdder를 새로 만든다.

## 4. .A(x)
HalfAdder 안에 있는 A포트에 현재 모듈의 x를 연결한다.

## 5. wire가 필요한 이유

`wire Sum1;`

HA1의 출력을 HA2의 입력으로 연결하는 전선


