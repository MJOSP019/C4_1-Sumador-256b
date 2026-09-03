`timescale 1ns / 1ps

module adder_x256 (
    input  logic [255:0] a,
    input  logic [255:0] b,
    input  logic         cin,
    output logic [255:0] s,
    output logic         cout
);

    logic carry_128;

    // Mitad inferior: bits 0 a 127
    adder_x128 ADDER_LOW (
        .a    (a[127:0]),
        .b    (b[127:0]),
        .cin  (cin),
        .s    (s[127:0]),
        .cout (carry_128)
    );

    // Mitad superior: bits 128 a 255
    adder_x128 ADDER_HIGH (
        .a    (a[255:128]),
        .b    (b[255:128]),
        .cin  (carry_128),
        .s    (s[255:128]),
        .cout (cout)
    );

endmodule