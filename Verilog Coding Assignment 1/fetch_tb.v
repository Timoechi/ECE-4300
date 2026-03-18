`timescale 1ns/1ps

module fetch_tb;

reg clk;
reg rst;
reg ex_mem_pc_src;
reg [31:0] ex_mem_npc;

wire [31:0] if_id_instr;
wire [31:0] if_id_npc;

fetch uut(
    .clk(clk),
    .rst(rst),
    .ex_mem_pc_src(ex_mem_pc_src),
    .ex_mem_npc(ex_mem_npc),
    .if_id_instr(if_id_instr),
    .if_id_npc(if_id_npc)
);

// clock generator
initial clk = 0;
always #5 clk = ~clk;

initial begin

    #1;                 // allow simulator to start

    rst = 1;
    ex_mem_pc_src = 0;
    ex_mem_npc = 32'h00000000;

    #10 rst = 0;        // release reset

    // normal sequential execution
    #90;

    // simulate branch
    ex_mem_pc_src = 1;
    #10;

    ex_mem_pc_src = 0;
    #100;

    $finish;

end

endmodule
