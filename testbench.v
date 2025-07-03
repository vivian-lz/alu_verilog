//This testbench can run for either file and should work as expected due to 
//encapuslation (modules have the same names despite their functionality to 
//get to the same result being different)

module testbench;
  reg a1, b1, cin1, cin4;
  reg [3:0] a4, b4;
  reg [1:0] opcode;
  wire result1, cout1, cout4;
  wire [3:0] result4;
  alu_1bit dut1 (a1, b1, opcode, cin1, result1, cout1);
  alu_4bit dut4 (a4, b4, opcode, cin4, result4, cout4);
  initial begin
    //ADD FUNCTION
    a = 1; b = 0; opcode = 2'b00; cin = 0; //Add No Carry
    #10
    if(result1 !== 1 || cout1 !== 0)
      $display("Test failed for 1 bit: Correct answer is 1 with 0 carry");
    else
      $display("Test passed for 1 bit.");
    
    a = 1; b = 1; opcode = 2'b00; cin = 0; //Add Carry
    #10
    if(result1 !== 0 || cout1 !== 1)
      $display("Test failed for 1 bit: Correct answer is 0 with 1 carry");
    else
      $display("Test passed for 1 bit.");
    
    //SUBTRACT FUNCTION
    a = 1; b = 0; opcode = 2'b01; cin = 0; //Subtract
    #10
    if(result1 !== 1 || cout1 !== 0)
      $display("Test failed for 1 bit: Correct answer is 1 with 0 carry");
    else
      $display("Test passed for 1 bit.");
    
    //AND FUNCTION
    a = 1; b = 1; opcode = 2'b10; cin = 0; //AND 11
    #10
    if(result1 !== 1)
      $display("Test failed for 1 bit: Correct answer is 1");
    else
      $display("Test passed for 1 bit.");
    
    a = 1; b = 0; opcode = 2'b10; cin = 0; //AND 10
    #10
    if(result1 !== 0)
      $display("Test failed for 1 bit: Correct answer is 0");
    else
      $display("Test passed for 1 bit.");
    
    a = 0; b = 1; opcode = 2'b10; cin = 0; //AND 01
    #10
    if(result1 !== 0)      
      $display("Test failed for 1 bit: Correct answer is 0");
    else
      $display("Test passed for 1 bit.");
    
    a = 0; b = 0; opcode = 2'b10; cin = 0; //AND 00
    #10
    if(result1 !== )0
      $display("Test failed for 1 bit: Correct answer is 0");
    else
      $display("Test passed for 1 bit.");
    
    //OR FUNCTION
    a = 1; b = 1; opcode = 2'b11; cin = 0; //OR 11
    #10
    if(result1 !== 1)
      $display("Test failed for 1 bit: Correct answer is 1");
    else
      $display("Test passed for 1 bit.");
    
    a = 1; b = 0; opcode = 2'b11; cin = 0; //OR 10
    #10
    if(result1 !== 0)
      $display("Test failed for 1 bit: Correct answer is 1");
    else
      $display("Test passed for 1 bit.");
    
    a = 0; b = 1; opcode = 2'b11; cin = 0; //OR 01
    #10
    if(result1 !== 1)      
      $display("Test failed for 1 bit: Correct answer is 1");
    else
      $display("Test passed for 1 bit.");
    
    a = 0; b = 0; opcode = 2'b11; cin = 0; //OR 00
    #10
    if(result1 !== )0
      $display("Test failed for 1 bit: Correct answer is 0");
    else
      $display("Test passed for 1 bit.");
    
    end
  
endmodule
