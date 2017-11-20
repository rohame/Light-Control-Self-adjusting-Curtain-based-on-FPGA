`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:12:41 12/29/2016 
// Design Name: 
// Module Name:    motor 
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
module motor(
		input clk,
		input [3:0] control,
		output reg [7:0] led_l,
		output reg [7:0] led_r,
		output reg [3:0] motor
    );

		wire [3:0]motor_s1,motor_ms1;

		forward forward(.clk(clk),.motor_out(motor_s1));
		backward backward(.clk(clk),.motor_out(motor_ms1));

		always@(posedge clk) begin
			if(control[3])begin motor <= 4'b0000;led_l <= 8'h3f;led_r <= 8'h3f;end
			else if(control[2])begin motor <= 4'b1111;led_l <= 8'h40;led_r <= 8'h40;end
			else if(control[1])begin motor <= motor_s1;led_l <= 8'h00;led_r <= 8'h06;end
			else if(control[0])begin motor <= motor_ms1;led_l <= 8'h40;led_r <= 8'h06;end
			else begin motor <= 4'b0000;led_l <= 8'h0;led_r <= 8'h0;end
		end

endmodule
