`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:18:26 12/30/2016 
// Design Name: 
// Module Name:    ADC 
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
	    module adcF(
		  input clk8m,
		  output clk500K,
		  input rst,
		  input EOC,             
		  output reg START,
		  output reg OE,
		  input [7:0] DATA,
		  output reg [7:0] DATA_R
		  );
		  
		  reg [4:0]  CS,NS;  
		  reg [7:0]  clk_cnt = 0;
		  reg [24:0]  cnt1s;
		  reg [7:0]  data_reg;
        reg clk_out = 0; 
		  
		  parameter   IDLE=5'b00001,
							START_H=5'b00010,
							START_L=5'b00100,
							CHECK_END=5'b01000,
							GET_DATA=5'b10000;  

			assign clk500K = clk_out;
							
			always@(posedge clk8m or posedge rst)
				if(rst)
					begin
						clk_cnt<=0;
						clk_out<=0;
					end
				else
					begin
						if(clk_cnt==7)
							begin
								clk_out<=1;
								clk_cnt<=clk_cnt+1;
							end
						else if(clk_cnt==15)
							begin
								clk_out<=0;
								clk_cnt<=0;
							end
						else
							clk_cnt<=clk_cnt+1;
						if(cnt1s==7999999)
							begin
								cnt1s<=0;
								DATA_R<=data_reg;
							end
						else
							cnt1s<=cnt1s+1;

					end
			always@(posedge clk500K or posedge rst)
				if(rst)
					begin
						CS<=IDLE;
						NS=IDLE;
						START<=0;
						OE<=0;
						data_reg<=0;
					end
				else
					begin
						CS<=NS;
						case(CS)
							IDLE:	NS=START_H;
							START_H:	NS=START_L;
							START_L:        NS=CHECK_END; 
							CHECK_END:  if(EOC)       NS=GET_DATA;  else    NS=CHECK_END; 
							GET_DATA:        NS=IDLE;      
							default:        NS=IDLE; 
						endcase
						case(NS) 
							IDLE: begin  OE<=0;   START<=0; end
							START_H:  begin OE<=0;  START<=1;   end
							START_L:   begin OE<=0; START<=0; end
							CHECK_END:  begin   OE<=0;end
							GET_DATA:   begin   OE<=1;
													START<=0;   
													data_reg<=DATA;
													end   
							default:   begin   OE<=0;  START<=0; end 
 
						endcase 
					end
						
endmodule
