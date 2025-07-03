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
    a1 = 1; b1 = 0; opcode = 2'b00; cin1 = 0; //Add No Carry
    #10
    if(result1 !== 1 || cout1 !== 0)
      $display("Test failed for 1 bit: Correct answer is 1 with 0 carry");
    else
      $display("Test passed for 1 bit.");
    
    a4 = 1001; b4 = 0110; opcode = 2'b00; cin4 = 0; //Add No Carry
    #10
    if(result4 != 1111 || cout4 != 0)
      $display("Test failed for 4 bit: Correct answer is 1111 with 0 carry");
    else
      $display("Test passed for 4 bit.");
    
    a1 = 1; b1 = 1; opcode = 2'b00; cin1 = 0; //Add Carry
    #10
    if(result1 !== 0 || cout1 !== 1)
      $display("Test failed for 1 bit: Correct answer is 0 with 1 carry");
    else
      $display("Test passed for 1 bit.");
    
    a4 = 1001; b4 = 0111; opcode = 2'b00; cin = 0; //Add carry
    #10
    if(result4 !== 0000 || cout !== 1)
      $display("Test failed for 4 bit: Correct answer is 0000 with 1 carry.");
    
    //SUBTRACT FUNCTION
    a1 = 1; b1 = 0; opcode = 2'b01; cin1 = 0; //Subtract
    #10
    if(result1 !== 1 || cout1 !== 0)
      $display("Test failed for 1 bit: Correct answer is 1 with 0 carry");
    else
      $display("Test passed for 1 bit.");
    
    a4 = 1111; b4 = 0000; opcode = 2'b01; cin = 0;
    #10
    if(result4 !== 1111 || cout !== 0)
      $display("Test failed for 4 bit: correct answer is 1111 with 0 carry.");
    else
      $display("Test passed for 4 bit.");
    
    //AND FUNCTION
    a1 = 1; b1 = 1; opcode = 2'b10; cin1 = 0; //AND 11
    #10
    if(result1 !== 1)
      $display("Test failed for 1 bit: Correct answer is 1");
    else
      $display("Test passed for 1 bit.");
    
    a1 = 1; b1 = 0; opcode = 2'b10; cin1 = 0; //AND 10
    #10
    if(result1 !== 0)
      $display("Test failed for 1 bit: Correct answer is 0");
    else
      $display("Test passed for 1 bit.");
    
    a1 = 0; b1 = 1; opcode = 2'b10; cin1 = 0; //AND 01
    #10
    if(result1 !== 0)      
      $display("Test failed for 1 bit: Correct answer is 0");
    else
      $display("Test passed for 1 bit.");
    
    a1 = 0; b = 0; opcode = 2'b10; cin1 = 0; //AND 00
    #10
    if(result1 !== 0)
      $display("Test failed for 1 bit: Correct answer is 0");
    else
      $display("Test passed for 1 bit.");
    
    a4 = 0000; b4 = 0000; opcode = 2'b10; cin = 0;
    #10
    if(result4 != 0000)
      $display("Test failed for 4 bit: Correct answer is 0000.");
    else
      $display("Test passed for 4 bit.");
    
    a4 = 1010; b4 = 0101; opcode = 2'b10; cin = 0;
    #10
    if(result4 !== 0000)
      $display("Test failed for 4 bit: Correct answer is 0000.");
    else
      $display("Test passed for 4 bit.");
    
    a4 = 1010; b4 = 1111; opcode = 2'b10; cin = 0;
    #10
    if(result4 !== 1010)
      $display("Test failed for 4 bit: Correct answer is 1010.");
    else
      $display("Test passed for 4 bit.");
    
    a4 = 1111; b4 = 1111; opcode = 2'b10; cin = 0;
    #10
    if(result4 !== 1111)
      $display("Test failed for 4 bit: Correct answer is 1111.");
    else
      $display("Test passed for 4 bit.");
    
    //OR FUNCTION
    a1 = 1; b1 = 1; opcode = 2'b11; cin1 = 0; //OR 11
    #10
    if(result1 !== 1)
      $display("Test failed for 1 bit: Correct answer is 1");
    else
      $display("Test passed for 1 bit.");
    
    a1 = 1; b1 = 0; opcode = 2'b11; cin1 = 0; //OR 10
    #10
    if(result1 !== 0)
      $display("Test failed for 1 bit: Correct answer is 1");
    else
      $display("Test passed for 1 bit.");
    
    a1 = 0; b1 = 1; opcode = 2'b11; cin1 = 0; //OR 01
    #10
    if(result1 !== 1)      
      $display("Test failed for 1 bit: Correct answer is 1");
    else
      $display("Test passed for 1 bit.");
    
    a1 = 0; b1 = 0; opcode = 2'b11; cin1 = 0; //OR 00
    #10
    if(result1 !== )0
      $display("Test failed for 1 bit: Correct answer is 0");
    else
      $display("Test passed for 1 bit.");
    
    a4 = 0000; b4 = 0000; opcode = 2'b11; cin = 0;
    #10
    if(result4 != 0000)
      $display("Test failed for 4 bit: Correct answer is 0000.");
    else
      $display("Test passed for 4 bit.");
    
    a4 = 1010; b4 = 0101; opcode = 2'b11; cin = 0;
    #10
    if(result4 !== 1111)
      $display("Test failed for 4 bit: Correct answer is 1111.");
    else
      $display("Test passed for 4 bit.");
    
    a4 = 1010; b4 = 0000; opcode = 2'b11; cin = 0;
    #10
    if(result4 !== 1010)
      $display("Test failed for 4 bit: Correct answer is 1010.");
    else
      $display("Test passed for 4 bit.");
    
    a4 = 1111; b4 = 1111; opcode = 2'b11; cin = 0;
    #10
    if(result4 !== 1111)
      $display("Test failed for 4 bit: Correct answer is 1111.");
    else
      $display("Test passed for 4 bit.");
    
    end
  
endmodule
