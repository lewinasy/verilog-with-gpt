# 07강. Full Adder 구현과 Module Instantiation

## 학습목표
- Full Adder의 내부 구조를 설명할 수 있다.
- Module Instatiation 문법을 이해할 수 있다.
- 이미 만든 HalfAdder를 이용해 FullAdder를 구현할 수 있다.
- Structural Modeling의 장점을 설명할 수 있다.

### Review
Sum = A ^ B
Carry = A AND B

# Full Adder를 만들어보자!!
- Full Adder는 Cin을 처리할 수 있음
- 1비트 처리기

A B Cin -> [ Full Adder ] -> Sum Cout
**HalfAdder를 두개 사용한다.**

### 첫번째 HA: A + B = Sum1
input: A, B
output: **Sum1**, Carry1


### 두번째 HA: (Sum1 + Cin = Sum)
input: **Sum1**, Cin
output: Sum, Carry2
(Sum1 = A + B)

### 마지막
input: Carry1, Carry2
OR
output: Cout

### ex
A = 1, B = 1, Cin = 0 

**첫번째** sum1 = 0, Carry1 = 1

**두번째** sum = 0, Carry2 = 0

Cout = 1

---
## Verilog에서
```verilog
wire Sum1;
wire Carry1;
wire Carry2;
```

HA1와 HA2를 연결하는 전선이 필요하므로 `wire` 사용
- assign으로 값을 만드는 것도 아니고
- always로 값을 저장하는 것도 아니다.

## 첫번째 HA
```verilog
HalfAdder HA1(
    .A(A),
    .B(B),
    .Sum(Sum1),
    .Carry(Carry1)
);
```

HalfAdder를 하나 가져와서 이름을 HA1라고 붙인다.

## 두번째 HA
```verilog
HalfAdder HA2(
    .A(Sum1),
    .B(Cin),
    .Sum(Sum),
    .Carry(Carry2)
);
```

`.A(Sum1)`
- 첫번째 HA의 출력이 두번째 HA의 입력으로 들어간다.
- 회로 연결!

## 마지막 Carry
OR Gate 하나만 추가.

`assign Cout = Carry1 | Carry2`


---

## Structural Modeling의 장점
XOR, AND, OR를 하나하나 연결하는 것이 아니라 
HalfAdder라는 부품을 이미 만들어두었기 때문에
점점 큰 회로를 쉽게 만들 수 있다.


---
## 핵심 정리
- Module은 다른 Module 안에서 사용할 수 있다.
- 내부 연결 신호는 wire를 사용한다.
- FullAdder는 HalfAdder 두개와 OR Gate 하나로 구현한다.
- Structural Modeling은 회로를 조립하는 방식이다.