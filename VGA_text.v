`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:19 10/23/2016 
// Design Name: 
// Module Name:    VGA_text 
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
module VGA_text(
	input wire clk,
	input wire video_on,
	input wire [9:0] pixel_y, pixel_x,
	input wire [7:0] seg_reg, min_reg, hora_reg,
	input wire [7:0] dia_reg, mes_reg, year_reg,
	input wire [7:0] seg_timer_reg, min_timer_reg, hora_timer_reg,
	
	input wire [7:0] tecla,
	//input reg [7:0] tecla,

	
	
	//output wire [9:0] pixel_x, pixel_y,
	//output wire [2:0] text_on,//letras o palabras
	//output wire font_bit,
	output reg [2:0] rgb_text,
	///
	//output wire [7:0] font_word_wave,
	//output wire font_bit_wave,
	//output wire [3:0] row_add_wave,
	//output wire [2:0] bit_add_wave,
	//output wire [6:0] char_add_wave,
	output wire pixel_xlast,
	output wire pixel_ylast
    );
	 

//signal declaration
reg alarm_of;

wire [10:0] rom_add;

reg [6:0] char_add;//carga la letra en hexa

wire [3:0] row_add;

wire [2:0] bit_add;

wire [7:0] font_word;

//wire j_on, d_on, m_on, comodin,

wire fecha_f, fecha_e, fecha_c, fecha_h, fecha_a;
wire hora_h, hora_o, hora_r, hora_a;
wire crono_c, crono_r, crono_o, crono_n, crono_oo, crono_m, crono_e, crono_t, crono_rr, crono_ooo;
wire borde_on, borde_ondos, borde_ontres;
wire ring_r, ring_i, ring_n, ring_g;
wire alarm;

wire dos_puntos_on, barra_on;
wire seg_on_dec, seg_on_uni, min_on_dec, min_on_uni, hora_on_dec, hora_on_uni;
wire dia_on_dec, dia_on_uni, mes_on_dec, mes_on_uni, year_on_dec, year_on_uni;
wire seg_timer_on_dec, seg_timer_on_uni, min_timer_on_dec, min_timer_on_uni, hora_timer_on_dec, hora_timer_on_uni;

font_ROM font_unit(.clk(clk), .addr(rom_add), .data(font_word));

assign row_add = pixel_y [4:1];
assign bit_add = pixel_x [3:1];
assign pixel_xlast = pixel_x[0];
assign pixel_ylast = pixel_y[0];

//dos puntos
assign dos_puntos_on = (((pixel_y[9:5] == 10) && (pixel_x[9:4] == 9)) | ((pixel_y[9:5] == 10) && (pixel_x[9:4] == 12)) | ((pixel_y[9:5] == 10) && (pixel_x[9:4] == 29)) | ((pixel_y[9:5] == 10) && (pixel_x[9:4] == 32)));
//barra
assign barra_on = (((pixel_y[9:5] == 4) && (pixel_x[9:4] == 19)) | ((pixel_y[9:5] == 4) && (pixel_x[9:4] == 22)));
// borde
assign borde_on = ((pixel_y[9:5] >=0 & pixel_y[9:5] <=14 & pixel_x[9:4]==0) |(pixel_y[9:5] >=0 & pixel_y[9:5] <=14 & pixel_x[9:4]==39) | (pixel_y[9:5]==0 & pixel_x[9:4] >=0 & pixel_x[9:4]<=39) | (pixel_y[9:5]==14 & pixel_x[9:4]>=0 & pixel_x[9:4]<=39));
// borde interno
assign borde_ondos = ((pixel_y[9:5]==7 & pixel_x[9:4]>=1 & pixel_x[9:4]<=39));
assign borde_ontres = ((pixel_y[9:5]>=7 & pixel_y[9:5]<=13 & pixel_x[9:4]==20));
//alarma
assign ring_r = (pixel_y [9:5] == 3) && (pixel_x [9:4] ==30);
assign ring_i = (pixel_y [9:5] == 3) && (pixel_x [9:4] == 31);
assign ring_n = (pixel_y [9:5] == 3) && (pixel_x [9:4] == 32);
assign ring_g = (pixel_y [9:5] == 3) && (pixel_x [9:4] == 33);
assign alarm = ((pixel_y [9:5]>=4 & pixel_y [9:5]<=5) & (pixel_x [9:4]>=30 & pixel_x [9:4]<=33 ));
//hora texto
assign hora_h = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 9);
assign hora_o = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 10);
assign hora_r = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 11);
assign hora_a = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 12);
//segundos
assign seg_on_dec = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 13);
assign seg_on_uni = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 14);
//minutos
assign min_on_dec = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 10);
assign min_on_uni = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 11);
//hora
assign hora_on_dec = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 7);
assign hora_on_uni = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 8);

//fechatexto
assign fecha_f = (pixel_y [9:5] == 3) && (pixel_x [9:4] == 18); //Corregir coordenadas de fecha hora crono
assign fecha_e = (pixel_y [9:5] == 3) && (pixel_x [9:4] == 19);
assign fecha_c = (pixel_y [9:5] == 3) && (pixel_x [9:4] == 20);
assign fecha_h = (pixel_y [9:5] == 3) && (pixel_x [9:4] == 21);
assign fecha_a = (pixel_y [9:5] == 3) && (pixel_x [9:4] == 22);
//dia
assign dia_on_dec = (pixel_y[9:5] == 4) && (pixel_x[9:4] == 17);
assign dia_on_uni = (pixel_y[9:5] == 4) && (pixel_x[9:4] == 18);
//mes
assign mes_on_dec = (pixel_y[9:5] == 4) && (pixel_x[9:4] == 20);
assign mes_on_uni = (pixel_y[9:5] == 4) && (pixel_x[9:4] == 21);
//año
assign year_on_dec = (pixel_y[9:5] == 4) && (pixel_x[9:4] == 23);
assign year_on_uni = (pixel_y[9:5] == 4) && (pixel_x[9:4] == 24);


//crono texto
assign crono_c = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 26);
assign crono_r = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 27);
assign crono_o = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 28);
assign crono_n = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 29);
assign crono_oo = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 30);
assign crono_m = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 31);
assign crono_e = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 32);
assign crono_t = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 33);
assign crono_rr = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 34);
assign crono_ooo = (pixel_y [9:5] == 9) && (pixel_x [9:4] == 35);
//segundos timer
assign seg_timer_on_dec = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 33);
assign seg_timer_on_uni = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 34);
//minutos timer
assign min_timer_on_dec = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 30);
assign min_timer_on_uni = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 31);
//hora timer
assign hora_timer_on_dec = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 27);
assign hora_timer_on_uni = (pixel_y[9:5] == 10) && (pixel_x[9:4] == 28);

//Para poner D

//assign d_on = (pixel_y [9:5] == 7) && (pixel_x [9:4] == 20);
//assign d_on = (pixel_y [9:6] == 3) && (5== pixel_x [9:5]); //&& (pixel_x [9:5]<=7);
//assign row_add_D = pixel_y[3:1];
//assign bit_add_D = pixel_x [5:1];

/*always @*
	case (pixel_x[7:4])
	
		default: char_add_D = 7'h82;
	endcase*/
	
	
//Para poner m

//assign m_on = (pixel_y [9:5] == 8) && (pixel_x [9:4] == 22);
//assign m_on = (pixel_y [9:6] == 4) && (9== pixel_x [9:5]);// && (pixel_x [9:5]<=11);
//assign row_add_M = pixel_y[4:1];
//assign bit_add_M = pixel_x[9:1];
/*always @*
begin
	case (pixel_x[7:4])

		default: char_add_M = 7'h77;
	endcase
end*/

always @*
	begin
		if (seg_timer_reg == 8'h01) alarm_of <= 1'b1;
		else if (tecla == 8'h21) alarm_of <= 1'b0;
		else alarm_of <= alarm_of;
		/*if (swt4) alarm_of <= 1'b0;
		else alarm_of <= alarm_of;
		if(seg_timer_reg == 8'h01) alarm_of <= 1'b1;
		else alarm_of <= alarm_of;*/
		//if(j_on) char_add = 7'h4a;
		//else if (d_on) char_add = 7'h44;
		//else if (m_on) char_add = 7'h4d;
		//else if (comodin) char_add = 7'h7a;
		if (dos_puntos_on) char_add = 7'h3a;
		else if (barra_on) char_add = 7'h2f;
		else if (borde_on) char_add = 7'h08;
		
		else if (borde_ondos) char_add = 7'h2d;
		else if (borde_ontres) char_add = 7'h7c;
		else if (ring_r) char_add = 7'h52;
		else if (ring_i) char_add = 7'h49;
		else if (ring_n) char_add = 7'h4e;
		else if (ring_g) char_add = 7'h47;
		else if (alarm) char_add = 7'h07;
		
		else if (hora_h) char_add = 7'h48;
		else if (hora_o) char_add = 7'h6f;
		else if (hora_r) char_add = 7'h72;
		else if (hora_a) char_add = 7'h61;
		else if (seg_on_dec) char_add = {3'b011,seg_reg[7:4]};
		else if (seg_on_uni) char_add = {3'b011,seg_reg[3:0]};
		else if (min_on_dec) char_add = {3'b011,min_reg[7:4]};
		else if (min_on_uni) char_add = {3'b011,min_reg[3:0]};
		else if (hora_on_dec) char_add = {3'b011,hora_reg[7:4]};
		else if (hora_on_uni) char_add = {3'b011,hora_reg[3:0]};
		
		else if (fecha_f) char_add = 7'h46;
		else if (fecha_e) char_add = 7'h65;
		else if (fecha_c) char_add = 7'h63;
		else if (fecha_h) char_add = 7'h68;
		else if (fecha_a) char_add = 7'h61;
		else if (dia_on_dec) char_add = {3'b011,dia_reg[7:4]};
		else if (dia_on_uni) char_add = {3'b011,dia_reg[3:0]};
		else if (mes_on_dec) char_add = {3'b011,mes_reg[7:4]};
		else if (mes_on_uni) char_add = {3'b011,mes_reg[3:0]};
		else if (year_on_dec) char_add = {3'b011,year_reg[7:4]};
		else if (year_on_uni) char_add = {3'b011,year_reg[3:0]};
		
		else if (crono_c) char_add = 7'h43;
		else if (crono_r) char_add = 7'h72;
		else if (crono_o) char_add = 7'h6f;
		else if (crono_n) char_add = 7'h6e;
		else if (crono_oo) char_add = 7'h6f;
		else if (crono_m) char_add = 7'h6d;
		else if (crono_e) char_add = 7'h65;
		else if (crono_t) char_add = 7'h74;
		else if (crono_rr) char_add = 7'h72;
		else if (crono_ooo) char_add = 7'h6f;
		else if (seg_timer_on_dec) char_add = {3'b011,seg_timer_reg[7:4]};
		else if (seg_timer_on_uni) char_add = {3'b011,seg_timer_reg[3:0]};
		else if (min_timer_on_dec) char_add = {3'b011,min_timer_reg[7:4]};
		else if (min_timer_on_uni) char_add = {3'b011,min_timer_reg[3:0]};
		else if (hora_timer_on_dec) char_add = {3'b011,hora_timer_reg[7:4]};
		else if (hora_timer_on_uni) char_add = {3'b011,hora_timer_reg[3:0]};
		else char_add = 7'h00;
	end
		
assign rom_add = {char_add, row_add};
assign font_bit = font_word [~bit_add];

always @*
	begin
		if (video_on)
			begin
				if (font_bit /*&& (~comodin)*/)
					begin
						if ( fecha_f | fecha_e | fecha_c | fecha_h | fecha_a | hora_h | hora_o | hora_r | hora_a | crono_c | crono_r | crono_o | crono_n | crono_oo | crono_m | crono_e | crono_t | crono_rr | crono_ooo) rgb_text = 3'b001;
						else if  (dos_puntos_on | barra_on) rgb_text = 3'b100;
						else if (borde_on | borde_ondos | borde_ontres) rgb_text = 3'b011;
						else if (ring_r | ring_i | ring_n | ring_g | alarm)
							begin
								if (seg_timer_reg==8'h00 & min_timer_reg==8'h00 & hora_timer_reg==8'h00 & alarm_of == 1'b1) rgb_text = 3'b100;
								else rgb_text = 3'b111;
							end
						else rgb_text = 3'b010; 
						//rgb_text = 3'b000;
					end
				else
					rgb_text = 3'b111;
			end
		else
			rgb_text = 3'b000;
	end

//rgb multiplexing circuit
/*always @*
begin
	rgb_text = 3'b000;
	if (j_on)
	begin
		char_add = char_add_J;
		row_add = row_add_J;
		bit_add = bit_add_J;	
		if	(font_bit)
			rgb_text[2] = swt1;
			rgb_text[1] = swt2;
			rgb_text[0] = swt3;

	end
	
	
	else if (d_on)
	begin
		char_add = char_add_D;
		row_add = row_add_D;
		bit_add = bit_add_D;	
		if	(font_bit)
			rgb_text[2] = swt1;
			rgb_text[1] = swt2;
			rgb_text[0] = swt3;
	end
	
	else if (m_on)
	begin
		char_add = char_add_M;
		row_add = row_add_M;
		bit_add = bit_add_M;	
		if	(font_bit)
			rgb_text[2] = swt1;
			rgb_text[1] = swt2;
			rgb_text[0] = swt3;
	end
	else
		rgb_text = 3'b000;
	
end*/	

//assign text_on = {j_on, d_on, m_on};
//assign rom_add = {char_add, row_add};
//assign font_bit = font_word[~bit_add];	 

//assign font_word_wave = font_word;
//assign font_bit_wave = font_bit;
//assign row_add_wave = row_add;
//assign bit_add_wave = bit_add;
//assign char_add_wave = char_add;

endmodule
