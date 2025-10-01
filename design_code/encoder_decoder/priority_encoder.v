`timescale 1ns / 1ps



// 8-to-3 Priority Encoder (Behavioral)
// Priority: I7 (highest) ... I0 (lowest)
module pe8to3(
    input  [7:0] I,          // I[7] highest priority
    output reg [2:0] Y,      // encoded index
    output reg       valid   // 1 if any input is high
);
    always @* begin
        valid = |I;
        if      (I[7]) Y = 3'd7;
        else if (I[6]) Y = 3'd6;
        else if (I[5]) Y = 3'd5;
        else if (I[4]) Y = 3'd4;
        else if (I[3]) Y = 3'd3;
        else if (I[2]) Y = 3'd2;
        else if (I[1]) Y = 3'd1;
        else if (I[0]) Y = 3'd0;
        else            Y = 3'd0;
    end
endmodule

// 8-to-3 Priority Encoder (Dataflow)
module pe8to3_dataflow (
    input  [7:0] I,        // I[7] highest priority
    output [2:0] Y,        // encoded index
    output       valid
);
    assign valid = |I;
    assign Y =
        I[7] ? 3'd7 :
        I[6] ? 3'd6 :
        I[5] ? 3'd5 :
        I[4] ? 3'd4 :
        I[3] ? 3'd3 :
        I[2] ? 3'd2 :
        I[1] ? 3'd1 :
        3'd0; // when none asserted
endmodule


// 4-to-2 Priority Encoder (D3 highest)
// Outputs: y = index of highest '1', v = any input high
module pe4to2 (
    input  [3:0] D,     // D[3] highest priority
    output [1:0] y,
    output       v
);
    assign v = |D;
    assign y =
        D[3] ? 2'd3 :
        D[2] ? 2'd2 :
        D[1] ? 2'd1 :
        2'd0; // when none asserted
endmodule

// 8-to-3 Priority Encoder (Structural)
// Uses two pe4to2 blocks: upper = I[7:4], lower = I[3:0]
module pe8to3_struct (
    input  [7:0] I,
    output [2:0] Y,
    output       valid
);
    wire [1:0] y_hi, y_lo;
    wire v_hi, v_lo;
    pe4to2 UHI (.D(I[7:4]), .y(y_hi), .v(v_hi));
    pe4to2 ULO (.D(I[3:0]), .y(y_lo), .v(v_lo));
    assign valid = v_hi | v_lo;
    assign Y[2]   = v_hi;
    assign Y[1:0] = v_hi ? y_hi : y_lo;
endmodule
