`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:		Iqra university 
// Engineer:	Waqar Hussain 
// 
// Create Date:    17:39:01 12/22/2010 
// Design Name: 
// Module Name:    vga_initials_top 
// Project Name: 
// Target Devices:	Digilent Nexsyx 2 board 
// Tool versions: 
// Description: 
//			This module displays the alphabet (represented by key_code) on 640 x 480 pixel monitor
//			screen. Only alphabets are supported.
//
//			INPUTS
//			--clk		50 MHz clk, attached to pin LOC = "B8" in top_level.ucf
//			--reset	Resets the module on low to high edge. Normally low. LOC= "B18" in top_level.ucf
//			--key_code	Corresponding to this code the alphabet is displayed.
//
//			Outputs
//			--hsync	Horixontal synchronication signal. Attached to vga port. same name in top_level.ucf
//			--vsync	Vertical synchronication signal. Attached to vga port. same name in top_level.ucf
//			--red		Represnts red color. Attached to vga port. same name in top_level.ucf
//			--green	Represnts green color. Attached to vga port. same name in top_level.ucf
//			--blue	Represnts blue color. Attached to vga port. same name in top_level.ucf
//
// 	
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//	
//	
//////////////////////////////////////////////////////////////////////////////////


module vga_initials_top(
input wire clk,
input wire  reset,
input wire [7:0] key_code,
output wire hsync,
output wire vsync,
output wire [2:0] red,
output wire [2:0] green,
output wire [1:0] blue
);


wire clr, clk25,vidon;
wire [9:0] hc,vc;
wire [0:31] M;
wire [3:0] rom_addr4;

assign clr = reset;

clkdiv U1 	(
		.mclk(clk),
		.clr(clr),
		.clk25(clk25)
				);
				
vga_640x480 U2	(
		.clk(clk25),
		.clr(clr),
		.hsync(hsync),
		.vsync(vsync),
		.hc(hc),
		.vc(vc),
		.vidon(vidon)
					);
					
vga_initials U3	(
		.vidon(vidon),
		.hc(hc),
		.vc(vc),
		.M(M),
		.sw(8'b10101010),
		.rom_addr4(rom_addr4),
		.red(red),
		.green(green),
		.blue(blue)
						);
						
						
prom_DMH U4	(
		.addr(rom_addr4),
		.M(M),
		.key_code(key_code)
				);


endmodule
