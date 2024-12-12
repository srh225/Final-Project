`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 01:39:05 PM
// Design Name: 
// Module Name: anode_gen
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


module anode_gen(
    input clk,
    input reset,
    output reg [3:0] anode = 4'b1000
);

    parameter g_s = 5;
    parameter g_t = 4; 
    reg [g_s-1:0] g_count = 0;

    always @(posedge clk or posedge reset) 
    begin
    if(reset)
    begin
        g_count <= 0;
        anode <= 4'b1000;
    end
    else 
    begin
        if (g_count == g_t)
        begin
            g_count <=0;
            case(anode) 
                4'b1000: anode <= 4'b0100;
                4'b0100: anode <= 4'b0010;
                4'b0010: anode <= 4'b0001;
                4'b0001: anode <= 4'b1000;
                default: anode <= 4'b1000;
            endcase
        end
        else
        begin
            g_count <= g_count + 1;
        end
    end
    end

endmodule