`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:56 12/29/2016 
// Design Name: 
// Module Name:    from_adc 
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
module from_adc(
		input [7:0] data_in,
		input clk,
		input rst,
		output [7:0] led_l,
		output [7:0] led_r
    );


		reg [3:0] data_led_l;
		reg [3:0] data_led_r;
		reg [7:0] led_l_;
		reg [7:0] led_r_;
		
		assign led_l=led_l_;
		assign led_r=led_r_;
		

		
		always@(posedge clk or posedge rst)
			begin
				if(rst)
					begin
						led_l_<=0;
						led_r_<=0;
						data_led_l<=0;
						data_led_r<=0;
					end
				else
					begin
						data_led_l[3:0]<=data_in[7:4];
						data_led_r[3:0]<=data_in[3:0];
						if(1)
							begin
								case(data_led_l)
									4'b0000: led_l_<=8'b00111111;
									4'b0001: led_l_<=8'b00000110;
									4'b0010: led_l_<=8'b01011011;
									4'b0011: led_l_<=8'b01001111;
									4'b0100: led_l_<=8'b01100110;
									4'b0101: led_l_<=8'b01101101;
									4'b0110: led_l_<=8'b01111101;
									4'b0111: led_l_<=8'b00000111;
									4'b1000: led_l_<=8'b01111111;
									4'b1001: led_l_<=8'b01101111;
									4'b1010: led_l_<=8'b01110111;
									4'b1011: led_l_<=8'b01111100;
									4'b1100: led_l_<=8'b00111001;
									4'b1101: led_l_<=8'b01011110;
									4'b1110: led_l_<=8'b01111001;
									4'b1111: led_l_<=8'b01110001;
									default:led_l_<=8'b11111111;
								endcase
								case(data_led_r)
									4'b0000: led_r_<=8'b00111111;
									4'b0001: led_r_<=8'b00000110;
									4'b0010: led_r_<=8'b01011011;
									4'b0011: led_r_<=8'b01001111;
									4'b0100: led_r_<=8'b01100110;
									4'b0101: led_r_<=8'b01101101;
									4'b0110: led_r_<=8'b01111101;
									4'b0111: led_r_<=8'b00000111;
									4'b1000: led_r_<=8'b01111111;
									4'b1001: led_r_<=8'b01101111;
									4'b1010: led_r_<=8'b01110111;
									4'b1011: led_r_<=8'b01111100;
									4'b1100: led_r_<=8'b00111001;
									4'b1101: led_r_<=8'b01011110;
									4'b1110: led_r_<=8'b01111001;
									4'b1111: led_r_<=8'b01110001;
									default:led_r_<=8'b11111111;
								endcase
							end
					end
			end
						
						
						
						
endmodule
