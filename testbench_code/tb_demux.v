`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.08.2025 09:24:43
// Design Name: 
// Module Name: tb_demux
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


module tb_demux;
    reg in;
    reg [4:0] sel;
    wire [31:0] y;
    demux1x32 uut (.in(in), .sel(sel), .y(y));
    initial begin
    in = 1; sel = 0; 
    repeat (32) begin
        #10; sel = sel + 1;
    end
    $stop;
end
endmodule

