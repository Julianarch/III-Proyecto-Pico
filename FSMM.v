`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:03 10/23/2016 
// Design Name: 
// Module Name:    FSMM 
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
module FSMM(
	inout wire [7:0] RTC_BUS,
	input wire clk, reset,
	//input wire arriba, abajo, der, izq, 
	/////////////////////////////////entrada de prueba///////////////////////
	//input wire [7:0] key_code,
	//////////////////////////////////////fin entrada de prueba//////////////
	//////////////////teclado////////////////////////////////////////////////
	 input wire var,
    input wire ps2d, ps2c,
	/////////////////////////////////////////////////////////////////////////
	//salidas
	output wire CS,AD,WR,RD, 
	///////////////////////////salidas de prueba///////////////////////////////
	output wire [7:0] swt_pr, envio_pr, operacion_pr,
	///////////////////////////fin salidas de prueba///////////////////////////
 // vga
	output wire pixel_xlast, pixel_ylast,
	output wire [2:0] rgb_text,
	output wire hsync, vsync
	// fin vga
    );
	 
	 
	//reg [7:0] seg_reg;
	// realmente se ocupan
	wire dato, read, EN_signals;
	wire [7:0] addr_date;
	wire csu, wru, rdu, adu, ssu, llu;
	wire [2:0] ruta;
	wire [3:0] reg_select;
	wire [1:0] estado;
	wire [7:0] seg, min, hora;
	wire [7:0] dia, mes, year;
	wire [7:0] seg_timer, min_timer, hora_timer;
	
	//aun no se usan wire [7:0] seg_bot, min_bot, hora_bot, dia_bot, mes_bot, year_bot, seg_timer_bot, min_timer_bot, hora_timer_bot;
	wire bot_ar, bot_ab, bot_der, bot_izq;
	
	wire [7:0] key_code;
	wire [7:0] id_port;
	wire [7:0] dato_inpico;
	
	wire [7:0] out_port;
	wire write_s;
	wire listo;
	
	wire [7:0] swt;
	wire [7:0] flecha, operacion, agarre;
	
	//// vga
	wire video_on, pixel_tick;
	wire [9:0] pixel_x, pixel_y;
	reg [2:0] rgb_reg;
	wire [2:0] rgb_next;
	/// fin vga
	
	//salidas para prueba
	/*wire [5:0] ciclo_pr;
	wire [4:0] cuenta_pr;
	wire [1:0] cambio_pr;
	wire EN_ciclo_pr;
	wire [5:0] duracion_pr;
	wire inicializacion_pr;*/

	//Rebote rebotes(.clk(clk), .reset(reset), .arriba(arriba), .abajo(abajo), .der(der), .izq(izq), .bot_ar(bot_ar), .bot_ab(bot_ab), .bot_der(bot_der), .bot_izq(bot_izq));
	
	//Botones boton (.clk(clk), .reset(reset), .estado(estado), .bot_izq(bot_izq), .bot_der(bot_der), .bot_ar(bot_ar), .bot_ab(bot_ab), 
	//.seg_reg(seg), .min_reg(min), .hora_reg(hora), .dia_reg(dia), .mes_reg(mes), .year_reg(year), .seg_bot(seg_bot), .min_bot(min_bot), .hora_bot(hora_bot), .dia_bot(dia_bot), .mes_bot(mes_bot), .year_bot(year_bot));
	
	Control envio(.clk(clk), .reset(reset), .swt(swt), .seg(seg), .min(min), .hora(hora), .dia(dia), .mes(mes), .year(year), .seg_timer(seg_timer), .min_timer(min_timer), .hora_timer(hora_timer), .dato(dato), .read(read), .EN_signals(EN_signals), .addr_date(addr_date), .reg_select(reg_select));
	//real//Control envio(.clk(clk), .reset(reset), .swt(swt), .seg(seg_bot), .min(min_bot), .hora(hora_bot), .dia(dia_bot), .mes(mes_bot), .year(year_bot), .seg_timer(seg_timer_bot), .min_timer(min_timer_bot), .hora_timer(hora_timer_bot), .dato(dato_bot), .read(read), .EN_signals(EN_signals), .addr_date(addr_date), .reg_select(reg_select));
	
	///////////////////////////////////////picoblaze///////////////////////////////////////////////////
	pico_top pico(.clk(clk), .in_port_pr(dato_inpico), .id_port_pr(id_port), .out_port_pr(out_port), .write_s(write_s));
	
	///////////////////////////////////////end picobalze///////////////////////////////////////////////	
	
	
	//prueba_reg registros(.clk(clk), .reset(reset), .LL_signal(llu), .swt4(swt4), .RTC_BUS(RTC_BUS), .reg_select(reg_select), .estado(estado), .seg_bot(seg_bot), .min_bot(min_bot), .hora_bot(hora_bot), .dia_bot(dia_bot), .mes_bot(mes_bot), .year_bot(year_bot), .seg(seg), .min(min), .hora(hora), .dia(dia), .mes(mes), .year(year), .seg_timer(seg_timer), .min_timer(min_timer), .hora_timer(hora_timer), .alarm_of(alarm_of));
///////////////////////////////////////////////// no cambia /////////////////////////////////////////////////////////	
	signals signals_rtc(.clk(clk), .reset(reset), .EN_signals(EN_signals), .read(read), .dato(dato), .CS(csu), .WR(wru), .RD(rdu), .AD(adu), .SS(ssu), .LL(llu));
	
	buffer triestado(.RTC_BUS(RTC_BUS), .EN_SS(ssu), .in(addr_date));
	
	entrada_pico pico_in(.clk(clk), .reset(reset), .LL_signal(llu), .reg_select(reg_select), .tecla(key_code), .id_port(id_port), .RTC_BUS(RTC_BUS), .dato_inpico(dato_inpico));
	
	salida_pico pico_out(.reset(reset), .pico_out(out_port), .id_port(id_port), .write_s(write_s), .seg(seg), .min(min), .hora(hora), .dia(dia), .mes(mes), .year(year), .seg_tim(seg_timer), .min_tim(min_timer), .hora_tim(hora_timer), .swt(swt), .flecha(flecha), .operacion(operacion), .agarre(agarre));

//// vga 	
	VGA_sync v_sync(.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync), .video_on(video_on), .p_tick(pixel_tick), .pixel_x(pixel_x), .pixel_y(pixel_y));	
	 
	VGA_text vtext(.clk(clk), .video_on(video_on), .pixel_x(pixel_x), .pixel_y(pixel_y), .seg_reg(seg), .min_reg(min), .hora_reg(hora), .dia_reg(dia), .mes_reg(mes), .year_reg(year), .seg_timer_reg(seg_timer), .min_timer_reg(min_timer), .hora_timer_reg(hora_timer), .tecla(key_code), .rgb_text(rgb_next), .pixel_xlast(pixel_xlast), .pixel_ylast(pixel_ylast));
	
	//real//VGA_text vtext(.clk(clk), .video_on(video_on), .pixel_x(pixel_x), .pixel_y(pixel_y), .seg_reg(seg_bot), .min_reg(min_bot), .hora_reg(hora_bot), .dia_reg(dia_bot), .mes_reg(mes_bot), .year_reg(year_bot), .seg_timer_reg(seg_timer_bot), .min_timer_reg(min_timer_bot), .hora_timer_reg(hora_timer_bot), .tecla(key_code) .rgb_text(rgb_next), .pixel_xlast(pixel_xlast), .pixel_ylast(pixel_ylast));
	
	/////////////////////////////////////////teclado/////////////////////////////////////////////////////7
	kb_code_1 kb_code_unit(.clk(clk), .reset(reset), .var(var), .ps2d(ps2d), .ps2c(ps2c), .key_code(key_code), .id_port(id_port), .write_s(write_s), .listo(listo));
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	always @(posedge clk)
		if (pixel_tick)
			rgb_reg <= rgb_next;

	assign rgb_text = rgb_reg;
//// fin vga	
	assign CS = csu;
	assign AD = adu;
	assign WR = wru;
	assign RD = rdu;
	////////////////prueba////////////////
	assign swt_pr = swt;
	assign envio_pr = addr_date;
	assign operacion_pr = operacion;
	

endmodule

