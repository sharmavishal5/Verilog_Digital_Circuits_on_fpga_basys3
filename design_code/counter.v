`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 13:36:47
// Design Name: 
// Module Name: counter
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


module counter (
    input clk, rst, up, down,
    output [3:0] Q
);
    wire t0, t1, t2, t3;
    wire up_down_ctrl;

    // Control logic for up/down
    assign up_down_ctrl = (up & ~down); // Up active when up=1, down=0

    // T input logic for each stage
    assign t0 = up ^ down;  // first FF toggles when either up or down is active
    assign t1 = (up & Q[0]) | (down & ~Q[0]);
    assign t2 = (up & Q[0] & Q[1]) | (down & ~Q[0] & ~Q[1]);
    assign t3 = (up & Q[0] & Q[1] & Q[2]) | (down & ~Q[0] & ~Q[1] & ~Q[2]);

    // Instantiate 4 TFFs
    tff tff0 (.T(t0), .clk(clk), .rst(rst), .Q(Q[0]));
    tff tff1 (.T(t1), .clk(clk), .rst(rst), .Q(Q[1]));
    tff tff2 (.T(t2), .clk(clk), .rst(rst), .Q(Q[2]));
    tff tff3 (.T(t3), .clk(clk), .rst(rst), .Q(Q[3]));

endmodule
