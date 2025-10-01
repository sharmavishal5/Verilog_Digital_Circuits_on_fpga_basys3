`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2025 15:19:13
// Design Name: 
// Module Name: comparator_tb
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


module comparator_tb;
	reg [1:0]A,B;
	wire less, equal, greater;
comparator comparator(A,B, less, equal, greater);
initial
	begin
	A=00; B=00;
	#100 A=00; B=01;
	#100 A=00; B=10; 
	#100 A=00; B=11; 
	#100 A=01; B=00;
	#100 A=01; B=01;
	#100 A=01; B=10; 
	#100 A=01; B=11; 
	#100 A=10; B=00;
	#100 A=10; B=01;
	#100 A=10; B=10; 
	#100 A=10; B=11; 
	#100 A=11; B=00;
	#100 A=11; B=01;
	#100 A=11; B=10; 
	#100 A=11; B=11; 
end
endmodule
