//This utilizes cases as the base of the ALU

//1 bit alu using a 2 bit opcode
module alu_1bit(input a, input b, input [1:0] opcode, input cin, output reg result, output reg cout);
  always @(*) begin
    case (opcode)
      2'b00: {result, cout} = a + b + cin; //addition
      2'b01: {result, cout} = a + ~b + 1'b1; //twos complement subtraction
      2'b10: begin
        result = a & b; //AND
        cout = 1'b0;
      end
      2'b11: begin
        result = a | b; //OR
        cout = 1'b0;
      end
    endcase
  end
endmodule

module alu_4bit(
  input[3:0] a, b, 
  input [1:0] opcode, 
  input cin,
  output [3:0] result, 
  output cout);
  wire [2:0] carry_internal;
  alu_1bit bit0 (a[0], b[0], opcode, cin, result[0], carry_internal[0]);
  alu_1bit bit1 (a[1], b[1], opcode, carry_internal[0], result[1], carry_internal[1]);
  alu_1bit bit2 (a[2], b[2], opcode, carry_internal[1], result[2], carry_internal[2]);
  alu_1bit bit3(a[3], b[3], opcode, carry_internal[2], result[3], cout);
endmodule
