`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//DEMUX1x8 behavioral
module demux1x8bh(input in, input [2:0] sel,
                output reg [7:0] y);
    always @(*) begin
        y = 8'b00000000;
        case (sel)
            3'b000: y[0] = in;
            3'b001: y[1] = in;
            3'b010: y[2] = in;
            3'b011: y[3] = in;
            3'b100: y[4] = in;
            3'b101: y[5] = in;
            3'b110: y[6] = in;
            3'b111: y[7] = in;
        endcase
    end
endmodule

//DEMUX1x8 structural
module demux1x8str(input in,
                input [2:0] sel,
                output [7:0] y);
    wire t0, t1;
    demux1x2 d1(in, sel[2], t0, t1);
    demux1x4 d2(t0, sel[1:0], y[3:0]);
    demux1x4 d3(t1, sel[1:0], y[7:4]);
endmodule

//DEMUX1x8 dataflow
module demux1x8df(input in,
                input [2:0] sel,
                output [7:0] y);
    assign y[0] = in & ~sel[2] & ~sel[1] & ~sel[0];
    assign y[1] = in & ~sel[2] & ~sel[1] &  sel[0];
    assign y[2] = in & ~sel[2] &  sel[1] & ~sel[0];
    assign y[3] = in & ~sel[2] &  sel[1] &  sel[0];
    assign y[4] = in &  sel[2] & ~sel[1] & ~sel[0];
    assign y[5] = in &  sel[2] & ~sel[1] &  sel[0];
    assign y[6] = in &  sel[2] &  sel[1] & ~sel[0];
    assign y[7] = in &  sel[2] &  sel[1] &  sel[0];
endmodule
