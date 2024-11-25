`timescale 1ns / 1ps
module testbench;

    // Declare the signals
    reg Clock, Reset;
    reg [15:0] Value;
    reg [3:0] Dot;
    wire [7:0] Digit;
    wire [7:0] Segment;
    wire [3:0] Selector;

    // Create an instance of the design
    Design_Interface UUT (
        .clock(Clock),
        .reset(Reset),
        .value(Value),
        .selector(Selector),
        .dots(Dot),
        .digit(Digit),
        .segment(Segment)
    );

	// Generate clock signal (5 MHz)
	initial
		begin
			Clock  = 1'b1;
			forever
				#100 Clock  = ~Clock ;
		end

	initial
		begin
			Reset = 1'b0;
			#10000
			Reset = 1'b1;
			#100000
			Reset = 1'b0;
		end
		
	initial
		begin
		    Value = 16'h0000;
		    #110000
		    Value = 16'h1234;
		    #1000000
		    Value = 16'hf4a8;
		    #1000000
		    $stop;
		end
		
	initial
		begin
		    Dot = 4'b0000;
		    #110000
		    Dot = 4'b0101;
		    #1000000
		    Dot = 4'b1111;
		end
endmodule
