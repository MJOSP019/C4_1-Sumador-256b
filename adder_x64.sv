`timescale 1ns / 1ps

module adder_x64 (
    input  logic [63:0] a,
    input  logic [63:0] b,
    input  logic        cin,
    output logic [63:0] s,
    output logic        cout
);

    logic carry_32;

    // Mitad inferior: bits 0 a 31
    adder_x32 ADDER_LOW (
        .a    (a[31:0]),
        .b    (b[31:0]),
        .cin  (cin),
        .s    (s[31:0]),
        .cout (carry_32)
    );

    // Mitad superior: bits 32 a 63
    adder_x32 ADDER_HIGH (
        .a    (a[63:32]),
        .b    (b[63:32]),
        .cin  (carry_32),
        .s    (s[63:32]),
        .cout (cout)
    );

endmodule