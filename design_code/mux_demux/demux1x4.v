`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


//DEMUX1x4

//behavioral
module demux1x4bh(
    input in,
    input [1:0] sel,
    output reg [3:0] y
);
    always @(*) begin
        y = 4'b0000;
        case (sel)
            2'b00: y[0] = in;
            2'b01: y[1] = in;
            2'b10: y[2] = in;
            2'b11: y[3] = in;
            default: y = 4'b0000;
        endcase
    end
endmodule


//dataflow
module demux1x4df(
    input in,
    input [1:0] sel,
    output [3:0] y
);
    assign y[0] = in & ~sel[1] & ~sel[0];
    assign y[1] = in & ~sel[1] &  sel[0];
    assign y[2] = in &  sel[1] & ~sel[0];
    assign y[3] = in &  sel[1] &  sel[0];
endmodule


//structural
module demux1x2(input in,
                input sel,
                output y0, y1);
    assign y0 = (sel == 0) ? in : 0;
    assign y1 = (sel == 1) ? in : 0;
endmodule

module demux1x4str(input in,
                input [1:0] sel,
                output [3:0] y);
    wire t0, t1;
    demux1x2 d1(in, sel[1], t0, t1);
    demux1x2 d2(t0, sel[0], y[0], y[1]);
    demux1x2 d3(t1, sel[0], y[2], y[3]);
endmodule
