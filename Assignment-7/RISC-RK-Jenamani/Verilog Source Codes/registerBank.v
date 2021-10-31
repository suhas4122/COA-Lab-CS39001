`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:48 10/16/2019 
// Design Name: 
// Module Name:    registerBank 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module registerBank(
    input writeBool,					//enable for writing to register
    input [4:0] writeAddress,		//address of register to write to
    input [31:0] writeData,		//data to write to register
    input [4:0] reg_1_Address,	//address of rs
    input [4:0] reg_2_Address,	//address of rt
    input clk,
    input reset,
    output [31:0] reg_1_Data,		//value read from rs
    output [31:0] reg_2_Data		//value read from rt
    );
	 

/*	reg [31:0] regArray [31:0];
	integer i; 
	
	initial
		begin
			for(i=0;i<32;i=i+1)//Initialising all the registers to zero upon reset
				regArray[i] = 32'd0;
			regArray[1] = 32'd3;
			regArray[2] = 32'd7;		
		end

	always @ (posedge clk)
	begin
		if(reset)
		begin
			for(i=0;i<32;i=i+1)//Initialising all the registers to zero upon reset
				regArray[i] = 32'd0;
		end
		else
		begin
			if(writeBool) 
			begin
				regArray[writeAddress] = writeData;
			end
		end
	end
	assign reg_1_Data = regArray[reg_1_Address]; // data output
	assign reg_2_Data = regArray[reg_2_Address]; //data output
*/

	reg [31:0] bank [31:0];			//creating register bank
	integer i; 
	
	initial
		begin
			for(i=0;i<32;i=i+1)	//initialising all registers to 0
				bank[i] = 32'b00000000000000000000000000000000;
				

				// just for checking
				/*
				bank[0][1] = 1'b1;
				bank[1][1] = 1'b1;
			
				bank[1][2] = 1'b1;
				
				bank[0][3] = 1'b1;
				
				bank[0][4] = 1'b1;
				bank[1][4] = 1'b1;
				bank[2][4] = 1'b1;
				*/
		end	

	always @(posedge clk)
	begin
	 
		if(reset)
			for(i=0;i<32;i=i+1)	//initialising all registers to 0
				bank[i] = 32'b00000000000000000000000000000000;
				
		else if(writeBool) 		//if write is enabled
				for(i=0;i<32;i=i+1)
					bank[i][writeAddress] = writeData[i];

	end
	
	//assign reg_1_Data = bank[reg_1_Address];		//read both rs,

	MUX mux_1_0(bank[0],reg_1_Address[4:0],reg_1_Data[0]);
	MUX mux_1_1(bank[1],reg_1_Address[4:0],reg_1_Data[1]);
	MUX mux_1_2(bank[2],reg_1_Address[4:0],reg_1_Data[2]);
	MUX mux_1_3(bank[3],reg_1_Address[4:0],reg_1_Data[3]);
	MUX mux_1_4(bank[4],reg_1_Address[4:0],reg_1_Data[4]);
	MUX mux_1_5(bank[5],reg_1_Address[4:0],reg_1_Data[5]);
	MUX mux_1_6(bank[6],reg_1_Address[4:0],reg_1_Data[6]);
	MUX mux_1_7(bank[7],reg_1_Address[4:0],reg_1_Data[7]);
	MUX mux_1_8(bank[8],reg_1_Address[4:0],reg_1_Data[8]);
	MUX mux_1_9(bank[9],reg_1_Address[4:0],reg_1_Data[9]);
	MUX mux_1_10(bank[10],reg_1_Address[4:0],reg_1_Data[10]);
	MUX mux_1_11(bank[11],reg_1_Address[4:0],reg_1_Data[11]);
	MUX mux_1_12(bank[12],reg_1_Address[4:0],reg_1_Data[12]);
	MUX mux_1_13(bank[13],reg_1_Address[4:0],reg_1_Data[13]);
	MUX mux_1_14(bank[14],reg_1_Address[4:0],reg_1_Data[14]);
	MUX mux_1_15(bank[15],reg_1_Address[4:0],reg_1_Data[15]);
	MUX mux_1_16(bank[16],reg_1_Address[4:0],reg_1_Data[16]);
	MUX mux_1_17(bank[17],reg_1_Address[4:0],reg_1_Data[17]);
	MUX mux_1_18(bank[18],reg_1_Address[4:0],reg_1_Data[18]);
	MUX mux_1_19(bank[19],reg_1_Address[4:0],reg_1_Data[19]);
	MUX mux_1_20(bank[20],reg_1_Address[4:0],reg_1_Data[20]);
	MUX mux_1_21(bank[21],reg_1_Address[4:0],reg_1_Data[21]);
	MUX mux_1_22(bank[22],reg_1_Address[4:0],reg_1_Data[22]);
	MUX mux_1_23(bank[23],reg_1_Address[4:0],reg_1_Data[23]);
	MUX mux_1_24(bank[24],reg_1_Address[4:0],reg_1_Data[24]);
	MUX mux_1_25(bank[25],reg_1_Address[4:0],reg_1_Data[25]);
	MUX mux_1_26(bank[26],reg_1_Address[4:0],reg_1_Data[26]);
	MUX mux_1_27(bank[27],reg_1_Address[4:0],reg_1_Data[27]);
	MUX mux_1_28(bank[28],reg_1_Address[4:0],reg_1_Data[28]);
	MUX mux_1_29(bank[29],reg_1_Address[4:0],reg_1_Data[29]);
	MUX mux_1_30(bank[30],reg_1_Address[4:0],reg_1_Data[30]);
	MUX mux_1_31(bank[31],reg_1_Address[4:0],reg_1_Data[31]);
		

		//assign reg_2_Data = bank[reg_2_Address];		//and rt

	MUX mux_2_0(bank[0],reg_2_Address[4:0],reg_2_Data[0]);
	MUX mux_2_1(bank[1],reg_2_Address[4:0],reg_2_Data[1]);
	MUX mux_2_2(bank[2],reg_2_Address[4:0],reg_2_Data[2]);
	MUX mux_2_3(bank[3],reg_2_Address[4:0],reg_2_Data[3]);
	MUX mux_2_4(bank[4],reg_2_Address[4:0],reg_2_Data[4]);
	MUX mux_2_5(bank[5],reg_2_Address[4:0],reg_2_Data[5]);
	MUX mux_2_6(bank[6],reg_2_Address[4:0],reg_2_Data[6]);
	MUX mux_2_7(bank[7],reg_2_Address[4:0],reg_2_Data[7]);
	MUX mux_2_8(bank[8],reg_2_Address[4:0],reg_2_Data[8]);
	MUX mux_2_9(bank[9],reg_2_Address[4:0],reg_2_Data[9]);
	MUX mux_2_10(bank[10],reg_2_Address[4:0],reg_2_Data[10]);
	MUX mux_2_11(bank[11],reg_2_Address[4:0],reg_2_Data[11]);
	MUX mux_2_12(bank[12],reg_2_Address[4:0],reg_2_Data[12]);
	MUX mux_2_13(bank[13],reg_2_Address[4:0],reg_2_Data[13]);
	MUX mux_2_14(bank[14],reg_2_Address[4:0],reg_2_Data[14]);
	MUX mux_2_15(bank[15],reg_2_Address[4:0],reg_2_Data[15]);
	MUX mux_2_16(bank[16],reg_2_Address[4:0],reg_2_Data[16]);
	MUX mux_2_17(bank[17],reg_2_Address[4:0],reg_2_Data[17]);
	MUX mux_2_18(bank[18],reg_2_Address[4:0],reg_2_Data[18]);
	MUX mux_2_19(bank[19],reg_2_Address[4:0],reg_2_Data[19]);
	MUX mux_2_20(bank[20],reg_2_Address[4:0],reg_2_Data[20]);
	MUX mux_2_21(bank[21],reg_2_Address[4:0],reg_2_Data[21]);
	MUX mux_2_22(bank[22],reg_2_Address[4:0],reg_2_Data[22]);
	MUX mux_2_23(bank[23],reg_2_Address[4:0],reg_2_Data[23]);
	MUX mux_2_24(bank[24],reg_2_Address[4:0],reg_2_Data[24]);
	MUX mux_2_25(bank[25],reg_2_Address[4:0],reg_2_Data[25]);
	MUX mux_2_26(bank[26],reg_2_Address[4:0],reg_2_Data[26]);
	MUX mux_2_27(bank[27],reg_2_Address[4:0],reg_2_Data[27]);
	MUX mux_2_28(bank[28],reg_2_Address[4:0],reg_2_Data[28]);
	MUX mux_2_29(bank[29],reg_2_Address[4:0],reg_2_Data[29]);
	MUX mux_2_30(bank[30],reg_2_Address[4:0],reg_2_Data[30]);
	MUX mux_2_31(bank[31],reg_2_Address[4:0],reg_2_Data[31]);

endmodule
