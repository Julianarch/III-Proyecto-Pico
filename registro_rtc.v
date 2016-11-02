`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:35 10/23/2016 
// Design Name: 
// Module Name:    registro_rtc 
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
module registro_rtc(
	input wire clk, reset, LL_signal,
	input wire [3:0] reg_select,
	inout wire [7:0] dato_rtc,  // dato proveniente del rtc
	//input wire [7:0] dato_rtc, // entrada para poder hacer testbench 
////////////////////////////////////
	output wire [7:0] seg_rtc, min_rtc, hora_rtc, dia_rtc, mes_rtc, year_rtc, seg_tim_rtc, min_tim_rtc, hora_tim_rtc
    );
	 
	 reg [7:0] seg, min, hora, dia, mes, year, seg_tim, min_tim, hora_tim;
	 
	 always @(posedge clk, posedge reset)
		if (reset)
			begin
				seg <= 8'h00;
				min <= 8'h00;
				hora <= 8'h00;
				dia <= 8'h00;
				mes <= 8'h00;
				year <= 8'h00;
				seg_tim <= 8'h00;
				min_tim <= 8'h00;
				hora_tim <= 8'h00;
			end
		else
			begin
				if (LL_signal)
					begin
						if (reg_select == 4'd1)
							begin
								hora_tim <= hora_tim;
								seg <= dato_rtc;
							end
						else if (reg_select == 4'd2)
							begin
								seg <= seg;
								min <= dato_rtc;
							end
						else if (reg_select == 4'd3)
							begin
								min <= min;
								hora <= dato_rtc;
							end
						else if (reg_select == 4'd4)
							begin
								hora <= hora;
								dia <= dato_rtc;
							end
						else if (reg_select == 4'd5)
							begin
								dia <= dia;
								mes <= dato_rtc;
							end
						else if (reg_select == 4'd6)
							begin
								mes <= mes;
								year <= dato_rtc;
							end
						else if (reg_select == 4'd7)
							begin
								year <= year;
								seg_tim <= dato_rtc;
							end
						else if (reg_select == 4'd8)
							begin
								seg_tim <= seg_tim;
								min_tim <= dato_rtc;
							end
						else if (reg_select == 4'd9)
							begin
								min_tim <= min_tim;
								hora_tim <= dato_rtc;
							end
					end
				else
					begin
						seg <= seg;
						min <= min;
						hora <= hora;
						dia <= dia;
						mes <= mes;
						year <= year;
						seg_tim <= seg_tim;
						min_tim <= min_tim;
						hora_tim <= hora_tim;
					end
			end
	
	assign seg_rtc = seg;
	assign min_rtc = min;
	assign hora_rtc = hora;
	assign dia_rtc = dia;
	assign mes_rtc = mes;
	assign year_rtc = year;
	assign seg_tim_rtc = seg_tim;
	assign min_tim_rtc = min_tim;
	assign hora_tim_rtc = hora_tim;
	
	


endmodule
