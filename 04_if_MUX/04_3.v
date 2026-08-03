module MUX(
    input a,
    input b,
    input sel,
    output output reg y 
);

always@(*) begin
    if(sel)
        y = a | b;
    else   
        y = a & b;
end

endmodule