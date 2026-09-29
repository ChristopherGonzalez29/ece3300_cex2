`timescale 1ns / 1ps

module adder4(
    input  [3:0] a,
    input  [3:0] b,
    output [4:0] result
);

    wire c1, c2, c3;

    fulladd fa0(a[0], b[0], 1'b0, result[0], c1);
    fulladd fa1(a[1], b[1], c1,    result[1], c2);
    fulladd fa2(a[2], b[2], c2,    result[2], c3);
    fulladd fa3(a[3], b[3], c3,    result[3], result[4]);

endmodule

module fulladd(
    input  x,
    input  y,
    input  cin,
    output sum,
    output cout
);

    assign sum  = x ^ y ^ cin;
    assign cout = (x & y) | (x & cin) | (y & cin);

endmodule
