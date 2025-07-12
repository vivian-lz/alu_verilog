module mux_2to1( 
    	input a, b, sel,
    	output wire out ); 
    
  assign out = (sel == 1'b0) ? a : b;

endmodule
    
module full_adder(input a, input b, input cin, output wire sum, output wire cout);
	wire middle, and1, and2;
  
  	assign middle = a ^ b;
  	assign sum = middle ^ cin;
  	assign and1 = cin & middle;
  	assign and2 = a & b;
  	assign cout = and1 | and2;
  
endmodule

module logical_and(input a, input b, output wire result);
  assign result = a & b;
endmodule

module logical_or(input a, input b, output wire result);
  assign result = a | b;
endmodule
    
module alu_1bit(input a, input b, input [1:0] opcode, input cin, output result, output cout);
  wire mux_wire;
  	//full adder and mux
  always @(*) begin
  	if(opcode == 2'b00)
    	mux_2to1 mux1 (b, ~b, 1'b0, mux_wire);
  		full_adder adder1 (a, mux_wire, cin, result, cout);
 	else if(opcode == 2'b01)
    	mux_2to1 mux2 (b, ~b, 1'b1, mux_wire);
  		full_adder adder2 (a, mux_wire, cin, result, cout);
  	else if(opcode == 2'b10)
  		logical_and andcase (a, b, result);
  	else //opcode 11
  		logical_or orcase (a, b, result);
  	end
  end
endmodule

module alu_4bit(input [3:0] a, input [3:0] b, input [1:0] opcode, input cin, output [3:0] result, output cout);
	wire [2:0] carry_internal;
	alu_1bit bit0 (a[0], b[0], opcode, cin, result[0], carry_internal[0]);
  	alu_1bit bit1 (a[1], b[1], opcode, carry_internal[0], result[1], carry_internal[1]);
  alu_1bit bit2 (a[2], b[2], opcode, carry_internal[1], result[2], carry_internal[2]);
  alu_1bit bit3(a[3], b[3], opcode, carry_internal[2], result[3], cout);
endmodule

