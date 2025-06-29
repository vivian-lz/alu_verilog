//1 bit alu using a 2 bit opcode
module alu(input a, input b, input [1:0] opcode, input cin, output result, output cout);
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
endmodule
