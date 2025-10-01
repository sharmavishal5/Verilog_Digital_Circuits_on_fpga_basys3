`timescale 1ns / 1ps

// 8-to-3 Encoder (Behavioral)
module encoder8to3bh(input [7:0] in, output reg [2:0] out);

    always @(*) begin
        case (in)
            8'b00000001: out = 3'b000;
            8'b00000010: out = 3'b001;
            8'b00000100: out = 3'b010;
            8'b00001000: out = 3'b011;
            8'b00010000: out = 3'b100;
            8'b00100000: out = 3'b101;
            8'b01000000: out = 3'b110;
            8'b10000000: out = 3'b111;
            default:     out = 3'bxxx; // invalid input
        endcase
    end
endmodule

// 8-to-3 Encoder (Structural)
module encoder8to3_structural(input [7:0] in, output [2:0] out);
    or(out[2], in[4], in[5], in[6], in[7]);
    or(out[1], in[2], in[3], in[6], in[7]);
    or(out[0], in[1], in[3], in[5], in[7]);
endmodule

// 8-to-3 Encoder (Dataflow)
module encoder8to3_dataflow(input [7:0] in, output [2:0] out);
    assign out[2] = in[4] | in[5] | in[6] | in[7];
    assign out[1] = in[2] | in[3] | in[6] | in[7];
    assign out[0] = in[1] | in[3] | in[5] | in[7];
endmodule
