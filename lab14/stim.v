module stim;

//   This module simulates keyboard. It outputs ps2 clock and data
//   signals. It also outputs clk and reset signals which are 
//   required for ps2_rx module At one time, this module simulates
//   only "one key press". Enter the keycode ( of the key that you
//   want to press ) into the register named "key_code2snd"
//
//   Whenever any key is pressed once on keyboard, the keyboard sends the
//   following sequence to ps2_rx module through ps2d pin serially.
//
//   "key code of pressed key   (0.901 microsecond delay)   F0 (hex)  (0.901 microsecond delay)    key code of pressed key" 
//
//
//   Example: If you make key_code2snd = 8'b10101010, then on ps2d
//   pin first 10101010 (binary) comes, then F0 (hex) comes and then again 
//   10101010 (binary) comes.
//
//
//   In this module ps2_rx module is instantiated which is the receving
//   module for ps2 signals
//
//   To know more about ps2 protocol and keyboard signals you make refer
//   to following 
//
//   --Article 9.3 of book FPGA PROTOTYPING BY VERILOG EXAMPLES by
//     PONG P. CHU (Xilinx Spartan 3 version)
//   --http://www.computer-engineering.org/ps2protocol/
//   --http://www.computer-engineering.org/ps2keyboard/
//   
//////////////////////////////////////////////////////////////////////////

    
    reg clk,reset,ps2d,ps2c;
    
    wire [7:0] key_code;
    wire interrupt;
    
    reg [7:0] key_code2snd;
    
    ps2_rx ps2_rx_inst1 
								( 
			.clk(clk), 
			.reset(reset), 
			.ps2d(ps2d),
			.ps2c(ps2c), 
			.key_code(key_code), 
			.interrupt(interrupt) 
								);
							
	always
	#10 clk = ~clk;
	
	
	initial
	   begin
	       
	       /////////   set the key code here that u want to snd   ////////
	       
	       
	       key_code2snd = 8'b10101010;
	       
	       
	       //////////////////////////////////////////////////////////////
	       
	       
	       ps2d = 1'b1;
	       ps2c = 1'b1;
	       clk = 1'b0;
	       reset = 1'b0;
	       #1 reset = 1'b1;
	       #1 reset = 1'b0;
	       
	       
	       
	       ///// now sending the make code (key code of pressed key)
	           
	       #50000 ps2d = 1'b0;       // start bit
	       #1000 ps2c = 1'b0;
	       
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[0];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[1];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[2];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[3];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[4];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[5];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[6];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[7];
	       #39000 ps2c = 1'b0;
	   
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b1;         // parity bit
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b1;         // stop bit
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       
	       
	       
	       // now sending the break code (that is F0 (hex) and then key code)
	       
	       
	       // so first send F0
	       
	       #60000 ps2d = 1'b0;
	       #1000 ps2c = 1'b0;         // start bit
	       
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b10;
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b0;
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b0;
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b0;
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b1;
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b1;
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b1;
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b1;
	       #39000 ps2c = 1'b0;
	   
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b1;         // parity bit
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b1;         // stop bit
	       #39000 ps2c = 1'b0;  
	       #40000 ps2c = 1'b1;
	       
	       
	       
	       
	       /////   now send key code
	       
	       #60000 ps2d = 1'b0;
	       #1000 ps2c = 1'b0;         // start bit
	       
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[0];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[1];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[2];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[3];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[4];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[5];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[6];
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = key_code2snd[7];
	       #39000 ps2c = 1'b0;
	       
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b1;         // parity bit
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       #1000 ps2d = 1'b1;         // stop bit
	       #39000 ps2c = 1'b0;
	       #40000 ps2c = 1'b1;
	       
	       
	       #100000 $stop;      
	   end
	      
endmodule
	    

