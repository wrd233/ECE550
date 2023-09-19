# Project Checkpoint 1
 - Author: Rundong Wang
 - Date: 2023.9.15
 - Course: ECE 550DK, Duke Kunshan University
 - Term: No Team
 - Professor: Xin Li

## Duke Community Standard, Affirmation
 I affirm that each submission complies with the Duke/DKU Community Standard and the guidelines set forth for this assignment.  



## Main Module Specifications and Implementation Approach

#### alu_32_bit

Description: The main module that implements the ALU functionality, including the following operations: Less Than, Or, Addition, And, Not Equal, Logical Left Shift, Subtraction, and Overflow Detection.

Parameters:

- operandA: The first operand
- operandB: The second operand
- Ainvert: Whether to invert operand A
- Binvert: Whether to invert operand B
- Operation: The specific operation to be performed
- carry_in: The carry-in bit
- carry_out: The carry-out bit
- out: The output result
- overflow: Whether there is an overflow

Implementation approach:

1. The main approach is to utilize the implementation of a 1-bit ALU (alu_1_bit) that supports addition, subtraction, AND, and OR operations.
2. For the addition operation, a carry-select adder is used to perform the addition with carry-in and carry-out functionality.



#### alu_1_bit

Description: Implemented 1-bit Addition, Subtraction, And, Or operations.

Parameters:

- operandA: The first operand
- operandB: The second operand
- Ainvert: Whether to invert operand A
- Binvert: Whether to invert operand B
- Operation: The specific operation to be performed
- carry_in: The carry-in bit
- carry_out: The carry-out bit
- out: The output result

Implementation approach:

1. For the addition part, I used a full adder to perform the addition operation.
2. For the subtraction part, due to the properties of two's complement, A - B can be calculated as A + (not B) + 1. Therefore, we can use a binary Binvert to invert operand B and then perform addition as usual.
3. For the AND and OR operations, since this module utilizes AND gates and OR gates, we can use them directly to implement the AND and OR operations.
4. The specific output is determined by the Operation parameter passed into the module.



#### overflow_check

Description: To determine whether an overflow has occurred, we can compare the AV (A value), BV (B value) and the result addOut (sum output) of the addition operation.

Implementation approach:

1. The main idea is to check for overflow by comparing the signs of the input operands. If the signs of the two inputs are the same, but the sign of the result is different, an overflow has occurred.
2. The logic expression to implement this is:  overflow = (not AV)and(not BV)and(addOut) or (AV)and(BV)and(not addOut)



#### left_shift_32bit

Description: To perform a left shift operation on the input data

Parameters:

- ctrl_shiftamt: The number of positions to perform the left shift.
- data_in: The input data.
- data_out: The output data after performing the left shift operation.

Implementation approach:

1. I implemented modules for left shifting by 1 bit, 2 bits, 4 bits, 8 bits, and 16 bits.
2. By parsing the value of ctrl_shiftamt, where ctrl_shiftamt[i] indicates the need to invoke the module for left shifting by 2^i positions.
3. In the module for left shifting by 2^i positions, I used mux to perform the shifting operation.



## Reference

In the design of the alu_1_bit, I referred to Figure B.5.9 and Figure B.5.10 in "Computer Organization and Design."



## Bugs

I was unable to implement the arithmetic right shift portion. I tried reusing the left shift module, but there were always issues.
