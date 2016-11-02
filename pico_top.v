`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:06 10/30/2016 
// Design Name: 
// Module Name:    pico_top 
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
module pico_top(
	input wire clk,
	input wire [7:0] in_port_pr,
	output wire [7:0] id_port_pr, out_port_pr,
	output wire write_s/*, read_s*/
    );
	 
	wire	[11:0]	address;
	wire	[17:0]	instruction;
	wire			bram_enable;
	wire	[7:0]		port_id;
	wire	[7:0]		out_port;
	//reg	[7:0]		in_port;
	wire			write_strobe;
	wire			k_write_strobe;
	wire			read_strobe;
	wire			interrupt;            //See note above
	wire			interrupt_ack;
	wire			kcpsm6_sleep;         //See note above
	wire			kcpsm6_reset;       
	
	kcpsm6 #(
	.interrupt_vector	(12'h3FF),
	.scratch_pad_memory_size(64),
	.hwbuild		(8'h00))
  processor (
	.address 		(address),
	.instruction 	(instruction),
	.bram_enable 	(bram_enable),
	.port_id 		(port_id),
	.write_strobe 	(write_strobe),
	.k_write_strobe 	(k_write_strobe),
	.out_port 		(out_port),
	.read_strobe 	(read_strobe),
	.in_port 		(in_port_pr),
	.interrupt 		(interrupt),
	.interrupt_ack 	(interrupt_ack),
	.reset 		(kcpsm6_reset),
	.sleep		(kcpsm6_sleep),
	.clk 			(clk));
	
	assign kcpsm6_sleep = 1'b0;
	assign interrupt = 1'b0;
	
	
	proyecto_final #(
	.C_FAMILY		   ("7S"),   	//Family 'S6' or 'V6'
	.C_RAM_SIZE_KWORDS	(2),  	//Program size '1', '2' or '4'
	.C_JTAG_LOADER_ENABLE	(1))  	//Include JTAG Loader when set to '1' 
  program_rom (    				//Name to match your PSM file
 	.rdl 			(kcpsm6_reset),
	.enable 		(bram_enable),
	.address 		(address),
	.instruction 	(instruction),
	.clk 			(clk));

	assign id_port_pr = port_id;
	assign out_port_pr = out_port;
	assign write_s = write_strobe;
	/*assign read_s = read_strobe;*/
endmodule
