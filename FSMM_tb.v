`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:08:01 10/30/2016
// Design Name:   FSMM
// Module Name:   C:/Users/VMWIN7/Desktop/RTC/final/FSMM_tb.v
// Project Name:  final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSMM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSMM_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] key_code;

	// Outputs
	wire CS;
	wire AD;
	wire WR;
	wire RD;
	wire [7:0] swt_pr;
	wire [7:0] envio_pr;
	wire [7:0] operacion_pr;
	wire pixel_xlast;
	wire pixel_ylast;
	wire [2:0] rgb_text;
	wire hsync;
	wire vsync;

	// Bidirs
	wire [7:0] RTC_BUS;

	// Instantiate the Unit Under Test (UUT)
	FSMM uut (
		.RTC_BUS(RTC_BUS), 
		.clk(clk), 
		.reset(reset), 
		.key_code(key_code), 
		.CS(CS), 
		.AD(AD), 
		.WR(WR), 
		.RD(RD), 
		.swt_pr(swt_pr), 
		.envio_pr(envio_pr), 
		.operacion_pr(operacion_pr), 
		.pixel_xlast(pixel_xlast), 
		.pixel_ylast(pixel_ylast), 
		.rgb_text(rgb_text), 
		.hsync(hsync), 
		.vsync(vsync)
	);
always 
	begin
		#5 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		key_code = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
        
		// Add stimulus here
		#12500;
		key_code = 8'h05;
		#10000;
		key_code = 8'h76;
		#10000;
		$stop;
	end
      
endmodule

