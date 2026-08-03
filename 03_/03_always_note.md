# 03강: always, wire, reg의 기초

## 학습목표
- assign과 always의 차이
- wire, reg 이해하기
- always @(*)가 어떤 회로를 만드는지 이해하기

## 1. always의 진짜 의미

`always @(*)`

*: 사용된 모든 입력 신호

```verilog
always @(*) begin
    y = a & b;
end
```
과
`always @(a or b)`
는 같은 의미

-> **a나 b가 바뀌면 다시 계산하라**

assign: 간단한 연결
always @(*): 복잡한 조합 논리

## 2. wire
`wire t;`
- 그냥 전선
- 저장하지 않음, 전선을 따라 신호가 전달될 뿐

ex. 
```verilog
wire t;

assign t = a & b;
assign y = t | c;
```

- t는 중간 전선의 이름

## 3. reg
`reg y;`
- **reg는 always 블록 안에서 값을 대입받을 수 있는 변수형이다.**
- always가 값을 쓰는 대상은 reg타입이라고 약속한 것

**ex3-1.**
```verilog
reg y;

always @(*) begin
    y = a & b;
end
```
-> y를 always 안에서 바꾸므로 reg로 선언해야한다.
- reg를 썼다고 해서 메모리가 생기는 것은 아니다!! 
    - (플립플롭이 만들어지지 않는다.)
- 플립플롭은 posedge clk 같은 클록기반 always 블록에서 생성된다.

**ex3-2.**
```verilog
wire y;

assign y = a & b;
```
->에서는 wire를 사용한다.

# 핵심정리
| 문법 | 의미 |
|------|------|
| assign | 간단한 조합논리 연결 |
| always @(*) | 조합논리 기술 |
| wire | 전선 |
| reg | always 안에서 값을 저장할 수 있는 변수(memory와는 다름) |


### 문법 규칙
| 어디서 값을 대입하는가? | 출력 타입 |
|------|------|
| assign | wire |
| always | reg |

assign은 wire를 구동하는 문법이다.
always에서 값을 대입받는 대상은 reg 타입이어야 한다.