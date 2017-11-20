`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:55 12/29/2016 
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
		output reg cp
		);

		reg [20:0]cnt=0;

		always@(posedge clk)begin
			if(cnt > 8000)begin//��Ƶ���ӣ����Ǿ���8Mhz���˴��ɷֵ�1000hzƵ��
				cp <= 1;
				cnt <= 0;
			end
			else begin
				cnt <= cnt + 1; 
				cp <= 0;
			end
		end
endmodule
