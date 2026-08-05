/* 문제 1. HalfAdder라는 모듈을 직접 작성하시오.
조건
- 입력 A, B
- 출력 Sum, Carry
- assign만 사용 */

module HalfAdder(
    input A,
    input B,
    output Sum,
    output Carry
);

assign Sum = A ^ B;
assign Carry = A & B;

endmodule
