`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 01:39:05 PM
// Design Name: 
// Module Name: mux_4_to_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_4_to_1(
    input clk,
    input reset,
    input rdy,
    input [3:0] anode,
    input [15:0] bcd_in,
    output [3:0] sseg_a_o,
    output reg [3:0] bcd_seg
);
   
    always @(posedge clk or posedge reset)
    begin
    if(reset)
    begin
        bcd_seg <= 4'b1111; // Reset to a known state
    end
    else
    begin
    if(rdy)
            begin
                case(anode)
                    4'b1000 : bcd_seg <= bcd_in[15:12];
                    4'b0100 : bcd_seg <= bcd_in[11:8];
                    4'b0010 : bcd_seg <= bcd_in[7:4];
                    4'b0001 : bcd_seg <= bcd_in[3:0];
                    default : bcd_seg <= 4'b1111;
                endcase
            end
        end
    end
    assign sseg_a_o = ~anode;
endmodule
