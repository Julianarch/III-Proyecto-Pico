`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:33:33 10/27/2016
// Design Name:   Control
// Module Name:   C:/Users/VMWIN7/Desktop/RTC/final/Control_tb.v
// Project Name:  final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] swt;
	reg [7:0] seg;
	reg [7:0] min;
	reg [7:0] hora;
	reg [7:0] dia;
	reg [7:0] mes;
	reg [7:0] year;
	reg [7:0] seg_timer;
	reg [7:0] min_timer;
	reg [7:0] hora_timer;

	// Outputs
	wire dato;
	wire read;
	wire EN_signals;
	wire [7:0] addr_date;
	wire [3:0] reg_select;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.clk(clk), 
		.reset(reset), 
		.swt(swt), 
		.seg(seg), 
		.min(min), 
		.hora(hora), 
		.dia(dia), 
		.mes(mes), 
		.year(year), 
		.seg_timer(seg_timer), 
		.min_timer(min_timer), 
		.hora_timer(hora_timer), 
		.dato(dato), 
		.read(read), 
		.EN_signals(EN_signals), 
		.addr_date(addr_date), 
		.reg_select(reg_select)
	);
always
	begin
		#5 clk = ~clk;
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		swt = 1;
		seg = 1;
		min = 2;
		hora = 3;
		dia = 4;
		mes = 5;
		year = 6;
		seg_timer = 7;
		min_timer = 8;
		hora_timer = 9;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		#12000;
		swt=2;
		min=15;
		#100;
		swt=1;
		#22000;
		$stop;
        
		// Add stimulus here

	end
      
endmodule

