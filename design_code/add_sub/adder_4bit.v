`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 16:08:18
// Design Name: 
// Module Name: adder_4bit
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


module adder_4bit(input [3:0]in1,in2, input cin
                 ,output [3:0]out, output cout);
    wire [2:0]wr;
    full_adder_str I1(in1[0],in2[0],cin,out[0],wr[0]);
    full_adder_str I2(in1[1],in2[1],wr[0],out[1],wr[1]);
    full_adder_str I3(in1[2],in2[2],wr[1],out[2],wr[2]);
    full_adder_str I4(in1[3],in2[3],wr[2],out[3],cout);
endmodule
