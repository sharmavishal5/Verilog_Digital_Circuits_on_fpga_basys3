`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.09.2025 13:57:39
// Design Name: 
// Module Name: alu
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


module alu(
    input [3:0] in1, in2,
    input [3:0] operations,
    output reg [7:0] out
);
    always @(*) begin
        case (operations)
            4'b0001: begin // Addition
                 out = in1 + in2;
            end
            4'b0010: begin // Sub
                    out = in1 - in2; // Normal subtraction
            end
            4'b0011: begin
                out = in1 * in2;
            end
            4'b0100: begin 
                out = in1 / in2;
            end
            4'b0101: begin
                out = in1 << in2; 
            end
            4'b0110: begin 
                    out = {in1[2:0], in1[3]};
            end
            4'b0111: begin 
                    out = {in1[0], in1[3:1]};
            end
            4'b1000: begin
                out = in1 & in2;
                end
            4'b1001: begin
                out = in1 | in2;
               
            end
            4'b1010: begin
                out = in1 ^ in2;

            end
              4'b1011: begin
                out = ~(in1 & in2);
            end
              4'b1100: begin
                out = in1 ^~ in2;
            end
              4'b1101: begin
                out = (in1 > in2) ? 1 : 0;
            end
                4'b1110: begin
                    out = (in1 < in2) ? 1 : 0;
                end
                4'b1111: begin
                    out = (in1 == in2) ? 1 : 0;
                end
            default: begin
                out = 8'b0;
            end
        endcase
    end
endmodule

