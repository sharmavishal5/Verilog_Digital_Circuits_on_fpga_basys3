`timescale 1ns / 1ps


// 3-to-8 Decoder - Structural
module dec3to8 (
    input  [2:0] in,
    input        en,
    output [7:0] out
);
    wire [1:0] in_low = in[1:0];
    wire en0, en1;

    assign en0 = en & ~in[2];
    assign en1 = en &  in[2];

    decoder2to4 d0(in_low, en0, out[3:0]);
    decoder2to4 d1(in_low, en1, out[7:4]);
endmodule

// 3-to-8 Decoder - Dataflow
module dec3to8 (
    input  [2:0] in,
    input        en,
    output [7:0] out
);
    assign out[0] = en & ~in[2] & ~in[1] & ~in[0];
    assign out[1] = en & ~in[2] & ~in[1] &  in[0];
    assign out[2] = en & ~in[2] &  in[1] & ~in[0];
    assign out[3] = en & ~in[2] &  in[1] &  in[0];
    assign out[4] = en &  in[2] & ~in[1] & ~in[0];
    assign out[5] = en &  in[2] & ~in[1] &  in[0];
    assign out[6] = en &  in[2] &  in[1] & ~in[0];
    assign out[7] = en &  in[2] &  in[1] &  in[0];
endmodule

//behavioral
module dec3to8 (
    input  [2:0] in,
    input        en,
    output reg [7:0] out
);
    always @(*) begin   
        if (en) begin
            out = 8'b00000001 << in; // Shift 1 to the left by 'in' positions
        end else begin
            out = 8'b00000000; // If not enabled, output is all zeros
        end
    end
endmodule
