`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:32:58 10/26/2016
// Design Name:   mux_inpico
// Module Name:   C:/Users/VMWIN7/Desktop/RTC/final/mux_inpico_tb.v
// Project Name:  final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_inpico
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_inpico_tb;

	// Inputs
	reg [7:0] seg_rtc;
	reg [7:0] min_rtc;
	reg [7:0] hora_rtc;
	reg [7:0] dia_rtc;
	reg [7:0] mes_rtc;
	reg [7:0] year_rtc;
	reg [7:0] seg_tim_rtc;
	reg [7:0] min_tim_rtc;
	reg [7:0] hora_tim_rtc;
	reg [7:0] tecla;
	reg [7:0] id_port;

	// Outputs
	wire [7:0] dato_inpico;

	// Instantiate the Unit Under Test (UUT)
	mux_inpico uut (
		.seg_rtc(seg_rtc), 
		.min_rtc(min_rtc), 
		.hora_rtc(hora_rtc), 
		.dia_rtc(dia_rtc), 
		.mes_rtc(mes_rtc), 
		.year_rtc(year_rtc), 
		.seg_tim_rtc(seg_tim_rtc), 
		.min_tim_rtc(min_tim_rtc), 
		.hora_tim_rtc(hora_tim_rtc), 
		.tecla(tecla), 
		.id_port(id_port), 
		.dato_inpico(dato_inpico)
	);

	initial begin
		// Initialize Inputs
		seg_rtc = 1;
		min_rtc = 2;
		hora_rtc = 3;
		dia_rtc = 4;
		mes_rtc = 5;
		year_rtc = 6;
		seg_tim_rtc = 7;
		min_tim_rtc = 8;
		hora_tim_rtc = 9;
		tecla = 10;
		id_port = 0;

		// Wait 100 ns for global reset to finish
		#100;
		id_port = 0;
        
		// Add stimulus here
		#100;
		id_port = 1;
		#100;
		id_port = 2;
		#100;
		id_port = 3;
		#100;
		id_port = 4;
		#100;
		id_port = 5;
		#100;
		id_port = 6;
		#100;
		id_port = 7;
		#100;
		id_port = 8;
		#100;
		id_port = 9;
		#100;
		id_port = 1;
		#100;
		id_port = 2;
		
		$stop;
		

	end
      
endmodule

