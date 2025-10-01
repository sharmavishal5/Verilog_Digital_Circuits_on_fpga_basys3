`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


//MUX4X1

//data flow
module mux4x1df(input [3:0]in,
			  input [1:0]sel,
			  output out);
	assign out = in[sel];
endmodule

//structural
module mux4x1str(input [3:0]in,
			  input [1:0]sel,
			  output out);
	wire [1:0]wr;
	mux2x1 m1(in[0], in[1], sel[1], wr[0]);
	mux2x1 m2(in[2], in[3], sel[0], wr[1]);
	mux2x1 m3(wr[0], wr[1], sel[0], out);
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

//behavioral
module mux4x1bh(
    input [3:0] in,
    input [1:0] sel,
    output reg out
);
    always @(*) begin
        case (sel)
            2'b00: out = in[0];
            2'b01: out = in[1];
            2'b10: out = in[2];
            2'b11: out = in[3];
            default: out = 0;
        endcase
    end
endmodule

