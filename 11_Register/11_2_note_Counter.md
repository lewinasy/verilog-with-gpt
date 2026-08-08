# 11_2강. Counter

## 학습목표
- Counter의 동작 원리 이해
- Clock에 따라 상태가 순차적으로 변하는 과정
- 4bit counter의 동작 이해
- verilog에서 <=를 이용해 다음 상태를 만드는 방법 이해
- register와 counter의 차이 이해

## 1. Counter
숫자를 세는 회로

**ex. 4bit counter**
0000 -> 0001 -> 0010 -> 0011 -> 0100 -> 0101 -> ... -> 1111 -> 0000
표현할 수 있는 값: 0~15

### Counter도 결국 register다.
기존 Register: D -> Register -> Q
**Counter**: 현재 Q -> +1 -> 다음 Q

`Q <= Q + 1;`

현재 상태 Q를 가지고 다음 상태를 계산하고,
그걸 다시 Register에 저장하는 구조

현재 상태 -> 다음 상태 계산 -> Clock -> 새로운 상태 저장


### Register와 Counter 비교

1. Register
```verilog
always @(posedge clk) begin
    Q <= D;
end
```
-> 외부에서 들어온 D를 저장함

2. Counter
```verilog
always @(posedge clk) begin
    Q <= Q + 1;
end
```

-> 자기 자신의 현재 값에서 1을 더한 값을 다시 저장
Counter는 데이터를 계속 유지하면서 바꾼다.


## 2. Verilog로 4-bit Counter 구현하기

```verilog
module Counter4(
    input clk,
    output reg [3:0] Q
);

always @(posedge clk) begin
    Q <= Q + 1;
end
endmodule
```

### Overflow
1111 + 0001 => 10000
`reg [3:0] Q` 4비트밖에 없기 때문에
MSB의 1은 저장할 수 없어서 0000으로 돌아올 수 있다.


## 2.1. 조금 더 실제적인 Counter 만들기
```verilog
module Counter4(
    input clk,
    output reg [3:0] Q
);

always @(posedge clk) begin
    Q <= Q + 1'b1;
end
endmodule
```

`1'b1` -> 1비트짜리 2진수 1


## 3. Counter 멈추기
```verilog
module Counter4(
    input clk,
    input enable,
    output reg [3:0] Q
);

always @(posedge clk) begin
    if(enable)
        Q <= Q + 1'b1
end

endmodule
```

-> enable = 1이면 Q -> Q + 1
-> enable = 0이면 그대로


## 핵심 정리
counter는 clock이 들어올 때마다 현재 상태를 다음 숫자로 바꾸어 저장하는 sequential logic이다.

```verilog
always @(posedge clk) begin
    Q <= Q + 1;
end
```
