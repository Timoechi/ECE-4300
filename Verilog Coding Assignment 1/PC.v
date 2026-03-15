`timescale 1ns / 1ps
module PC(
    input clk, enable, rst,
    input [31:0] pcin,
    output reg [31:0] pcout
    );
initial begin
    pcout = 32'b0;
end


always @(pcin or posedge clk) begin
    if (rst == 1'b1)
        pcout <= 32'b0;    
    if (enable == 1'b1)
        pcout <= pcin;
end

endmodule
