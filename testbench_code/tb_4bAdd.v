`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 16:23:15
// Design Name: 
// Module Name: tb_4bAdd
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
module tb_4bAdd;
    reg [3:0] in1, in2;
    reg cin;
    wire [3:0] out;
    wire cout;
    adder_4bit uut(in1,in2,cin,out,cout);
    initial begin
            {in1,in2,cin} = 9'd25;
            repeat(7) begin
            #10 {in1,in2,cin} = {in1,in2,cin} + 5'h1c;
        end #10 $finish;
      end
endmodule