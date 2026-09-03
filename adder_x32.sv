`timescale 1ns / 1ps

module adder_x32 (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic        cin,
    output logic [31:0] s,
    output logic        cout
);

    logic carry_16;

    // Mitad inferior: bits 0 a 15
    adder_x16 ADDER_LOW (
        .a    (a[15:0]),
        .b    (b[15:0]),
        .cin  (cin),
        .s    (s[15:0]),
        .cout (carry_16)
    );

    // Mitad superior: bits 16 a 31
    adder_x16 ADDER_HIGH (
        .a    (a[31:16]),
        .b    (b[31:16]),
        .cin  (carry_16),
        .s    (s[31:16]),
        .cout (cout)
    );

endmodule