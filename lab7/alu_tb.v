`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:17:52 05/28/2018
// Design Name:   alu
// Module Name:   F:/project1/alu_tb.v
// Project Name:  project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg [3:0] ctl;
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [31:0] out;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.ctl(ctl), 
		.a(a), 
		.b(b), 
		.out(out), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		ctl = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
                //Add values of ctl signal and a and b

	end
      
endmodule

