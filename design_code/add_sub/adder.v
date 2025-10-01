//structural
module full_adder_str(
            input a,b,c, 
            output s, Cout);
    wire s1, c1, c2;
    half_adder_str h1(a,b,s1,c1),
                   h2(s1,c,s,c2);
    or (Cout, c1, c2);
endmodule

//behavioural

module full_adder_bh(input a,b,c, output reg s, Cout);
	always @(*) begin
	case({a,b,c})
		3'b000: {s,Cout} = 2'b00;
		3'b001: {s,Cout} = 2'b00;
		3'b010: {s,Cout} = 2'b00;
		3'b011: {s,Cout} = 2'b00;
		3'b100: {s,Cout} = 2'b00;
		3'b101: {s,Cout} = 2'b00;
		3'b110: {s,Cout} = 2'b00;
		3'b111: {s,Cout} = 2'b00;
	endcase
	end
endmodule

//data_flow
module full_adder_df(input a,b,c, output s, Cout);
	assign s = a^b^c;
	assign Cout = (a&b)|(a&c)|(b&c);
endmodule

//data_flow
module half_adder(
    input a,b,
    output s, c
    );
    assign {s,c} = {a^b,a&b};
endmodule

//structural
module half_adder_str(
    input a,b,
    output s, c);
    xor g1(s,a,b);                          
    and g2(c,a,b);
endmodule

//behaviorial
module half_adder_bh(
    input a,b,
    output reg s,c
    );
    always @(*) begin
		case({a,b})
			2'b00: {s,c} = 2'b00;
			2'b01: {s,c} = 2'b10;
			2'b10: {s,c} = 2'b10;
			2'b11: {s,c} = 2'b01;
		endcase
	end
endmodule