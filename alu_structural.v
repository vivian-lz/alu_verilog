module mux_2to1( 
    input a, b, sel,
    output out ); 
    
    assign out = (sel == 0) ? a : b;

endmodule
    
module full_adder(input a, input b, input cin, output sum, output cout);
	wire middle, and1, and2;
  
  	assign middle = a ^ b;
  	assign sum = middle ^ cin;
  	assign and1 = cin & one;
  	assign and2 = a & b;
  	assign cout = and1 | and2;
  
endmodule
    
module alu_1bit(input a, input b, input [1:0] opcode, input cin, output result, output cout);
  //full adder and mux
  wire mux_wire;
  mux_2to1 mux (b, ~b, opcode, mux_wire);
  full_adder adder(a, mux_wire, opcode, result, cout);
endmodule
