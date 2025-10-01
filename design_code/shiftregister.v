`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2025 08:55:32
// Design Name: 
// Module Name: shiftregister
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


module shiftregister(I,s,A, clk, clear, SIL, SIR);
  input [3:0]I;
  input [1:0]s;
  input clk, clear, SIL, SIR;
  output [3:0]A;
  wire [3:0]Q;   // internal storage
  wire y0,y1,y2,y3;

  // Muxes for each stage
  mux4x1 m0({Q[0], Q[1], SIL, I[0]}, s, y0);  // LSB
  mux4x1 m1({Q[1], Q[2], Q[0], I[1]}, s, y1);
  mux4x1 m2({Q[2], Q[3], Q[1], I[2]}, s, y2);
  mux4x1 m3({Q[3], SIR, Q[2], I[3]}, s, y3);  // MSB
  
  // DFFs
  dffs d0(y0,clk,clear,Q[0]);
  dffs d1(y1,clk,clear,Q[1]);
  dffs d2(y2,clk,clear,Q[2]);
  dffs d3(y3,clk,clear,Q[3]);

  assign A = Q;
endmodule

module dffs(
    input d, clk,rst,
    output reg q
    );
    
    reg [25:0]div;
    always @(posedge clk) div <= div + 1;
    always @(posedge div[25]) begin
        if(rst) q <= 1'b0;
        else q <= d;
    end
endmodule

