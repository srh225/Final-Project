`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 01:39:05 PM
// Design Name: 
// Module Name: calculation
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

module calculation(
    input [3:0] a,          
    input [3:0] b,          
    input [2:0] op,        
    output reg [7:0] result    
);
    always @(*) begin
        case (op)
            3'b000: result = a + b;           // Addition
            3'b001: result = a - b;           // Subtraction
            3'b010: result = a * b;           // Multiplication
            3'b011: if(b != 0)                //Division
                        begin
                            result = (a / b);
                        end
                    else
                        begin
                            result = 8'b11111111;
                        end
            3'b100: result = {4'b0, a & b};   // Logical AND
            3'b101: result = {4'b0, a | b};   // Logical OR
            3'b110: result = {4'b0, a ^ b};   // Logical XOR
            3'b111: result = {4'b0, ~a};         // Logical NOT
            default: result = 8'b0;                
        endcase
    end
endmodule