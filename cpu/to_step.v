`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:26:42 12/29/2016 
// Design Name: 
// Module Name:    to_step 
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
module to_step(
		input clk,
		input clk_2s,
		input [7:0] data_in,
		input rst,
		input [3:0] sw,
		output [3:0] bus
    );
		
		reg [7:0] data_reg1;
		reg [7:0] data_reg2;
		reg [3:0] bus_;
		reg [4:0] i;
		reg [25:0] k;
		
		assign bus=bus_;
		
		always@(posedge clk or posedge rst)
		   
			begin 
				if(rst)
					begin
						bus_<=0;
						data_reg1<=0;
						data_reg2<=0;
						i<=0;
						k<=0;
					end
				else
					begin
					  if(k==26'd39999999) 
									begin data_reg2<=data_reg1; data_reg1<=data_in; k<=26'd0; end
					   else k<=k+1'd1;
						if((clk_2s==1)||sw[3]||sw[2]||sw[1]||sw[0])	             //(clk_2ss==1'b0&&clk_2s==1'b1)
							begin
							if(sw[3]||sw[2]||sw[1]||sw[0])								//ÊÖ¿Ø
								begin
									if(sw[3]) bus_<=3'b1000;
									if(sw[2]) bus_<=3'b0100;
									if(sw[1]) bus_<=3'b0010;
									if(sw[0]) bus_<=3'b0001;
								end
							else											//×Ô¿Ø
								begin
									if(data_in[0]||data_in[1]||data_in[2]||data_in[3]||data_in[4]||data_in[5]||data_in[6]||data_in[7])
										case(i)
										5'd0,5'd1,5'd2:
											begin
												if(data_reg1[7-i]>data_reg2[7-i])
													begin bus_[3:0]<=3'b1000; i<=0;end
												else if(data_reg1[7-i]<data_reg2[7-i])
													begin bus_[3:0]<=3'b0001; i<=0;end
												else 	
													i<=i+5'd1;
											end
										5'd3:
											begin
												if(data_reg1[7-i]>data_reg2[7-i]) 
													 bus_[3:0]<=8'b1000; 
												else if(data_reg1[7-i]<data_reg2[7-i])
													bus_[3:0]<=8'b0001;
												else bus_[3:0]<=8'b0000;
												i<=0;
											end
										endcase
									else bus_[3:0]<=8'b0000;
								end
							end
					end
			end
			



endmodule
