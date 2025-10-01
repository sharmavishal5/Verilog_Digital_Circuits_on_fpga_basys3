`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 16:26:14
// Design Name: 
// Module Name: tb_jk_ff
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

module tb_jk_ff;
    reg clk, reset, j, k;
    wire q;

    jk_ff uut (.clk(clk), .reset(reset), .j(j), .k(k), .q(q));

    initial begin
        clk = 0; forever #5 clk = ~clk;
    end

    initial begin
        reset = 1; j=0; k=0; #10;
        reset = 0;

        j=0; k=0; #10; // hold
        j=0; k=1; #10; // reset
        j=1; k=0; #10; // set
        j=1; k=1; #10; // toggle
        j=1; k=1; #20; // toggle again
        $finish;
    end
endmodule
