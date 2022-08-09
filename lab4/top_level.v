`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:				Iqra University 
// Engineer: 			Kashif Inayat
// 
// Create Date:    		19-Jan-2011 
// Design Name: 
// Module Name:    top_level 
// Project Name: 
// Target Devices:		Digilent Nexsys 2 board 
// Tool versions: 
// Description: 			This module instantiates "counter_pushbutton.v" and
//					"seven_segments.v".
//
// Dependencies: 			"counter_pushbutton.v"   "seven_segments.v"  "top_level.ucf" 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_level(
	input clk,
	input rst,
	input push_button,
     input updown,
	output [6:0] seven_segment,
	output dp,
	output [3:0] an
    );

	wire [15:0] pc;


	counter_pushbutton counter_pushbutton_inst(
	.clk(clk),
	.rst(rst),
	.push_button(push_button),
      .updown(updown),
	.pc(pc)
    );


	seven_segments seven_segments_inst(
	.clk(clk),
	.word2display(pc),
	.seven_segment(seven_segment),
	.dp(dp),
	.an(an)
    );


endmodule
