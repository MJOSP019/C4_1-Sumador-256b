`timescale 1ns / 1ps

module adder_x1 (
    input  logic a,
    input  logic b,
    input  logic cin,
    output logic s,
    output logic cout
);

    logic p, g;

    assign p = a ^ b;
    assign g = a & b;

    assign s = p ^ cin;
    assign cout = g | (p & cin);

endmodule