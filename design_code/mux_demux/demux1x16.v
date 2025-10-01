`timescale 1ns / 1ps

//structural
module demux1x16(
    input in,
    input [3:0] sel,
    output [15:0] y
);
    wire [3:0] wr;
    demux1x4 stage0 (in, sel[3:2], wr);
    demux1x4 stage1 (wr[0], sel[1:0], y[3:0]); 
    demux1x4 stage2 (wr[1], sel[1:0], y[7:4]); 
    demux1x4 stage3 (wr[2], sel[1:0], y[11:8]);
    demux1x4 stage4 (wr[3], sel[1:0], y[15:12]);
endmodule

//behavioral
module demux1x16bh(
    input in,
    input [3:0] sel,
    output reg [15:0] y
);
    always @(*) begin
        y = 16'b0000000000000000;
        case (sel)
            4'b0000: y[0] = in;
            4'b0001: y[1] = in;
            4'b0010: y[2] = in;
            4'b0011: y[3] = in;
            4'b0100: y[4] = in;
            4'b0101: y[5] = in;
            4'b0110: y[6] = in;
            4'b0111: y[7] = in;
            4'b1000: y[8] = in;
            4'b1001: y[9] = in;
            4'b1010: y[10] = in;
            4'b1011: y[11] = in;
            4'b1100: y[12] = in;
            4'b1101: y[13] = in;
            4'b1110: y[14] = in;
            4'b1111: y[15] = in;
            default: y = 16'b0000000000000000;
        endcase
    end
endmodule

//dataflow
module demux1x16df(
    input in,
    input [3:0] sel,
    output [15:0] y
);
    assign y[0]  = in & ~sel[3] & ~sel[2] & ~sel[1] & ~sel[0];
    assign y[1]  = in & ~sel[3] & ~sel[2] & ~sel[1] &  sel[0];
    assign y[2]  = in & ~sel[3] & ~sel[2] &  sel[1] & ~sel[0]; 
    assign y[3]  = in & ~sel[3] & ~sel[2] &  sel[1] &  sel[0];
    assign y[4]  = in & ~sel[3] &  sel[2] & ~sel[1] & ~sel[0];
    assign y[5]  = in & ~sel[3] &  sel[2] & ~sel[1] &  sel[0];
    assign y[6]  = in & ~sel[3] &  sel[2] &  sel[1] & ~sel[0];
    assign y[7]  = in & ~sel[3] &  sel[2] &  sel[1] &  sel[0];
    assign y[8]  = in &  sel[3] & ~sel[2] & ~sel[1] & ~sel[0];
    assign y[9]  = in &  sel[3] & ~sel[2] & ~sel[1] &  sel[0];
    assign y[10] = in &  sel[3] & ~sel[2] &  sel[1] & ~sel[0];
    assign y[11] = in &  sel[3] & ~sel[2] &  sel[1] &  sel[0];
    assign y[12] = in &  sel[3] &  sel[2] & ~sel[1] & ~sel[0];
    assign y[13] = in &  sel[3] &  sel[2] & ~sel[1] &  sel[0];
    assign y[14] = in &  sel[3] &  sel[2] &  sel[1] & ~sel[0];
    assign y[15] = in &  sel[3] &  sel[2] &  sel[1] &  sel[0];
endmodule