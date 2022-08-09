module fulladder (
	 input a,
	 input b,
	 input cin,
	 output s,
	 output cout );
	 
         // wires (from ands to or)
	 wire w1, w2, w3;
	 
         // carry-out circuitry
	 and( w1, a, b );
	 and( w2, a, cin );
	 and( w3, b, cin );
	 or( cout, w1, w2, w3 );
	 
         // sum
	 xor( s, a, b, cin );

endmodule