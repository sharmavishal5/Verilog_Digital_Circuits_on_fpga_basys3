`timescale 1ns / 1ps
module encoder4to2bh(
    input [3:0] in,
    output reg [1:0] out
);
    always @(*) begin
        case (in)
            4'b0001: out = 2'b00;
            4'b0010: out = 2'b01;
            4'b0100: out = 2'b10;
            4'b1000: out = 2'b11;
            default: out = 2'bxx;
        endcase
    end
endmodule

// 4-to-2 Encoder Dataflow Model
module encoder4to2_df (
    input [3:0] in,
    output [1:0] out
);
    assign out[1] = in[2] | in[3];
    assign out[0] = in[1] | in[3]; 
endmodule

// 4-to-2 Encoder Structural Model
module encoder4to2_str (
    input [3:0] in,
    output [1:0] out
);
    or g1(out[1], in[2], in[3]);
    or g2(out[0], in[1], in[3]);
endmodule

