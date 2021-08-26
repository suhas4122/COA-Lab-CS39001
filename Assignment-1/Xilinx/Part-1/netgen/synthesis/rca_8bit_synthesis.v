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
  i_bit1, i_bit2, i_carry, o_sum, o_carry
);
  input i_bit1;
  input i_bit2;
  input i_carry;
  output o_sum;
  output o_carry;
  LUT3 #(
    .INIT ( 8'hE8 ))
  o_carry1 (
    .I0(i_bit2),
    .I1(i_carry),
    .I2(i_bit1),
    .O(o_carry)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  o_sum1 (
    .I0(i_bit1),
    .I1(i_bit2),
    .I2(i_carry),
    .O(o_sum)
  );
endmodule

module full_adder_INST_6 (
  i_bit1, i_bit2, i_carry, o_sum, o_carry
);
  input i_bit1;
  input i_bit2;
  input i_carry;
  output o_sum;
  output o_carry;
  LUT3 #(
    .INIT ( 8'hE8 ))
  o_carry1 (
    .I0(i_bit2),
    .I1(i_carry),
    .I2(i_bit1),
    .O(o_carry)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  o_sum1 (
    .I0(i_bit1),
    .I1(i_bit2),
    .I2(i_carry),
    .O(o_sum)
  );
endmodule

module full_adder_INST_5 (
  i_bit1, i_bit2, i_carry, o_sum, o_carry
);
  input i_bit1;
  input i_bit2;
  input i_carry;
  output o_sum;
  output o_carry;
  LUT3 #(
    .INIT ( 8'hE8 ))
  o_carry1 (
    .I0(i_bit2),
    .I1(i_carry),
    .I2(i_bit1),
    .O(o_carry)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  o_sum1 (
    .I0(i_bit1),
    .I1(i_bit2),
    .I2(i_carry),
    .O(o_sum)
  );
endmodule

module full_adder_INST_4 (
  i_bit1, i_bit2, i_carry, o_sum, o_carry
);
  input i_bit1;
  input i_bit2;
  input i_carry;
  output o_sum;
  output o_carry;
  LUT3 #(
    .INIT ( 8'hE8 ))
  o_carry1 (
    .I0(i_bit2),
    .I1(i_carry),
    .I2(i_bit1),
    .O(o_carry)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  o_sum1 (
    .I0(i_bit1),
    .I1(i_bit2),
    .I2(i_carry),
    .O(o_sum)
  );
endmodule

module full_adder_INST_3 (
  i_bit1, i_bit2, i_carry, o_sum, o_carry
);
  input i_bit1;
  input i_bit2;
  input i_carry;
  output o_sum;
  output o_carry;
  LUT3 #(
    .INIT ( 8'hE8 ))
  o_carry1 (
    .I0(i_bit2),
    .I1(i_carry),
    .I2(i_bit1),
    .O(o_carry)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  o_sum1 (
    .I0(i_bit1),
    .I1(i_bit2),
    .I2(i_carry),
    .O(o_sum)
  );
endmodule

module full_adder_INST_2 (
  i_bit1, i_bit2, i_carry, o_sum, o_carry
);
  input i_bit1;
  input i_bit2;
  input i_carry;
  output o_sum;
  output o_carry;
  LUT3 #(
    .INIT ( 8'hE8 ))
  o_carry1 (
    .I0(i_bit2),
    .I1(i_carry),
    .I2(i_bit1),
    .O(o_carry)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  o_sum1 (
    .I0(i_bit1),
    .I1(i_bit2),
    .I2(i_carry),
    .O(o_sum)
  );
endmodule

module full_adder_INST_1 (
  i_bit1, i_bit2, i_carry, o_sum, o_carry
);
  input i_bit1;
  input i_bit2;
  input i_carry;
  output o_sum;
  output o_carry;
  LUT3 #(
    .INIT ( 8'hE8 ))
  o_carry1 (
    .I0(i_bit2),
    .I1(i_carry),
    .I2(i_bit1),
    .O(o_carry)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  o_sum1 (
    .I0(i_bit1),
    .I1(i_bit2),
    .I2(i_carry),
    .O(o_sum)
  );
endmodule

module full_adder (
  i_bit1, i_bit2, i_carry, o_sum, o_carry
);
  input i_bit1;
  input i_bit2;
  input i_carry;
  output o_sum;
  output o_carry;
  LUT3 #(
    .INIT ( 8'hE8 ))
  o_carry1 (
    .I0(i_bit2),
    .I1(i_carry),
    .I2(i_bit1),
    .O(o_carry)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  o_sum1 (
    .I0(i_bit1),
    .I1(i_bit2),
    .I2(i_carry),
    .O(o_sum)
  );
endmodule

module rca_8bit (
  i_carry, o_carry, i_term1, i_term2, o_sum
);
  input i_carry;
  output o_carry;
  input [7 : 0] i_term1;
  input [7 : 0] i_term2;
  output [7 : 0] o_sum;
  wire i_term1_0_IBUF_40;
  wire i_term1_1_IBUF_41;
  wire i_term1_2_IBUF_42;
  wire i_term1_3_IBUF_43;
  wire i_term1_4_IBUF_44;
  wire i_term1_5_IBUF_45;
  wire i_term1_6_IBUF_46;
  wire i_term1_7_IBUF_47;
  wire i_term2_0_IBUF_48;
  wire i_term2_1_IBUF_49;
  wire i_term2_2_IBUF_50;
  wire i_term2_3_IBUF_51;
  wire i_term2_4_IBUF_52;
  wire i_term2_5_IBUF_53;
  wire i_term2_6_IBUF_54;
  wire i_term2_7_IBUF_55;
  wire i_carry_IBUF_56;
  wire o_sum_0_OBUF_57;
  wire o_sum_1_OBUF_59;
  wire o_sum_2_OBUF_61;
  wire o_sum_3_OBUF_63;
  wire o_sum_4_OBUF_65;
  wire o_sum_5_OBUF_67;
  wire o_sum_6_OBUF_69;
  wire o_sum_7_OBUF_71;
  wire o_carry_OBUF_72;
  wire [6 : 0] w_temp;
  full_adder   full_adder8 (
    .i_bit1(i_term1_7_IBUF_47),
    .i_bit2(i_term2_7_IBUF_55),
    .i_carry(w_temp[6]),
    .o_sum(o_sum_7_OBUF_71),
    .o_carry(o_carry_OBUF_72)
  );
  full_adder_INST_1   full_adder7 (
    .i_bit1(i_term1_6_IBUF_46),
    .i_bit2(i_term2_6_IBUF_54),
    .i_carry(w_temp[5]),
    .o_sum(o_sum_6_OBUF_69),
    .o_carry(w_temp[6])
  );
  full_adder_INST_2   full_adder6 (
    .i_bit1(i_term1_5_IBUF_45),
    .i_bit2(i_term2_5_IBUF_53),
    .i_carry(w_temp[4]),
    .o_sum(o_sum_5_OBUF_67),
    .o_carry(w_temp[5])
  );
  full_adder_INST_3   full_adder5 (
    .i_bit1(i_term1_4_IBUF_44),
    .i_bit2(i_term2_4_IBUF_52),
    .i_carry(w_temp[3]),
    .o_sum(o_sum_4_OBUF_65),
    .o_carry(w_temp[4])
  );
  full_adder_INST_4   full_adder4 (
    .i_bit1(i_term1_3_IBUF_43),
    .i_bit2(i_term2_3_IBUF_51),
    .i_carry(w_temp[2]),
    .o_sum(o_sum_3_OBUF_63),
    .o_carry(w_temp[3])
  );
  full_adder_INST_5   full_adder3 (
    .i_bit1(i_term1_2_IBUF_42),
    .i_bit2(i_term2_2_IBUF_50),
    .i_carry(w_temp[1]),
    .o_sum(o_sum_2_OBUF_61),
    .o_carry(w_temp[2])
  );
  full_adder_INST_6   full_adder2 (
    .i_bit1(i_term1_1_IBUF_41),
    .i_bit2(i_term2_1_IBUF_49),
    .i_carry(w_temp[0]),
    .o_sum(o_sum_1_OBUF_59),
    .o_carry(w_temp[1])
  );
  full_adder_INST_7   full_adder1 (
    .i_bit1(i_term1_0_IBUF_40),
    .i_bit2(i_term2_0_IBUF_48),
    .i_carry(i_carry_IBUF_56),
    .o_sum(o_sum_0_OBUF_57),
    .o_carry(w_temp[0])
  );
  IBUF   i_term1_7_IBUF (
    .I(i_term1[7]),
    .O(i_term1_7_IBUF_47)
  );
  IBUF   i_term1_6_IBUF (
    .I(i_term1[6]),
    .O(i_term1_6_IBUF_46)
  );
  IBUF   i_term1_5_IBUF (
    .I(i_term1[5]),
    .O(i_term1_5_IBUF_45)
  );
  IBUF   i_term1_4_IBUF (
    .I(i_term1[4]),
    .O(i_term1_4_IBUF_44)
  );
  IBUF   i_term1_3_IBUF (
    .I(i_term1[3]),
    .O(i_term1_3_IBUF_43)
  );
  IBUF   i_term1_2_IBUF (
    .I(i_term1[2]),
    .O(i_term1_2_IBUF_42)
  );
  IBUF   i_term1_1_IBUF (
    .I(i_term1[1]),
    .O(i_term1_1_IBUF_41)
  );
  IBUF   i_term1_0_IBUF (
    .I(i_term1[0]),
    .O(i_term1_0_IBUF_40)
  );
  IBUF   i_term2_7_IBUF (
    .I(i_term2[7]),
    .O(i_term2_7_IBUF_55)
  );
  IBUF   i_term2_6_IBUF (
    .I(i_term2[6]),
    .O(i_term2_6_IBUF_54)
  );
  IBUF   i_term2_5_IBUF (
    .I(i_term2[5]),
    .O(i_term2_5_IBUF_53)
  );
  IBUF   i_term2_4_IBUF (
    .I(i_term2[4]),
    .O(i_term2_4_IBUF_52)
  );
  IBUF   i_term2_3_IBUF (
    .I(i_term2[3]),
    .O(i_term2_3_IBUF_51)
  );
  IBUF   i_term2_2_IBUF (
    .I(i_term2[2]),
    .O(i_term2_2_IBUF_50)
  );
  IBUF   i_term2_1_IBUF (
    .I(i_term2[1]),
    .O(i_term2_1_IBUF_49)
  );
  IBUF   i_term2_0_IBUF (
    .I(i_term2[0]),
    .O(i_term2_0_IBUF_48)
  );
  IBUF   i_carry_IBUF (
    .I(i_carry),
    .O(i_carry_IBUF_56)
  );
  OBUF   o_sum_7_OBUF (
    .I(o_sum_7_OBUF_71),
    .O(o_sum[7])
  );
  OBUF   o_sum_6_OBUF (
    .I(o_sum_6_OBUF_69),
    .O(o_sum[6])
  );
  OBUF   o_sum_5_OBUF (
    .I(o_sum_5_OBUF_67),
    .O(o_sum[5])
  );
  OBUF   o_sum_4_OBUF (
    .I(o_sum_4_OBUF_65),
    .O(o_sum[4])
  );
  OBUF   o_sum_3_OBUF (
    .I(o_sum_3_OBUF_63),
    .O(o_sum[3])
  );
  OBUF   o_sum_2_OBUF (
    .I(o_sum_2_OBUF_61),
    .O(o_sum[2])
  );
  OBUF   o_sum_1_OBUF (
    .I(o_sum_1_OBUF_59),
    .O(o_sum[1])
  );
  OBUF   o_sum_0_OBUF (
    .I(o_sum_0_OBUF_57),
    .O(o_sum[0])
  );
  OBUF   o_carry_OBUF (
    .I(o_carry_OBUF_72),
    .O(o_carry)
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

