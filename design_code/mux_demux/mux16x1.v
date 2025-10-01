`timescale 1ns / 1ps

//structural
module mux16x1str(
    input [15:0]in,
    input [3:0]sel,
    output out
    );
    wire [3:0]wr;
    mux4x1 s0(in[3:0], sel[1:0], wr[0]);
    mux4x1 s1(in[7:4], sel[1:0], wr[1]);
    mux4x1 s2(in[11:8], sel[1:0], wr[2]);
    mux4x1 s3(in[15:12], sel[1:0], wr[3]);
    mux4x1 s4(wr[3:0], sel[3:2], out);
endmodule

//behavioral
module mux16x1bh(
    input [15:0] in,
    input [3:0] sel,
    output reg out
);
    always @(*) begin
        case (sel)
            4'b0000: out = in[0];
            4'b0001: out = in[1];
            4'b0010: out = in[2];
            4'b0011: out = in[3];
            4'b0100: out = in[4];
            4'b0101: out = in[5];
            4'b0110: out = in[6];
            4'b0111: out = in[7];
            4'b1000: out = in[8];
            4'b1001: out = in[9];
            4'b1010: out = in[10];
            4'b1011: out = in[11];
            4'b1100: out = in[12];
            4'b1101: out = in[13];
            4'b1110: out = in[14];
            4'b1111: out = in[15];
            default: out = 0;
        endcase
    end
endmodule

//data flow
module mux16x1df(input [15:0]in,
              input [3:0]sel,
              output out);
    assign out = in[sel];
endmodule