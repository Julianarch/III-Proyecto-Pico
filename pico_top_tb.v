`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:30:16 10/30/2016
// Design Name:   pico_top
// Module Name:   C:/Users/VMWIN7/Desktop/RTC/final/pico_top_tb.v
// Project Name:  final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pico_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pico_top_tb;

	// Inputs
	reg clk;
	reg [7:0] in_port_pr;

	// Outputs
	wire [7:0] id_port_pr;
	wire [7:0] out_port_pr;
	wire write_s;
	wire read_s;

	// Instantiate the Unit Under Test (UUT)
	pico_top uut (
		.clk(clk), 
		.in_port_pr(in_port_pr), 
		.id_port_pr(id_port_pr), 
		.out_port_pr(out_port_pr), 
		.write_s(write_s), 
		.read_s(read_s)
	);
always
	begin
		#5 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		in_port_pr = 8'h00;

		// Wait 100 ns for global reset to finish
		#500;
		in_port_pr = 8'h06;
		#1400;
		in_port_pr = 8'h76;
		#2000;
        
		// Add stimulus here
		$stop;

	end
      
endmodule

