`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 16:08:07
// Design Name: 
// Module Name: tb_srff
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_srff;
    reg s,r,clk,rst;
	wire q;
srff s1(s,r,clk,q,rst);
initial clk =0;
always #50 clk = ~clk;
initial begin
	rst = 1'b1; s=1'b1; r=1'b0;
	#100 rst = 1'b0; s=1'b0; r=1'b0;
	#100 s=1'b0; r=1'b1;
	#100 s=1'b1; r=1'b0;
	#100 s=1'b0; r=1'b1;
	#100 s=1'b1; r=1'b0;
	#100 s=1'b0; r=1'b1;
	#100 s=1'b1; r=1'b0;
	#100 s=1'b1; r=1'b1;
	end
endmodule

