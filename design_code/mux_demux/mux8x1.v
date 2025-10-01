`timescale 1ns / 1ps

//behavioral
module mux8x1bh(
    input [7:0] in,
    input [2:0] sel,
    output reg out
);
    always @(*) begin
        case (sel)
            3'b000: out = in[0];
            3'b001: out = in[1];
            3'b010: out = in[2];
            3'b011: out = in[3];
            3'b100: out = in[4];
            3'b101: out = in[5];
            3'b110: out = in[6];
            3'b111: out = in[7];
            default: out = 0;
        endcase
    end
endmodule
//structural
module mux8x1str(input [7:0]in,
              input [2:0]sel,
                output out);
    wire [3:0]wr;
    mux4x1 m1(in[3:0], sel[1:0], wr[0]);
    mux4x1 m2(in[7:4], sel[1:0], wr[1]);
    mux2x1 m3(wr[0], wr[1], sel[2], out);
endmodule
module mux2x1(input [1:0]in,
              input sel,
              output out);
    wire [2:0]wr;
    not(sel,wr[0]);
    and a1(in[0], wr[0], wr[1]);
    and a2(in[1], sel, wr[2]);
    or(wr[1], wr[2], out);
endmodule
//data flow
module mux8x1df(input [7:0]in,
              input [2:0]sel,
              output out);
    assign out = in[sel];
endmodule