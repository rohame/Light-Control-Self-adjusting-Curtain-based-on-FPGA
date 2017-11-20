`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:27:03 12/29/2016 
// Design Name: 
// Module Name:    clock 
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
 module clock(
		input clk,
		input rst,
		output clk_2s//每5秒输出一个脉冲
		);
		
		reg [25:0] cnt;
		reg [25:0] cnt1;
		
		always@(posedge clk or posedge rst)
			begin
				if(rst)
					begin
						cnt<=0;
						cnt1<=0;
					end
				else
					begin
						if(cnt==26'd15999999)//2秒数完
							cnt<=0;
						else
							cnt<=cnt+1;
						if(cnt1==26'd39999999)//5秒数完
							cnt1<=0;
						else
							cnt1<=cnt1+1;
					end
			end
		
		assign clk_2s=(cnt1<=26'd79999)?1:0;

endmodule
