`timescale 1ns / 1ps

module jk_ff(
    input clk,        // 100MHz Basys3 clock
    input reset,      // reset button
    input j, k,       // switches as inputs
    output reg q      // output to LED
);
    // reg [25:0] div;

    // always @(posedge clk or posedge reset) begin
    //     if (reset)
    //         div <= 0;
    //     else
    //         div <= div + 1;
    // end
    // Use slow clock from MSB of divider
    // wire slow_clk = div[25];   // divide ~100MHz/2^26 ≈ 1.5Hz

    // JK Flip-Flop
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else begin
            case ({j, k})
                2'b00: q <= q;       // Hold
                2'b01: q <= 0;       // Reset
                2'b10: q <= 1;       // Set
                2'b11: q <= ~q;      // Toggle
            endcase
        end
    end
endmodule

