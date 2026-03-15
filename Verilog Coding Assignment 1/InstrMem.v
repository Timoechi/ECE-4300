
module InstrMem(
    output reg [31:0] Instr,
    input clk, memread,
    input [8:0] Addr
);
reg [31:0] mem [2^32:0];
reg [31:0] temp;


integer i;
initial begin
    for (i = 0; i < (2^32); i = i + 1) begin
    mem[i] = 32'b0;
    end
end

always@(Instr, memread, posedge clk) begin
    if (memread) begin
        temp = Addr>>2;
        Instr = mem[temp];
    end
end

endmodule
