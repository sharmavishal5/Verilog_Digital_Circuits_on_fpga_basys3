`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 15:22:30
// Design Name: 
// Module Name: tb_full_adder
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

module tb_full_adder;
    reg a, b, c;
    wire s, Cout;
    full_adder_bh dut(a,b,c,s,Cout);
    initial begin
        {a,b,c} = 3'b000; #10;
        {a,b,c} = 3'b001; #10;
        {a,b,c} = 3'b010; #10;
        {a,b,c} = 3'b011; #10;
        {a,b,c} = 3'b100; #10;
        {a,b,c} = 3'b101; #10;
        {a,b,c} = 3'b110; #10;
        {a,b,c} = 3'b111; #10;
        $finish;
    end
endmodule


