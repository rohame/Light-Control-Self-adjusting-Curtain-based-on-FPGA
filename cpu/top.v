`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:56 12/29/2016 
// Design Name: 
// Module Name:    top 
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
module top(
		input [7:0] data_in,
		input clk,
		input rst,
		input [3:0] sw,
		output [7:0] led_l,
		output [7:0] led_r,
		output [3:0] bus

		
    );

		from_adc from_adc(
			.data_in(data_in),
			.clk(clk),
			.rst(rst),
			.led_l(led_l),
			.led_r(led_r)
			);
			
		to_step to_step(
			.clk(clk),
			.clk_2s(clk_2s),
			.data_in(data_in),
			.rst(rst),
			.sw(sw),
			.bus(bus)
			);
			
		clock clock(
			.clk(clk),
			.rst(rst),
			.clk_2s(clk_2s)
			);
			

endmodule