`timescale 1ns / 1ps

module sub_4bit(input [3:0]in1,in2,input bin,
                output [3:0]diff,output brw);
    wire [2:0]w;
    full_subtractor_str
    S1(in1[0],in2[0],bin,diff[0],w[0]),
    S2(in1[1],in2[1],w[0],diff[1],w[1]),
    S3(in1[2],in2[2],w[1],diff[2],w[2]),
    S4(in1[3],in2[3],w[2],diff[3],brw);
endmodule
