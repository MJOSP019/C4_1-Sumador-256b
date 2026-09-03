`timescale 1ns / 1ps

module adder_x4 (
    input  logic [3:0] a,
    input  logic [3:0] b,
    input  logic       cin,
    output logic [3:0] s,
    output logic       cout
);

    logic carry_2;

    // Bloque inferior: bits 0 a 1
    adder_x2 ADDER_LOW (
        .a    (a[1:0]),
        .b    (b[1:0]),
        .cin  (cin),
        .s    (s[1:0]),
        .cout (carry_2)
    );

    // Bloque superior: bits 2 a 3
    adder_x2 ADDER_HIGH (
        .a    (a[3:2]),
        .b    (b[3:2]),
        .cin  (carry_2),
        .s    (s[3:2]),
        .cout (cout)
    );

endmodule