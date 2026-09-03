`timescale 1ns / 1ps

module adder_x2 (
    input  logic [1:0] a,
    input  logic [1:0] b,
    input  logic       cin,
    output logic [1:0] s,
    output logic       cout
);

    logic carry_1;

    // Bit menos significativo (Bit 0)
    adder_x1 FA0 (
        .a    (a[0]),
        .b    (b[0]),
        .cin  (cin),
        .s    (s[0]),
        .cout (carry_1)
    );

    // Bit más significativo (Bit 1)
    adder_x1 FA1 (
        .a    (a[1]),
        .b    (b[1]),
        .cin  (carry_1),
        .s    (s[1]),
        .cout (cout)
    );

endmodule