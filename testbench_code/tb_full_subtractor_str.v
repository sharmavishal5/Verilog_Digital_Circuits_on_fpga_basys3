`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 17:00:15
// Design Name: 
// Module Name: tb_full_subtractor_str
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


module tb_full_subtractor_str;
  reg a,b,bin;
  wire diff,bout;
  full_subtractor_str uut(a,b,bin,diff,bout);
  initial begin
    {a,b,bin}=0; repeat(8) #5 {a,b,bin}={a,b,bin}+1;
    $finish;
  end
endmodule

