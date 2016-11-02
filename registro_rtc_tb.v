`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:11:54 10/26/2016
// Design Name:   registro_rtc
// Module Name:   C:/Users/VMWIN7/Desktop/RTC/final/registro_rtc_tb.v
// Project Name:  final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: registro_rtc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module registro_rtc_tb;

	// Inputs
	reg clk;
	reg reset;
	reg LL_signal;
	reg [3:0] reg_select;
	reg [7:0] dato_rtc;

	// Outputs
	wire [7:0] seg_rtc;
	wire [7:0] min_rtc;
	wire [7:0] hora_rtc;
	wire [7:0] dia_rtc;
	wire [7:0] mes_rtc;
	wire [7:0] year_rtc;
	wire [7:0] seg_tim_rtc;
	wire [7:0] min_tim_rtc;
	wire [7:0] hora_tim_rtc;

	// Instantiate the Unit Under Test (UUT)
	registro_rtc uut (
		.clk(clk), 
		.reset(reset), 
		.LL_signal(LL_signal), 
		.reg_select(reg_select), 
		.dato_rtc(dato_rtc), 
		.seg_rtc(seg_rtc), 
		.min_rtc(min_rtc), 
		.hora_rtc(hora_rtc), 
		.dia_rtc(dia_rtc), 
		.mes_rtc(mes_rtc), 
		.year_rtc(year_rtc), 
		.seg_tim_rtc(seg_tim_rtc), 
		.min_tim_rtc(min_tim_rtc), 
		.hora_tim_rtc(hora_tim_rtc)
	);
always
	begin
		#5 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		LL_signal = 0;
		reg_select = 0;
		dato_rtc = 1;

		// Wait 100 ns for global reset to finish
		#100;
      reset = 0;
		// Add stimulus here
		#100;
      LL_signal = 0;
		reg_select = 1;
		dato_rtc = 2;
		
		#100;
      LL_signal = 1;
		
		#100;
      LL_signal = 0;
		reg_select = 2;
		dato_rtc = 3;
		
		#100;
      LL_signal = 1;
		
		#100;
      LL_signal = 0;
		reg_select = 3;
		dato_rtc = 4;
		
		#100;
      LL_signal = 1;
		
		#100;
      LL_signal = 0;
		reg_select = 4;
		dato_rtc = 5;
		
		#100;
      LL_signal = 1;
		
		#100;
      LL_signal = 0;
		reg_select = 5;
		dato_rtc = 6;
		
		#100;
      LL_signal = 1;
		
		#100;
      LL_signal = 0;
		reg_select = 6;
		dato_rtc = 7;
		
		#100;
      LL_signal = 1;
		
		#100;
      LL_signal = 0;
		reg_select = 7;
		dato_rtc = 8;
		
		#100;
      LL_signal = 1;
		
		#100;
      LL_signal = 0;
		reg_select = 8;
		dato_rtc = 9;
		
		#100;
      LL_signal = 1;
		
		#100;
      LL_signal = 0;
		reg_select = 9;
		dato_rtc = 10;
		
		#100;
      LL_signal = 1;
		
		#100;
      LL_signal = 0;
		reg_select = 1;
		dato_rtc = 11;
		
		#100;
      LL_signal = 1;
		#100;
		
		$stop;
	end
      
endmodule

