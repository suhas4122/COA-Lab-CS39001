////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: rca_8bit_synthesis.v
// /___/   /\     Timestamp: Thu Aug 26 13:54:58 2021
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim rca_8bit.ngc rca_8bit_synthesis.v 
// Device	: xc7a100t-1-csg324
// Input file	: rca_8bit.ngc
// Output file	: /home/suhas/Desktop/Semester-5/COA/COAA-Lab-Sem-5/Assignment-1/Xilinx/Part-1/netgen/synthesis/rca_8bit_synthesis.v
// # of Modules	: 9
// Design Name	: rca_8bit
// Xilinx        : /opt/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module full_adder_INST_7 (
  A, B, Ci, S, Co
);
  input A;
  input B;
  input Ci;
  output S;
  output Co;
  LUT3 #(
    .INIT ( 8'hE8 ))
  Co1 (
    .I0(B),
    .I1(Ci),
    .I2(A),
    .O(Co)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  S1 (
    .I0(A),
    .I1(B),
    .I2(Ci),
    .O(S)
  );
endmodule

module full_adder_INST_6 (
  A, B, Ci, S, Co
);
  input A;
  input B;
  input Ci;
  output S;
  output Co;
  LUT3 #(
    .INIT ( 8'hE8 ))
  Co1 (
    .I0(B),
    .I1(Ci),
    .I2(A),
    .O(Co)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  S1 (
    .I0(A),
    .I1(B),
    .I2(Ci),
    .O(S)
  );
endmodule

module full_adder_INST_5 (
  A, B, Ci, S, Co
);
  input A;
  input B;
  input Ci;
  output S;
  output Co;
  LUT3 #(
    .INIT ( 8'hE8 ))
  Co1 (
    .I0(B),
    .I1(Ci),
    .I2(A),
    .O(Co)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  S1 (
    .I0(A),
    .I1(B),
    .I2(Ci),
    .O(S)
  );
endmodule

module full_adder_INST_4 (
  A, B, Ci, S, Co
);
  input A;
  input B;
  input Ci;
  output S;
  output Co;
  LUT3 #(
    .INIT ( 8'hE8 ))
  Co1 (
    .I0(B),
    .I1(Ci),
    .I2(A),
    .O(Co)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  S1 (
    .I0(A),
    .I1(B),
    .I2(Ci),
    .O(S)
  );
endmodule

module full_adder_INST_3 (
  A, B, Ci, S, Co
);
  input A;
  input B;
  input Ci;
  output S;
  output Co;
  LUT3 #(
    .INIT ( 8'hE8 ))
  Co1 (
    .I0(B),
    .I1(Ci),
    .I2(A),
    .O(Co)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  S1 (
    .I0(A),
    .I1(B),
    .I2(Ci),
    .O(S)
  );
endmodule

module full_adder_INST_2 (
  A, B, Ci, S, Co
);
  input A;
  input B;
  input Ci;
  output S;
  output Co;
  LUT3 #(
    .INIT ( 8'hE8 ))
  Co1 (
    .I0(B),
    .I1(Ci),
    .I2(A),
    .O(Co)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  S1 (
    .I0(A),
    .I1(B),
    .I2(Ci),
    .O(S)
  );
endmodule

module full_adder_INST_1 (
  A, B, Ci, S, Co
);
  input A;
  input B;
  input Ci;
  output S;
  output Co;
  LUT3 #(
    .INIT ( 8'hE8 ))
  Co1 (
    .I0(B),
    .I1(Ci),
    .I2(A),
    .O(Co)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  S1 (
    .I0(A),
    .I1(B),
    .I2(Ci),
    .O(S)
  );
endmodule

module full_adder (
  A, B, Ci, S, Co
);
  input A;
  input B;
  input Ci;
  output S;
  output Co;
  LUT3 #(
    .INIT ( 8'hE8 ))
  Co1 (
    .I0(B),
    .I1(Ci),
    .I2(A),
    .O(Co)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  S1 (
    .I0(A),
    .I1(B),
    .I2(Ci),
    .O(S)
  );
endmodule

module rca_8bit (
  Ci, Co, A, B, S
);
  input Ci;
  output Co;
  input [7 : 0] A;
  input [7 : 0] B;
  output [7 : 0] S;
  wire A_0_IBUF_40;
  wire A_1_IBUF_41;
  wire A_2_IBUF_42;
  wire A_3_IBUF_43;
  wire A_4_IBUF_44;
  wire A_5_IBUF_45;
  wire A_6_IBUF_46;
  wire A_7_IBUF_47;
  wire B_0_IBUF_48;
  wire B_1_IBUF_49;
  wire B_2_IBUF_50;
  wire B_3_IBUF_51;
  wire B_4_IBUF_52;
  wire B_5_IBUF_53;
  wire B_6_IBUF_54;
  wire B_7_IBUF_55;
  wire Ci_IBUF_56;
  wire S_0_OBUF_57;
  wire S_1_OBUF_59;
  wire S_2_OBUF_61;
  wire S_3_OBUF_63;
  wire S_4_OBUF_65;
  wire S_5_OBUF_67;
  wire S_6_OBUF_69;
  wire S_7_OBUF_71;
  wire Co_OBUF_72;
  wire [6 : 0] w_temp;
  full_adder   full_adder8 (
    .A(A_7_IBUF_47),
    .B(B_7_IBUF_55),
    .Ci(w_temp[6]),
    .S(S_7_OBUF_71),
    .Co(Co_OBUF_72)
  );
  full_adder_INST_1   full_adder7 (
    .A(A_6_IBUF_46),
    .B(B_6_IBUF_54),
    .Ci(w_temp[5]),
    .S(S_6_OBUF_69),
    .Co(w_temp[6])
  );
  full_adder_INST_2   full_adder6 (
    .A(A_5_IBUF_45),
    .B(B_5_IBUF_53),
    .Ci(w_temp[4]),
    .S(S_5_OBUF_67),
    .Co(w_temp[5])
  );
  full_adder_INST_3   full_adder5 (
    .A(A_4_IBUF_44),
    .B(B_4_IBUF_52),
    .Ci(w_temp[3]),
    .S(S_4_OBUF_65),
    .Co(w_temp[4])
  );
  full_adder_INST_4   full_adder4 (
    .A(A_3_IBUF_43),
    .B(B_3_IBUF_51),
    .Ci(w_temp[2]),
    .S(S_3_OBUF_63),
    .Co(w_temp[3])
  );
  full_adder_INST_5   full_adder3 (
    .A(A_2_IBUF_42),
    .B(B_2_IBUF_50),
    .Ci(w_temp[1]),
    .S(S_2_OBUF_61),
    .Co(w_temp[2])
  );
  full_adder_INST_6   full_adder2 (
    .A(A_1_IBUF_41),
    .B(B_1_IBUF_49),
    .Ci(w_temp[0]),
    .S(S_1_OBUF_59),
    .Co(w_temp[1])
  );
  full_adder_INST_7   full_adder1 (
    .A(A_0_IBUF_40),
    .B(B_0_IBUF_48),
    .Ci(Ci_IBUF_56),
    .S(S_0_OBUF_57),
    .Co(w_temp[0])
  );
  IBUF   A_7_IBUF (
    .I(A[7]),
    .O(A_7_IBUF_47)
  );
  IBUF   A_6_IBUF (
    .I(A[6]),
    .O(A_6_IBUF_46)
  );
  IBUF   A_5_IBUF (
    .I(A[5]),
    .O(A_5_IBUF_45)
  );
  IBUF   A_4_IBUF (
    .I(A[4]),
    .O(A_4_IBUF_44)
  );
  IBUF   A_3_IBUF (
    .I(A[3]),
    .O(A_3_IBUF_43)
  );
  IBUF   A_2_IBUF (
    .I(A[2]),
    .O(A_2_IBUF_42)
  );
  IBUF   A_1_IBUF (
    .I(A[1]),
    .O(A_1_IBUF_41)
  );
  IBUF   A_0_IBUF (
    .I(A[0]),
    .O(A_0_IBUF_40)
  );
  IBUF   B_7_IBUF (
    .I(B[7]),
    .O(B_7_IBUF_55)
  );
  IBUF   B_6_IBUF (
    .I(B[6]),
    .O(B_6_IBUF_54)
  );
  IBUF   B_5_IBUF (
    .I(B[5]),
    .O(B_5_IBUF_53)
  );
  IBUF   B_4_IBUF (
    .I(B[4]),
    .O(B_4_IBUF_52)
  );
  IBUF   B_3_IBUF (
    .I(B[3]),
    .O(B_3_IBUF_51)
  );
  IBUF   B_2_IBUF (
    .I(B[2]),
    .O(B_2_IBUF_50)
  );
  IBUF   B_1_IBUF (
    .I(B[1]),
    .O(B_1_IBUF_49)
  );
  IBUF   B_0_IBUF (
    .I(B[0]),
    .O(B_0_IBUF_48)
  );
  IBUF   Ci_IBUF (
    .I(Ci),
    .O(Ci_IBUF_56)
  );
  OBUF   S_7_OBUF (
    .I(S_7_OBUF_71),
    .O(S[7])
  );
  OBUF   S_6_OBUF (
    .I(S_6_OBUF_69),
    .O(S[6])
  );
  OBUF   S_5_OBUF (
    .I(S_5_OBUF_67),
    .O(S[5])
  );
  OBUF   S_4_OBUF (
    .I(S_4_OBUF_65),
    .O(S[4])
  );
  OBUF   S_3_OBUF (
    .I(S_3_OBUF_63),
    .O(S[3])
  );
  OBUF   S_2_OBUF (
    .I(S_2_OBUF_61),
    .O(S[2])
  );
  OBUF   S_1_OBUF (
    .I(S_1_OBUF_59),
    .O(S[1])
  );
  OBUF   S_0_OBUF (
    .I(S_0_OBUF_57),
    .O(S[0])
  );
  OBUF   Co_OBUF (
    .I(Co_OBUF_72),
    .O(Co)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

