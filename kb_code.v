`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:10:27 10/17/2016 
// Design Name: 
// Module Name:    kb_code 
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
module kb_code(
	input wire clk, reset,
	input wire ps2d, ps2c, rd_key_code,
	output wire [7:0] key_code
    );

//constant declaration
localparam BRK = 8'hf0; //break code

//symbolic state declaration
localparam 
	wait_brk = 1'b0,
	get_code = 1'b1;
	
//signal declaration	
reg state_reg, state_next;
wire [7:0] scan_out;
reg got_code_tick;
wire scan_done_tick;

//body	
//instantiate ps2 receiver
//ps2_rx ps2_rx_unit
//(.clk(clk),.reset(reset),.rx_en(1'b1),
 //.ps2d(ps2d),.ps2c(ps2c),
 //. rx_done_tick(scan_done_tick),.dout(scan_out));
/*
always @(posedge clk)
begin
if (got_code_tick)
key_code = 8'h00;
else
key_code = scan_out;
end
*/
//FSM to get the scan code
//state registers
always @(posedge clk, posedge reset)
	if (reset)
		state_reg <= wait_brk;
	else
		state_reg <= state_next;
	
always @*
begin
	got_code_tick = 1'b0;
	state_next = state_reg;
	case (state_reg)
		wait_brk: //wait for F0 of break code
			if (scan_done_tick == 1'b1 && scan_out == BRK)
				state_next = get_code;
				
	get_code:
		if (scan_done_tick)
			begin
				got_code_tick = 1'b1;
				state_next = wait_brk;
			end
	endcase
end	
	
endmodule
