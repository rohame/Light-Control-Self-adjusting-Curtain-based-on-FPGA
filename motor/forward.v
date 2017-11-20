`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:16:09 12/29/2016 
// Design Name: 
// Module Name:    forward 
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
module forward(
		clk,motor_out
    );
input clk;
output reg  [3:0] motor_out;
reg [3:0] s1= 7,s2= 3,s3= 11,s4= 9,s5= 13,s6= 12,s7=14,s8=6;
clock clock(.clk(clk),.cp(cp));

always@(posedge cp)begin
	motor_out <= s1;
	{s1,s2,s3,s4,s5,s6,s7,s8} <= {s2,s3,s4,s5,s6,s7,s8,s1};
end
	

endmodule 