`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2025 09:03:44
// Design Name: 
// Module Name: SR_testbench
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
`timescale 1ns/1ps

module SR_tb;
  reg [3:0] I;
  reg [1:0] s;
  reg clk, clear, SIL, SIR;
  wire [3:0] A;

  // Instantiate shift register
  shiftregister UUT (
    .I(I),
    .s(s),
    .A(A),
    .clk(clk),
    .clear(clear),
    .SIL(SIL),
    .SIR(SIR)
  );

  // Clock generator: 10ns period
  always #5 clk = ~clk;

  initial begin
    // Initialize
    clk   = 0;
    clear = 1;   // active high reset
    I     = 4'b0000;
    s     = 2'b00;
    SIL   = 0;
    SIR   = 0;

    // Apply reset
    #10 clear = 0;

    // 1. Parallel load
    #10 I = 4'b1011; s = 2'b00;   // load 1011
    #10;

    // 2. Hold
    s = 2'b11; 
    #20;

    // 3. Shift right with SIL=1
    s = 2'b01; SIL = 1;
    #40;

    // 4. Hold again
    s = 2'b11; 
    #20;

    // 5. Shift left with SIR=0
    s = 2'b10; SIR = 0;
    #40;

    // 6. Shift left with SIR=1
    s = 2'b10; SIR = 1;
    #40;

    // 7. Parallel load new data
    I = 4'b1100; s = 2'b00;
    #20;

    // 8. Shift right with SIL=0
    s = 2'b01; SIL = 0;
    #40;

    // End simulation
    $stop;
  end
endmodule


