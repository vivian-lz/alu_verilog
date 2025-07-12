module full_adder(input a, input b, input cin, output wire sum, output wire cout);
	wire middle, and1, and2;
  
  	assign middle = a ^ b;
  	assign sum = middle ^ cin;
  	assign and1 = cin & middle;
  	assign and2 = a & b;
  	assign cout = and1 | and2;
  
endmodule
    
module alu_1bit(input a, input b, input [1:0] opcode, input cin, output wire result, output wire cout);
  wire mux_wire, sum, cout_internal, and_internal, or_internal, cin_internal;
  //full adder and mux
  assign mux_wire = (opcode == 2'b00) ? b : ~b; //acts as an mux select
  assign cin_internal = (opcode == 2'b01) ? 1'b1 : cin;
  
  full_adder adder (a, mux_wire, cin_internal, sum, cout_internal);
  assign and_internal = a & b;
  assign or_internal = a | b;
  
  assign result = (opcode[1] == 0) ? sum : 
    (opcode == 2'b10) ? and_internal :
    or_internal;
  
  assign cout = (opcode[1] == 0) ? cout_internal : 1'b0;
  
endmodule

module alu_4bit(input [3:0] a, input [3:0] b, input [1:0] opcode, input cin, output [3:0] result, output cout);
	wire [2:0] carry_internal;
	alu_1bit bit0 (a[0], b[0], opcode, cin, result[0], carry_internal[0]);
  	alu_1bit bit1 (a[1], b[1], opcode, carry_internal[0], result[1], carry_internal[1]);
  alu_1bit bit2 (a[2], b[2], opcode, carry_internal[1], result[2], carry_internal[2]);
  alu_1bit bit3(a[3], b[3], opcode, carry_internal[2], result[3], cout);
endmodule
