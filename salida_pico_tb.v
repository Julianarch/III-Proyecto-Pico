`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:53:08 10/27/2016
// Design Name:   salida_pico
// Module Name:   C:/Users/VMWIN7/Desktop/RTC/final/salida_pico_tb.v
// Project Name:  final
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: salida_pico
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module salida_pico_tb;

	// Inputs
	reg reset;
	reg [7:0] pico_out;
	reg [7:0] id_port;
	reg write_s;

	// Outputs
	wire [7:0] seg;
	wire [7:0] min;
	wire [7:0] hora;
	wire [7:0] dia;
	wire [7:0] mes;
	wire [7:0] year;
	wire [7:0] seg_tim;
	wire [7:0] min_tim;
	wire [7:0] hora_tim;
	wire [7:0] swt;
	wire [7:0] flecha;
	wire [7:0] operacion;

	// Instantiate the Unit Under Test (UUT)
	salida_pico uut (
		.reset(reset),
		.pico_out(pico_out), 
		.id_port(id_port), 
		.write_s(write_s), 
		.seg(seg), 
		.min(min), 
		.hora(hora), 
		.dia(dia), 
		.mes(mes), 
		.year(year), 
		.seg_tim(seg_tim), 
		.min_tim(min_tim), 
		.hora_tim(hora_tim), 
		.swt(swt), 
		.flecha(flecha), 
		.operacion(operacion)
	);

	initial begin
		// Initialize Inputs
		pico_out = 12;
		id_port = 0;
		write_s = 0;
		reset=1;

		// Wait 100 ns for global reset to finish
		#100;
		reset=0;
		
		#100;
		write_s=1;
		
		#10;
		pico_out = 11;
		id_port = 1;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 10;
		id_port = 2;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 9;
		id_port = 3;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 8;
		id_port = 4;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 7;
		id_port = 5;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 6;
		id_port = 6;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 5;
		id_port = 7;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 4;
		id_port = 8;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 3;
		id_port = 9;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 2;
		id_port = 10;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 1;
		id_port = 11;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 0;
		id_port = 12;
		write_s = 0;
		
		#10;
		write_s=1;
		
		#10;
		pico_out = 9;
		id_port = 0;
		write_s = 0;
		
		#10;
		write_s=1;
		#10;
		$stop;

	end
      
endmodule

