# 05강. Half Adder

## 학습목표
- Half Adder의 동작 원리
- Half Adder의 진리표 작성
- Half Adder의 Verilog 구현


## 1. 컴퓨터가 덧셈을 하는 방법
**Half Adder의 출력은 두 개**

### Sum
현재 자리의 결과

### Carry
다음 자리로 넘길 올림수

ex.
1 + 1 = 10
-> sum: 0, carry: 1

## 2. Half Adder의 진리표

|A|B|Sum|Carry|
|------|------|------|------|
|0|0|0|0|
|0|1|1|0|
|1|0|1|0|
|1|1|0|1|

### Half Adder는 XOR 하나 + AND 하나로 만들어진다.
-> Sum의 진리표는 **XOR Gate**의 진리표와 같다.
-> Carry의 진리표는 **AND Gate**의 진리표와 같다.



## 3. Behavioral Modeling 구현

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

---
### 핵심 정리
- HalfAdder는 1비트 덧셈기
- 출력은 Sum, Carry 두개이다.
    - Sum = COR
    - Carry = AND
- Verilog에서는 assign만으로 구현할 수 있음


