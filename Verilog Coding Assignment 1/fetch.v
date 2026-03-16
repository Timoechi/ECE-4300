module fetch(

input wire clk,
input wire rst,
input wire ex_mem_pc_src,
input wire [31:0] ex_mem_npc,

output wire [31:0] if_id_instr,
output wire [31:0] if_id_npc

);

// internal wires
wire [31:0] pc_out;
wire [31:0] pc_mux;
wire [31:0] next_pc;
wire [31:0] instr_data;

// MUX
mux m0(
    .a_true(ex_mem_npc),
    .b_false(next_pc),
    .sel(ex_mem_pc_src),
    .out(pc_mux)
);

// PC register
pc pc0(
    .clk(clk),
    .rst(rst),
    .pc_in(pc_mux),
    .pc_out(pc_out)
);

// Incrementer
incrementer in0(
    .pcin(pc_out),
    .pcout(next_pc)
);

// Instruction memory
instrMem inMem0(
    .clk(clk),
    .rst(rst),
    .addr(pc_out),
    .data(instr_data)
);

// IF/ID latch
ifIdLatch ifIdLatch0(
    .clk(clk),
    .rst(rst),
    .pc_in(next_pc),
    .instr_in(instr_data),
    .pc_out(if_id_npc),
    .instr_out(if_id_instr)
);

endmodule