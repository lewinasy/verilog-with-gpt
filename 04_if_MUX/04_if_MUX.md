# 04강. Behavioral Modeling - if, case와 Multiplexer

## 학습목표
- if문이 실제로 어떤 회로를 만드는지 설명할 수 있다.
- case문의 역할을 이해할 수 있다.
- MUX의 동작 원리를 이해한다.
- 2:1 MUX를 Verilog로 설계할 수 있다.

## 1. MUX(Multiplexer)
**여러 입력 중 하나를 선택해서 출력하는 회로**

입력 2개(a, b)
sel = 0 -> b출력
sel = 1 -> a출력

**code**
```verilog
always @(*) begin
    if(sel)
        y = a;
    else 
        y = b;
end
```
sel이 1이면 a를 연결하고
sel이 0이면 b를 연결한다.

### if가 MUX가 되는 이유
if는 조건문이 아니라, **조건에 따라 입력을 선택하는 회로**를 의미한다.

```verilog
if(sel)
    y = a;
else 
    y = b;
```
-> 컴파일러는 **2개의 입력 중 하나를 선택하는 회로**라고 생각한다. = **MUX**

### 왜 always@(*) 안에서 쓰는지
always@(*): 입력이 바뀌면 즉시 다시 계산한다.
기억하는 것이 아니라 선택만 한다.

### 흔히 하는 실수
**조합논리에서는 모든 경우를 반드시 작성해야한다.**
-> 모든 경우에 출력을 정해주지 않으면 Latch(기억장치)가 될 수 있다.

```verilog
always @(*) begin
    if(sel)
        y = a;
end
```

`sel=0` 일떄의 값이 나와있지 않음
-> 컴파일러는 이전 값을 유지해야한다고 해석할 수도 있음

## 핵심정리
- MUX는 여러 입력 중 하나를 선택하는 회로이다.
- Verilog의 if는 MUX를 설계하는 데 자주 사용된다.
- always @(*) 안에서는 모든 경우의 출력을 작성해야한다.
