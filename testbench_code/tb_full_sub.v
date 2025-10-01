`timescale 1ns / 1ps

module tb_full_sub4;
    reg [3:0] in1, in2;
    reg bin;
    wire [3:0] diff;
    wire brw;
    sub_4bit uut (in1,in2,bin,diff,brw);
    initial
        begin
            {bin,in1,in2} = 9'd25;
            repeat(7) begin
            #10 {bin,in1,in2} = {bin,in1,in2} + 5'h1c;
        end
       #10 $finish;
      end
endmodule