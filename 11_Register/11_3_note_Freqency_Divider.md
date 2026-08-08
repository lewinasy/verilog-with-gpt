# 11.3강. Frequency Divider

## 학습목표
- Frequency Divider의 개념 이해
- counter이용, clk의 주파수를 낮추는 원리 이해
- Counter와 Frequency Divider의 관계
- Verilog로 간단한 Frequency Divider 구현

## 1. Frequency Divider
주파수를 나누는 회로
-> 빠른 clk을 받아 더 느린 clk을 만들어내는 회로

실제 디지털 시스템에서는 clk가 상당히 빠를 수 있음
그런데 그 모든 회로를 그 빠른 clk으로 동작시키고 싶지 않을 수 있음

counter가 빠른 clk을 세면서 일정한 속도의 신호를 만들어낼 수 있는 것.

### counter가 Frequency Divider가 되는 이유
```verilog
always @(posedge clk) begin
    Q <= Q + 1;
end
```

Q[0]은 0 1 0 1 0 1 0 1
Q[1]은 0 0 1 1 0 0 1 1 
Q[2]는 0 0 0 0 1 1 1 1
...
원래 Clock보다 절반, 4분의1, ,,, 의 주파수로 변함

f_out = f_clk / 2
f(Q[1]) = f_clk / 4
f(Q[2]) = f_clk / 8

-> Counter의 각 비트가 자연스럽게 Frequenct Divider 역할

## 2. Verilog에서는?
counter:

```verilog
module Counter4(
    input clk,
    output reg [3:0] Q
);

always @(posedge clk) begin
    Q <= Q + 4'b0001;
end
endmodule
```

Q[0]을 출력으로 사용한다면 -> clk보다 2배 느린 신호

## 3. 간단한 Frequency Divider 코드
```verilog
module FrequencyDivider(
    input clk,
    output reg clk_div
);

always @(posedge clk) begin
    clk_div <= ~clk_div;
end
endmodule
```

`clk_div <= ~clk_div` : clk_div를 반전시키는 것

clk의 상승엣지마다 한번씩 반전되므로
입력 clk의 절반 주파수가 된다.


## 4. Counter 방식과 Toggle 방식

### /2 Frequenct Divider
```verilog
always @(posedge clk) begin
    clk_div <= ~clk_div;
end
```
-> clk마다 출력 반전
-> f_clk / 2

### Counter 이용한 분주
```verilog
always @(posedge clk) begin
    Q <= Q + 1'b1;
end
```
-> Counter의 각 비트를 이용


## 오늘의 핵심
counter의 각 비트는 서로 다른 속도로 toggle되기 때문에
frequency divider로 사용할 수 있다.
