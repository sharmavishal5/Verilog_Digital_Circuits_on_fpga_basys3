`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.08.2025 16:58:58
// Design Name: 
// Module Name: tb_ha_sub
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


module tb_ha_sub;
  reg a,b;
  wire d,bo;
  ha_sub uut(.a(a),.b(b),.d(d),.bw(bo));
  initial begin
    {a,b}=0; repeat(4) #5 {a,b}={a,b}+1;
    $finish;
  end
endmodule
