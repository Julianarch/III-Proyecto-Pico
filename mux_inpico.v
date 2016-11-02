`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:02:29 10/26/2016 
// Design Name: 
// Module Name:    mux_inpico 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux_inpico(
	input wire [7:0] seg_rtc, min_rtc, hora_rtc, dia_rtc, mes_rtc, year_rtc, seg_tim_rtc, min_tim_rtc, hora_tim_rtc,
	input wire [7:0] tecla,
	input wire [7:0] id_port,
	output wire [7:0] dato_inpico
    );
	
	reg [7:0] dato_inpico_reg;
	
	always @*
		begin
			case (id_port)
				8'h00 : dato_inpico_reg = seg_rtc;
				8'h01 : dato_inpico_reg = min_rtc;
				8'h02 : dato_inpico_reg = hora_rtc;
				8'h03 : dato_inpico_reg = dia_rtc;
				8'h04 : dato_inpico_reg = mes_rtc;
				8'h05 : dato_inpico_reg = year_rtc;
				8'h06 : dato_inpico_reg = seg_tim_rtc;
				8'h07 : dato_inpico_reg = min_tim_rtc;
				8'h08 : dato_inpico_reg = hora_tim_rtc;
				8'h09 : dato_inpico_reg = tecla;
				default : dato_inpico_reg = 8'bXXXXXXXX;
			endcase
		end
	
	assign dato_inpico = dato_inpico_reg;
		
endmodule
