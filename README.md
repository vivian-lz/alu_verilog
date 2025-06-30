# 4-Bit ALU

I built a 4-bit ALU using the Hardware Description Language (HDL) Verilog. This ALU has a 2-bit opcode that creates 4 selectable options: Add, Subtract, logical AND, and logical OR. The Add and Subtract methods utilize twos complement digital logic.

The same ALU was constructed in 2 different ways. One way utilizes cases to create a 1-bit ALU that was scaled up to a 4-bit ALU utilizing instances of the 1-but ALU. The other method follows the general structure of an ALU that uses hardware such as full adders and mux (multiplexers). 
