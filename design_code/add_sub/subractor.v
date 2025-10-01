//data flow
module ha_sub(input a,b,
              output d,bw);
    assign {d,bw}={a^b,~a&b};
endmodule

//structural
module ha_sub_str(input a,b,
				  output d,bw);
	wire d1,b1;
	half_adder_str h1(a,b,d1,b1);
	assign d=d1;
	assign bw=~a&b1;
endmodule
//behavioural
module ha_sub_bh(input a,b,
				 output reg d,bw);
	always @(*) begin
		case({a,b})
			2'b00: {d,bw} = 2'b00;
			2'b01: {d,bw} = 2'b11;
			2'b10: {d,bw} = 2'b10;
			2'b11: {d,bw} = 2'b01;
		endcase
	end
endmodule


//data flow
module full_subtractor_df(input a,b,bin, output d, Bout);
	assign d = a^b^bin;
	assign Bout = (~a&b)|(b&bin)|(~a&bin);
endmodule

//structural
module full_subtractor_str(
			input a,b,bin, 
			output d, Bout);
	wire d1, b1, b2;
	half_adder_str h1(a,b,d1,b1),
				   h2(d1,bin,d,b2);
	or (Bout, b1, b2);
endmodule
//behavioural
module full_subtractor_bh(input a,b,bin, output reg d, Bout);
	always @(*) begin
	case({a,b,bin})
		3'b000: {d,Bout} = 2'b00;
		3'b001: {d,Bout} = 2'b11;
		3'b010: {d,Bout} = 2'b11;
		3'b011: {d,Bout} = 2'b10;
		3'b100: {d,Bout} = 2'b10;
		3'b101: {d,Bout} = 2'b01;
		3'b110: {d,Bout} = 2'b01;
		3'b111: {d,Bout} = 2'b00;
	endcase
	end
endmodule

