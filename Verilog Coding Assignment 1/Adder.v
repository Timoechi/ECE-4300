
module Adder(
    output reg [31:0] out,
    output reg carryout, ovf,
    input carryin,
    input [31:0] in1, in2 
);
 reg [32:0] C;
 integer k;
 
always @ (in1, in2, carryin) begin
C[0] = carryin;
    for (k = 0; k < 32; k = k+1) begin
        out[k] = in1[k] ^ in2[k] ^ C[k];
        C[k+1] = (in1[k] & in2[k]) | (in1[k] & C[k]) | (in2[k] & C[k]);
    end
carryout = C[32];
ovf = C[32] ^ C[31];
end

endmodule
