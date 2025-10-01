`timescale 1ns / 1ps

module dff(
    input d, clk,rst,
    output reg q
    );
    
//    reg [25:0]div;
//    always @(posedge clk) begin
//        div <= div + 1;
    
//        if (div==0) begin
//            if(rst) Q <= 1'b0;
//            else Q <= d; 
//        end
//    end
    always @(posedge clk) begin
        if(rst) q <= 1'b0;
        else q <= d;
    end
endmodule
