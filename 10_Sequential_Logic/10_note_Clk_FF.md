# 10강. Sequential Logic - Clock & Flip-Flop

## 학습목표
- Combinational Logic과 Sequential Logic의 차이 이해
- Clock의 역할 이해
- Filp-Flop이 왜 memory를 갖는지 이해
- D Flip-Flop의 동작 원리 이해
- `always @(posedge clk)` 문법 이해
- 지금까지 배운 `reg`와 실제 memory의 관계 정리

## 0. Combinational Logic
지금까지 만든 회로는 combinational logic
현재 입력만보고 현재 출력을 결정함

**현재 입력 -> 회로 -> 현재 출력**

## 1. Sequential Logic

**입력 -> 회로 -> 출력 <- 과거의 상태**

현재 입력뿐만 아니라 과거에 저장해둔 값도 결과에 영향을 줌
-> memory(기억) 기능

ex
a. 어떤 회로가 현재 1을 저장 중
b. 입력이 갑자기 0으로 바뀜
c. 저장된 값까지 바로 0으로 바뀌면 안됨!!
d. **특정한 순간에 새로운 값을 저장** <- Sequential Logic


## 2. Clock
회로가 "지금!"이라고 판단할 수 있게 해주는 기준 신호
보통 0과 1이 바뀌며 반복

**Rising edge(posedge)**: 0 -> 1로 바뀌는 순간

**negdege**: 1 -> 0으로 바뀌는 순간


## 3. D Filp-Flop
Clock이 올라가는 순간 **D의 값을 저장**하는 1비트 메모리

input: D, clk
output: Q

**Ex(posedge)**
D = 1, Clk = 0 -> Q는 그대로 0
D = 1, Clk = **0 -> 1** -> Q = 1
D = 0, Clk = 1 -> 0 -> Q = 1 


## 4. memory

`reg`은 always 블록 안에서 값을 대입받는 변수형이고,
memory기능은 없으며 clk으로 memory가 생긴다.

-> `reg`자체가 memory를 만드는 것은 아니다.

```verilog
reg Q;

always @(*) begin
    Q = D;
end
```

-> Clock이 없으므로, 
    reg만 보고 기억 기능이 있다고 생각하지 말자.


## 5. Verilog로 D Flip-Flop 만들기

```verilog
module DFF(
    input D,
    input clk,
    output reg Q
);

always @(posedge clk) begin
    Q <= D;
end

endmodule
```

### `output reg Q`
: Q는 always 블록 안에서 값을 대입받기 때문에 reg로 선언

reg라서 기억하는 게 아니라,
always @(posedge clk)에 의해 clock edge에 맞춰 값을 저장하는 동작을 기술했기 때문에
FF라는 Memory element가 만들어지는 것이다.

### `always @(posedge clk)`
: Clock이 0 -> 1로 변하는 순간마다 이 블록을 실행한다.

### Q <= D
: 그 순간 D의 값을 Q에 저장한다.

<=: Non-blocking Assignment
sequential logic에서는 =보다 <=을 사용한다.


## 핵심 내용
- D Flip-Flop은 Clock의 특정 edge에서 D의 값을 저장하는 1비트 메모리
- reg가 Memory를 만드는 게 아니라, clk에 동기화된 순차논리구조가 memory를 만든다.
- D는 저장할 값, Clk은 저장할 타이밍, Q는 저장된 값

