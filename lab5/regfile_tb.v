`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:            Iqra University 
// Engineer:           Kashif Inayat
// 
// Create Date:          18-Jan-2011 
// Design Name: 
// Module Name:          counter_pushbutton 
// Project Name: 
// Tool versions: 
// Description:          This module implements a counter which increments
//                       whenever a "push_button" is pressed. This ciruit employs
//                        asynchronous reset. Whenever reset is pressed the counter
//                        value becomes zero.
//
//                        INPUTS
//                        -clk
//                        -rst   for reset. Resets circuit on positive edge of rst
//                        -push_button   This signal is made high (i.e pressed) to
//                                       increment the counter
//
//                        OUTPUTS
//                        -pc   The output counter value (9 bits)
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////



module regfile_tb;

	// Inputs
	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg [4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	// Outputs
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		// Initialize Inputs
		ReadRegister1 = 0;
		ReadRegister2 = 0;
		WriteRegister = 0;
		WriteData = 0;
		RegWrite = 0;
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//Add read and write cases here 

	end
      
endmodule

