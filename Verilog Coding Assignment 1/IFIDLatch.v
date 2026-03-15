`timescale 1ns / 1ps
module IFIDLatch(
    input [31:0] instrIn, adderIn,
    input clk, enable,
    output reg [31:0] instrOut, adderOut
    );



always @(instrIn, adderIn, posedge clk) begin 
    if (enable) begin   
        instrOut <= instrIn;
        adderOut <= adderIn;
    end
end


endmodule