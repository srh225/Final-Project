`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 01:37:06 PM
// Design Name: 
// Module Name: Calculator_tb
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


module Calculator_tb;
    reg clk;
    reg reset;
    reg [3:0] a, b;
    reg [2:0] op;
    wire [6:0] sseg_c_o;
    wire [3:0] sseg_a_o;

    Calculator uut(clk, reset, a, b, op, sseg_c_o, sseg_a_o);

    always

    begin

        #5 clk = ~clk;  // Toggle clock every 5 time units (10-time unit clock period)

    end

   

    initial begin

    clk = 0;
    reset = 1;
    
    #20;
    
    reset = 0;

    a = 4'b0001;
    b = 4'b1001;
    op = 3'b000;

    #1280;
    a = 4'b0101;
    b = 4'b0011;
    op = 3'b001;

    #1280;
    a = 4'b1000;
    b = 4'b0110;
    op = 3'b010;

    #1280;
    a = 4'b0110;
    b = 4'b0011;
    op = 3'b011;

    #1280;
    a = 4'b0001;
    b = 4'b0010;
    op = 3'b100;

    #1280;
    a = 4'b0101;
    b = 4'b0011;
    op = 3'b101;

    #1280;
    a = 4'b1000;
    b = 4'b0110;
    op = 3'b110;

    #1280;
    a = 4'b0110;
    b = 4'b0011;
    op = 3'b111;

    #1280;

    $stop;

    end
    
endmodule
