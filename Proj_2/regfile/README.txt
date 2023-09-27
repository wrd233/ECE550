# Project Checkpoint 2
 - Author: Rundong Wang
 - Date: 2023.9.27
 - Course: ECE 550DK, Duke Kunshan University
 - Term: No Team
 - Professor Xin Li

## Duke Community Standard, Affirmation
 I affirm that each submission complies with the Duke/DKU Community Standard and the guidelines set forth for this assignment.  



## Main Module Specifications and Implementation Approach

### d_latch

**Description**: The bottom-level storage component that can be written to when the enable and clock triggering edges are simultaneously present. When reset is set to 1, the internal state is forcibly set to 0.

**Implementation**: The main structure is implemented using two AND gates and two NOR gates, as described in the textbook. To implement the reset functionality, I have added a multiplexer (mux) to select the final state.



#### d_flip_flop

**Description**: It can only be written once within a single clock cycle.

**Implementation**: It is achieved by connecting two D-latches that are triggered by opposite clock edges.



#### register

**Description**: Storing 32-bit data.

**Implementation**: It is achieved by connecting 32 D flip-flops.



#### register file

**Description**: The system has one write port and two read ports. Each port can access one of the 32-bit registers out of a total of 32 registers. The value of register 0 is always 0.

**Implementation**:

Write Port: First, the 5-bit control signal ctrl_writeReg is decoded to obtain a 32-bit bit string, which is then AND with the ctrl_writeEnable signal. This determines the enable status for each register. The enable status of each register, along with the data to be written (data_writeReg), is then passed to each respective register.

Read Port: First, the output of each register is obtained. Then, each output is connected to the final output targets, data_readRegA or data_readRegB, through a tristate buffer. We also use a 5-to-32 decoder to control whether the tristate buffer outputs 1'bz or the source data.



## Clocked Test

My component crashed at a timescale of 10 fs / 1 fs, but it runs well at a timescale of 100 fs / 10 fs.
