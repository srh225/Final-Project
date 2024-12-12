`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 01:39:05 PM
// Design Name: 
// Module Name: seven_seg_decoder
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


module seven_seg_decoder(
    input clk,
    input reset,
    input [3:0] bcd_seg,
    output reg [6:0] sseg_c_o
);

    always @(posedge clk or posedge reset)
    begin
    if (reset) 
    begin
        sseg_c_o <= 7'b1111111; // All segments off (or any desired reset state)
    end else 
    begin
        case(bcd_seg)

            4'b0000 : sseg_c_o = 7'b1000000;

            4'b0001 : sseg_c_o = 7'b1111001;

            4'b0010 : sseg_c_o = 7'b0100100;

            4'b0011 : sseg_c_o = 7'b0110000;

            4'b0100 : sseg_c_o = 7'b0011001;

            4'b0101 : sseg_c_o = 7'b0010010;

            4'b0110 : sseg_c_o = 7'b0000010;

            4'b0111 : sseg_c_o = 7'b1111000;

            4'b1000 : sseg_c_o = 7'b0000000;

            4'b1001 : sseg_c_o = 7'b0010000;

            default : sseg_c_o = 7'b1111111;

        endcase
    end
    end
endmodule