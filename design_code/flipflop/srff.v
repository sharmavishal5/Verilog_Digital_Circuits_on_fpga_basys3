`timescale 1ns / 1ps

module srff(s,r,clk,q,rst);
	input s,r,clk,rst;
	output reg q;
	always@(posedge clk) begin
	if(rst==0) begin
		case({s,r})
			2'b00:	q = q;
			2'b01: q = 1'b0;
			2'd2:	q = 1'b1;
			2'd3:	q = 1'bx;
		endcase end
	else q=1'b0; end
endmodule


