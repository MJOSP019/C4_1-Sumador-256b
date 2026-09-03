`timescale 1ns / 1ps

module adder_x8 (
    input  logic [7:0] a,
    input  logic [7:0] b,
    input  logic       cin,
    output logic [7:0] s,
    output logic       cout
);

    logic carry_4;

    // Mitad inferior: bits 0 a 3
    adder_x4 ADDER_LOW (
        .a    (a[3:0]),
        .b    (b[3:0]),
        .cin  (cin),
        .s    (s[3:0]),
        .cout (carry_4)
    );

    // Mitad superior: bits 4 a 7
    adder_x4 ADDER_HIGH (
        .a    (a[7:4]),
        .b    (b[7:4]),
        .cin  (carry_4),
        .s    (s[7:4]),
        .cout (cout)
    );

endmodule