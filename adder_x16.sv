`timescale 1ns / 1ps

module adder_x16 (
    input  logic [15:0] a,
    input  logic [15:0] b,
    input  logic        cin,
    output logic [15:0] s,
    output logic        cout
);

    logic carry_8;

    // Mitad inferior: bits 0 a 7
    adder_x8 ADDER_LOW (
        .a    (a[7:0]),
        .b    (b[7:0]),
        .cin  (cin),
        .s    (s[7:0]),
        .cout (carry_8)
    );

    // Mitad superior: bits 8 a 15
    adder_x8 ADDER_HIGH (
        .a    (a[15:8]),
        .b    (b[15:8]),
        .cin  (carry_8),
        .s    (s[15:8]),
        .cout (cout)
    );

endmodule