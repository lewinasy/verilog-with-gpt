# 09강. Decoder / Encoder / MUX

## 학습목표
- Decoder, Encoder, MUX의 동작 원리 이해
- Verilog로 Decoder, Encoder 구현

## 1. Decoder란?
n비트 입력을 받아 2^{n} 개의 출력 중 하나만 1로 만드는 회로
-> 입력 번호를 선택해서 해당 출력만 켜주는 회로

**ex**
input A, B
output Y0, Y1, Y2, Y3

### truth table
|A|B|Y3|Y2|Y1|Y0|
|------|------|------|------|------|------|
|0|0|0|0|0|1|
|0|1|0|0|1|0|
|1|0|0|1|0|0|
|1|1|1|0|0|0|

## 2. Verilog로 Decoder 구현하기

가장 쉬운 방법: **always + case**

```verilog
module Decoder2to4(
    input [1:0] A,
    output reg [3:0] Y
);

always @(*) begin
    case(A)

        2'b00: Y = 4'b0001;
        2'b01: Y = 4'b0010;
        2'b10: Y = 4'b0100;
        2'b11: Y = 4'b1000;
    
    endcase
end

endmodule
```

### 새로운 문법: case
신호의 값에 따라 여러 경우를 처리하는 문법
if보다 경우의 수가 많아질 때 사용

`case(...)`

**ex**
```verilog
case(A)

00

01

10

11

endcase
```
-> 4가지 경우(00, 01, 10, 11)를 처리


```verilog
if(sel)
else
```

-> 2가지 경우(1이거나 0이거나)를 처리


### 새로운 문법: 2'b01

**2'b01**

2: 2비트
b: 2진수(binary)
01: 01


**4'b0001**

4: 4비트
b: 2진수
0001: 0001


## 3. Encoder

여러 개의 입력을 작은 비트수로 압축

input: Y0, Y1, Y2, Y3
output: A

### truth table
|Y3|Y2|Y1|Y0|A|
|------|------|------|------|------|
|0|0|0|1|00|
|0|0|1|0|01|
|0|1|0|0|10|
|1|0|0|0|11|


## 4. Verilog로 Encoder 구현

```verilog

module encoder4to2(
    input [3:0] Y,
    output reg [1:0] A
);

always @(*) begin

    case(Y)

        4'b0001: A = 2'b00;
        4'b0010: A = 2'b01;
        4'b0100: A = 2'b10;
        4'b1000: A = 2'b11;

    endcase

end

endmodule
```

## Decoder와 Encoder 차이
|Decoder|Encoder|
|------|------|
|입력 적음|입력 많음|
|출력 많음|출력 적음|
|번호 -> 출력 선택|출력 -> 번호 압축|

## Decoder와 MUX 차이
**Decoder** : 출력을 선택 / 입력 -> 출력 하나만 ON
**MUX** : 입력을 선택 / 입력이 여러개 -> 그 중 하나만 출력 (sel)


## 핵심정리
- Decoder는 입력 하나 -> 출력 하나만 활성화
- Encoder는 활성화된 입력 -> 이진수로 변환
- case문은 경우의 수가 많을 때 사용
- 2'b01은 2비트 이진수 01 의미
- Decoder는 출력을 선택, MUX는 입력 선택

