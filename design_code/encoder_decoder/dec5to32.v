`timescale 1ns / 1ps

//structural
module dec5to32(
    input  [4:0] in,
    input        en,
    output [31:0] out
);
    wire [3:0] en_2to4;   // enables from 2-to-4
    wire [7:0] d0, d1, d2, d3;
    dec2to4 d2to4 (in[4:3], en, en_2to4);
    dec3to8 d3to8_0 (in[2:0], en_2to4[0],d0);
    dec3to8 d3to8_1 (in[2:0], en_2to4[1], d1);
    dec3to8 d3to8_2 (in[2:0], en_2to4[2],d2);
    dec3to8 d3to8_3 (in[2:0], en_2to4[3], d3);

    // Combine outputs
    assign out = {d3, d2, d1, d0};
endmodule

//dataflow
module dec5to32(
    input  [4:0] in,
    input        en,
    output [31:0] out
);
    assign out = en ? (32'b1 << in) : 32'b0;
endmodule

//behavioral
module dec5to32(
    input  [4:0] in,
    input        en,
    output reg [31:0] out
);
    always @(*) begin
        if (en) begin   
            out = 32'b1 << in; // Shift 1 to the left by 'in' positions
        end else begin
            out = 32'b0; // If not enabled, output is all zeros
        end
    end
endmodule

