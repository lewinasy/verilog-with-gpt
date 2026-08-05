# 06강. Structural Modeling과 Full Adder

## 학습목표
- Structural Modeling이란?
- Full adder란?
- Carry In(Cin)의 의미
- Instantiation

## 1. Full Adder
Half Adder로는 1비트 덧셈만 가능하기 때문에,
Full Adder가 필요하다.

### Input 3개
A
B
**Cin**: Carry In, 이전 자리에서 넘어온 Carry

### Output 2개
Sum
Carry out(Cout)

## 2. HalfAdder의 verilog 표현
```verilog
HalfAdder HA1(
    .A(A),
    .B(B),
    .Sum(Sum1),
    .Carry(Carry1)
);
```

### .A(input1)
모듈 안의 포트 <- 현재 모듈의 신호
HalfAdder 안에 있는 A 포트에 현재 모듈의 input1을 연결한다.

### Instatiation(인스턴스화)
HalfAdder 하나를 가져와서 HA1이라는 이름으로 사용한다.
`HalfAdder HA1(...)`


---
## 3. Structural Modeling
이미 만든 Module을 다른 Module 안에서 부품처럼 사용하는 설계 방식

---
## 핵심 정리
- HalfAdder는 Carry 입력이 없다.
- FullAdder는 Cin 입력이 있다.
- FullAdder는 HalfAdder 두개와 OR 게이트 하나로 만들 수 있다.
- 이미 만든 Module을 조립하는 것이 Structural Modeling이다.