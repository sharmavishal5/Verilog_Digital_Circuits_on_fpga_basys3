`timescale 1ns / 1ps


// =====================
// Structural Model
// =====================
module dec2to4(
    input  [1:0] a,
    input        en,
    output [3:0] y
);
    wire na0, na1;
    not (na0, a[0]);
    not (na1, a[1]);

    and (y[0], en, na1, na0);  // 00
    and (y[1], en, na1, a[0]); // 01
    and (y[2], en, a[1], na0); // 10
    and (y[3], en, a[1], a[0]); // 11
endmodule

// =====================
// Dataflow Model
// =====================
module dec2to4_df(
    input  [1:0] a,
    input        en,
    output [3:0] y
);
    assign y[0] = en & ~a[1] & ~a[0];
    assign y[1] = en & ~a[1] &  a[0];
    assign y[2] = en &  a[1] & ~a[0];
    assign y[3] = en &  a[1] &  a[0];
endmodule

//behavioral
module dec2to4_bh(
    input  [1:0] a,
    input        en,
    output reg [3:0] y
);
    always @(*) begin
        if (en) begin
            case (a)
                2'b00: y = 4'b0001;
                2'b01: y = 4'b0010;
                2'b10: y = 4'b0100;
                2'b11: y = 4'b1000;
                default: y = 4'b0000;
            endcase
        end else begin  
            y = 4'b0000;
        end
    end
endmodule