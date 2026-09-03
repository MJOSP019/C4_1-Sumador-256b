`timescale 1ns / 1ps

module adder_x128 (
    input  logic [127:0] a,
    input  logic [127:0] b,
    input  logic         cin,
    output logic [127:0] s,
    output logic         cout
);

    logic carry_64;

    // Mitad inferior: bits 0 a 63
    adder_x64 ADDER_LOW (
        .a    (a[63:0]),
        .b    (b[63:0]),
        .cin  (cin),
        .s    (s[63:0]),
        .cout (carry_64)
    );

    // Mitad superior: bits 64 a 127
    adder_x64 ADDER_HIGH (
        .a    (a[127:64]),
        .b    (b[127:64]),
        .cin  (carry_64),
        .s    (s[127:64]),
        .cout (cout)
    );

endmodule