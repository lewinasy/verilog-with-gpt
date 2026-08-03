module MUX2(
    input a,
    input b,
    input sel,
    output reg y //y가 always 블록에서 값을 대입받으므로 output reg로 선언!!
);

always@(*) begin
    if(sel) //sel = 1이면 입력 a를 출력으로 선택
        y=a;
    else
        y=b;
end

endmodule //module 시작했으니 endmodule해줘야함!! **MUX2 module 종료** 