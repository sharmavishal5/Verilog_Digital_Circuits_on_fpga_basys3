`timescale 1ns / 1ps

//DEMUX32X1
//structural
module demux1x32(in, sel, y);
    input in;
    input [4:0] sel;
    output [31:0] y;
    wire [3:0] e;

    demux1x4 d1(in, sel[4:3], e);
    demux1x8 d2(e[0], sel[2:0], y[7:0]);
    demux1x8 d3(e[1], sel[2:0], y[15:8]);
    demux1x8 d4(e[2], sel[2:0], y[23:16]);
    demux1x8 d5(e[3], sel[2:0], y[31:24]);
endmodule

//dataflow
module demux1x32(in, sel, y);
    input in;
    input [4:0] sel;
    output [31:0] y;
    assign y = in << sel;
endmodule

//behavioral
module demux1x32(in, sel, y);
    input in;
    input [4:0] sel;
    output reg [31:0] y;
    integer i;
    always @(*) begin
        y = 32'b00000000000000000000000000000000;
        for (i = 0; i < 32; i = i + 1) begin
            if (i == sel)
                y[i] = in;
            else
                y[i] = 0;
        end
    end
endmodule
