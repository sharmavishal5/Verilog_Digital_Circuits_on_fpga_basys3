`timescale 1ns / 1ps


module tff(
    input T, clk, rst,
    output reg Q
    );
    always @(posedge clk) begin
        if(rst) Q <= 1'b0;
        else Q <= T ?~Q : Q;
    end
//    reg [25:0]div;
//    always @(posedge clk) begin
//        div <= div + 1;
    
//        if (div==0) begin
//            if(rst) Q <= 1'b0;
//            else Q <= T?~Q:Q; 
//        end
//    end
endmodule