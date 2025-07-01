module testbench;
  reg a1, b1, cin1, cin4;
  reg [3:0] a4, b4;
  reg [1:0] opcode;
  wire result1, cout1, cout4;
  wire [3:0] result4;
  alu_1bit dut1 (a1, b1, opcode, cin1, result1, cout1);
  alu_4bit dut4 (a4, b4, opcode, cin4, result4, cout4);
  initial begin
    a = 1; b = 0; opcode = 2'b00; cin = 0; //Add No Carry
    #10
    if(result_1bit !== 1 || cout_1bit !== 0)
      $display("Test failed for 1 bit: Correct answer is 1 with 0 carry");
    else
      $display("Test passed for 1 bit.");
    
    a = 1; b = 1; opcode = 2'b00; cin = 0; //Add Carry
    #10
    if(result !== 0 || cout !== 1)
      $display("Test failed for 1 bit: Correct answer is 0 with 1 carry");
    else
      $display("Test passed for 1 bit.");
    
    a = 1; b = 0; opcode = 2'b00
    
    end
endmodule
    
