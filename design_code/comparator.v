`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2025 15:17:55
// Design Name: 
// Module Name: comparator
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


module comparator(A,B, less, equal, greater);
	input [1:0]A,B;
	output less, equal, greater;
	reg less, equal, greater;
always@(A or B)
	begin	
	if (A>B) 
	begin
	less = 0;
	equal = 0;
	greater = 1 ;
	end
else if (A<B)
	begin
	less = 1;
	equal = 0;
	greater = 0 ;
	end
else
	begin
	less = 0;
	equal = 1;
	greater = 0 ;
	end
end
endmodule

