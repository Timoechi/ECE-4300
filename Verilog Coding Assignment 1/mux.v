module mux(
    input  wire [31:0] a_true,
    input  wire [31:0] b_false,
    input  wire sel,
    output wire [31:0] out
);

assign out = (sel) ? a_true : b_false;

endmodule
