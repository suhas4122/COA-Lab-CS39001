# KGP RISC

## Introduction

Data-path and controller for a 32-bit CPU for a MIPS like architecture

The hierarchy of project is as follows:

DataPath is top module and it contains various modules as follows :

1. ProgramCounter
2. ControlUnit
3. RegFile
4. NextState

    a) SignExtend_5to32 

    b) Lefshiftby2  
    
    c) RippleCarryAdder
5. ALU

    a) Mux2to1
    
    b) LogicUnit
    
    c) RippleCarryAdder
6. BranchCheck
7. BranchSelect
8. SignExtend_5to32
9. Mux_32_1

## Testing

All the modules have been tested using these text fixtures :

1. ALUTest
2. BranchCheckTest
3. BranchSelectTest
4. ControlUnitTest
5. DataPathTest
6. LeftShiftBy2Test
7. LogicUnitTest
8. Mux_16_1Test
9. Mux_2_1Test
10. NextStateTest
11. ProgramCounterTest
12. RegFileTest
13. RippleCarryAdderTest
14. SignExtendedTest
15. SignExtend_5to32

The Instructions are fetched by a .COE file linked with the I_Memory module. The instructions for the ISA are written in the .COE file and gives the instruction value.

The Port A options for the I_Memory are :

1. Read Width = 32 

2. Read Depth = 2048 

The Port A options for the D_Memory are :

1. Write Width = 32

2. Write Depth = 2048

## Debugging

For debugging purposes, the outputs of DataPath shown are :

1. All the Control Signals
2. OpCode
3. Function
4. rs (Instruction[25:21])
5. rt (Instruction[20:16])
6. Instruction
7. Program Counter
8. ALUOutput
9. Register File Outputs

