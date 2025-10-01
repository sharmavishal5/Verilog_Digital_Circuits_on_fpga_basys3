`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 32x1 MUX using 8x1 and 4x1
module mux32x1(
    input [31:0] in,
    input [4:0] sel,
    output out
    );
    
    wire [3:0] w;
    mux8x1 m0(in[7:0],     sel[2:0], w[0]);
    mux8x1 m1(in[15:8],    sel[2:0], w[1]);
    mux8x1 m2(in[23:16],   sel[2:0], w[2]);
    mux8x1 m3(in[31:24],   sel[2:0], w[3]);
    mux4x1 m4(w, sel[4:3], out);
endmodule

// 32x1 MUX using data flow
module mux32x1df(
    input [31:0] in,
    input [4:0] sel,
    output out
    );
    assign out = in[sel];
endmodule

// 32x1 MUX using behavioral
module mux32x1bh(
    input [31:0] in,
    input [4:0] sel,
    output reg out
    );
    always @(*) begin
        case (sel)
            5'b00000: out = in[0];
            5'b00001: out = in[1];
            5'b00010: out = in[2];
            5'b00011: out = in[3];
            5'b00100: out = in[4];
            5'b00101: out = in[5];
            5'b00110: out = in[6];
            5'b00111: out = in[7];
            5'b01000: out = in[8];
            5'b01001: out = in[9];
            5'b01010: out = in[10];
            5'b01011: out = in[11];
            5'b01100: out = in[12];
            5'b01101: out = in[13];
            5'b01110: out = in[14];
            5'b01111: out = in[15];
            5'b10000: out = in[16];
            5'b10001: out = in[17];
            5'b10010: out = in[18];
            5'b10011: out = in[19];
            5'b10100: out = in[20];
            5'b10101: out = in[21];
            5'b10110: out = in[22];
            5'b10111: out = in[23];
            5'b11000: out = in[24];
            5'b11001: out = in[25];
            5'b11010: out = in[26];
            5'b11011: out = in[27];
            5'b11100: out = in[28];
            5'b11101: out = in[29];
            5'b11110: out = in[30];
            5'b11111: out = in[31];
            default: out = 0;
        endcase
    end
endmodule
//////////////////////////////////////////////////////////////////////////////////
