# KGP-RISC
**Group 8**  
**SUHAS JAIN - 19CS30048**  
**MONAL PRASAD - 19CS30030**    
<br /> 
This is a 32-bit Single Cycle CPU (RISC Architecture) designed using Verilog synthesised in Xilinx ISE 14.7.    
This document contains the  folder structure and running instructions of the processor on Xilinx ISE 14.7. 
## Folder Structure and File Distribution 
- **Source Codes**  
Folder containing all the necessary verilog files required for the processor.
- **Test Benches**   
Verilog test benches for all the files in the "Source Code" folder.
- **BRAM Files**  
Folder containing .v and .xco files for both the instruction memory as well as data memory.
- **Testing Files**  
Contains both assembly codes and the memory initialisation coe files needed to test the project. 
- **KGP-RISC Documentation.pdf**  
PDF file containing the details about the Instruction Set Architecture (ISA), truth table of the control signals as well as diagrams of all the necessary modules. 
- **Test Report.pdf**  
PDF file containing the simulation results and details about all the tests that were run on the processor simulation.  
## Running Instructions 
- **For Simulation on Xilinx ISE 14.7**
	- Open the software and create a new project with the desired name. 
	- Load all the files from the folder ***Source Codes*** using add source option.
	- Load all the memory files from the ***BRAM Files*** folder.
	- Initialise the memory files (both data and instruction memory) with appropriate COE files according to the test that is being run.
	- Load ***KGPRISC_tb.v*** file from the ***Test Benches*** folder and set appropriate stop condition (details in ***Test Report.pdf***). 
	- Make sure that simulation run time is set to big enough value (can be set from ***process properties*** option).
	- Click on ***Simulate Behavioural Model*** button, results open up in a new window. 