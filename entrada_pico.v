`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:39:34 10/26/2016 
// Design Name: 
// Module Name:    entrada_pico 
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
module entrada_pico(
	input wire clk, reset, LL_signal,
	input wire [3:0] reg_select,
	input wire [7:0] tecla,
	//input reg [7:0] tecla,
	input wire [7:0] id_port,
	inout wire [7:0] RTC_BUS,
	output wire [7:0] dato_inpico
	);
	wire [7:0] seg_rtc, min_rtc, hora_rtc, dia_rtc, mes_rtc, year_rtc, seg_tim_rtc, min_tim_rtc, hora_tim_rtc;
	
	registro_rtc datos_rtc(.clk(clk), .reset(reset), .LL_signal(LL_signal), .reg_select(reg_select), .dato_rtc(RTC_BUS), .seg_rtc(seg_rtc), .min_rtc(min_rtc), .hora_rtc(hora_rtc), .dia_rtc(dia_rtc), .mes_rtc(mes_rtc), .year_rtc(year_rtc), .seg_tim_rtc(seg_tim_rtc), .min_tim_rtc(min_tim_rtc), .hora_tim_rtc(hora_tim_rtc));
	mux_inpico inpico(.seg_rtc(seg_rtc), .min_rtc(min_rtc), .hora_rtc(hora_rtc), .dia_rtc(dia_rtc), .mes_rtc(mes_rtc), .year_rtc(year_rtc), .seg_tim_rtc(seg_tim_rtc), .min_tim_rtc(min_tim_rtc), .hora_tim_rtc(hora_tim_rtc), .tecla(tecla), .id_port(id_port), .dato_inpico(dato_inpico));
endmodule
