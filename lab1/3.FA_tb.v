module test;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire s;
	wire cout;

	integer i;
	
	// Instantiate the Unit Under Test (UUT)
	fulladder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.s(s), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;
	end

	always @ ( a, b, cin )
		begin
       
                // generate truth table
		for ( i = 0; i < 8; i = i + 1 )
                        // every 10 ns set a, b, and cin to the binary rep. of i
			#10 {a, b, cin} = i;
			
                // stop 10ns after last change of inputs
		#10 $stop;
		end

      
endmodule