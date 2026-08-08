# 11_1강. Register & Shift Register

## 학습목표
- 여러 개의 FF를 묶어 Register를 구성하는 원리 이해
- 4-bit register의 동작 이해
- verilog에서 여러 비트를 한번에 저장하는 방법 이해
- shift register의 동작 원리 이해
- `always @(posedge clk)`와 `[3:0]`을 결합해 순차회로를 작성할 수 있다.

## 1. Register
여러 개의 FF를 묶어서 데이터를 저장하는 회로

D FF 하나는 1비트의 값을 저장
-> 4비트를 저장하고 싶으면 D FF를 4개 사용하면 된다.

## 2. 4-bit Register
input D[3:0], clk
output Q[3:0]

Clock의 상승엣지가 발생하는 순간 D를 Q에 저장한다.

## 3. Verilog로 4-bit Register 만들기

```verilog
module Register4(
    input [3:0] D,
    input clk,
    output reg [3:0] Q
);

always @(posedge clk) begin
    Q <= D;
end

endmodule
```

`input [3:0] D`
-> 4비트 데이터 입력

`output reg [3:0] Q`
-> 4비트 데이터를 저장해서 출력


## 3.1. DFF 4개를 직접 써도 된다.
```verilog
DFF FF3(
    .D(D[3]),
    .clk(clk),
    .Q(Q[3])
);

DFF FF2(
    .D(D[2]),
    .clk(clk),
    .Q(Q[2])
);

DFF FF1(
    .D(D[1]),
    .clk(clk),
    .Q(Q[1])
);

DFF FF0(
    .D(D[0]),
    .clk(clk),
    .Q(Q[0])
);
```

-> DFF+DFF+DFF+DFF

## 4. Shift Register
저장하면서 비트를 옆으로 이동시키는 register

**ex. 4-bit Shift Register**

Q[3] Q[2] Q[1] Q[0]

+ 새로운 input `Din` 이 들어옴

한번의 Clk이 들어올 때마다 
Din → Q[3] → Q[2] → Q[1] → Q[0]
처럼 이동


## 5. Verilog로 Shift Register

```verilog
module ShiftRegister4(
    input Din,
    input clk,
    output reg [3:0] Q
);

always @(posedge clk) begin
    Q <= {Din, Q[3:1]};
end

endmodule
```

### Concatenation(연결)
`{Din, Q[3:1]}`

여러 신호를 이어 붙이는 것

**ex**

A=1, B=0, C=1이면

`{A, B, C}` -> 101

`{Din, Q[3:1]}`은 Din + Q[3] + Q[2] + Q[1]을 붙인 것

새 Q[3] = Din
새 Q[2] = 기존 Q[3]
새 Q[1] = 기존 Q[2]
새 Q[0] = 기존 Q[1]


## Register와 Shift Register 비교
|Register|Shift Register|
|------|------|
|D를 그대로 저장|데이터 이동시키며 저장|
|Q<=D|Q<={Din, Q[3:1]}|
|데이터 저장|데이터 저장 + 이동|
|일반적인 저장장치|직렬 데이터 이동 등에 사용|


## 핵심
1. DFF 하나: 1 bit 저장
2. DFF 여러개 = Register
3. Register에서 데이터 이동 = Shift Register
4. Register: `Q <= D;`
5. Shift Register: `Q <= {Din, Q[3:1]};`


