`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:09:56 10/26/2016 
// Design Name: 
// Module Name:    salida_pico 
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
module salida_pico(
	input wire reset,
	input wire [7:0] pico_out,
	input wire [7:0] id_port, 
	input wire write_s,
	output wire [7:0] seg, min, hora, dia, mes, year, seg_tim, min_tim, hora_tim, swt, flecha, operacion, agarre
    );
	 
	reg [7:0] seg_reg, min_reg, hora_reg, dia_reg, mes_reg, year_reg, seg_tim_reg, min_tim_reg, hora_tim_reg, swt_reg, flecha_reg, operacion_reg, bandera_tec_reg,agarre_reg;
	
	always @*
		begin
			if (reset)
				begin
					seg_reg = 8'h00;
					min_reg = 8'h00;
					hora_reg = 8'h00;
					dia_reg = 8'h00;
					mes_reg = 8'h00;
					year_reg = 8'h00;
					seg_tim_reg = 8'h00;
					min_tim_reg = 8'h00;
					hora_tim_reg = 8'h00;
					swt_reg = 8'h01;
					bandera_tec_reg = 8'h00;
					flecha_reg = 8'h00;
					operacion_reg = 8'h01;
					agarre_reg = 8'h00;
				end
			else
				if (write_s)
					begin
						case (id_port)
							8'h00 : seg_reg = pico_out;
							8'h01 : min_reg = pico_out;
							8'h02 : hora_reg = pico_out;
							8'h03 : dia_reg = pico_out;
							8'h04 : mes_reg = pico_out;
							8'h05 : year_reg = pico_out;
							8'h06 : seg_tim_reg = pico_out;
							8'h07 : min_tim_reg = pico_out;
							8'h08 : hora_tim_reg = pico_out;
							8'h09 : swt_reg = pico_out;
							8'h0a : bandera_tec_reg = pico_out;
							8'h0b : flecha_reg = pico_out;
							8'h0c : operacion_reg = pico_out;
							8'h0d : agarre_reg = pico_out;		
						endcase
					end
		end
	
	assign seg = seg_reg;
	assign min = min_reg;
	assign hora = hora_reg;
	assign dia = dia_reg;
	assign mes = mes_reg;
	assign year = year_reg;
	assign seg_tim = seg_tim_reg;
	assign min_tim = min_tim_reg;
	assign hora_tim = hora_tim_reg;
	assign swt = swt_reg;
	assign bandera_tec = bandera_tec_reg;
	assign flecha = flecha_reg;
	assign operacion = operacion_reg;
	assign agarre = agarre_reg;

endmodule
