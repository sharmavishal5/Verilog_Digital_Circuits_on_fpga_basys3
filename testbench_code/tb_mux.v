
`timescale 1ns / 1ps

module tb_mux;
    reg [31:0] in;
    reg [4:0] sel;
    wire out;
    mux32x1 uut (.in(in), .sel(sel), .out(out));

    initial begin
        in = 32'b11010101_11010101_11010101_11010101;  
        sel = 0;
        repeat (32) begin
            #10;
            sel = sel + 1;
        end
        $stop;
    end
endmodule

