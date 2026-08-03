module MUX4_2(
    input a,
    input sel,
    output reg Y
);

always@(*) begin
    if(sel)
        Y = 0;
    else
        Y = a;
end

endmodule