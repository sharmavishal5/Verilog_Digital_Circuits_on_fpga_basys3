`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 15:21:23
// Design Name: 
// Module Name: tb_dec
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



/*
module tb_dec;
    reg [1:0] in;
    reg en;
    wire [3:0] out;

    dec2to4 uut (in, en, out);

    initial begin
        en = 0; in = 2'b00; #10;
        en = 1; in = 2'b00; #10;
        en = 1; in = 2'b01; #10;
        en = 1; in = 2'b10; #10;
        en = 1; in = 2'b11; #10;
        $finish;
    end
endmodule

module tb_dec;
    reg [2:0] in;
    reg en;
    wire [7:0] out;

    dec3to8 uut (.in(in), .en(en), .out(out));

    initial begin
        en = 0; in = 3'b000; #10;
        en = 1; in = 3'b000; #10;
        en = 1; in = 3'b001; #10;
        en = 1; in = 3'b010; #10;
        en = 1; in = 3'b011; #10;
        en = 1; in = 3'b100; #10;
        en = 1; in = 3'b101; #10;
        en = 1; in = 3'b110; #10;
        en = 1; in = 3'b111; #10;
        $finish;
    end
endmodule

*/
module tb_dec;
    reg [4:0] in;
    reg en;
    wire [31:0] out;

    dec5to32 uut (in, en, out);

    integer i;

    initial begin
        en = 0; in = 5'b00000; #10; // disabled
        en = 1;
        for (i = 0; i < 32; i = i + 1) begin
            in = i; #10;
        end
        $finish;
    end
endmodule
