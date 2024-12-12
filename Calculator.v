`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 01:35:57 PM
// Design Name: 
// Module Name: Calculator
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


module Calculator(
    input clk,
    input reset,
    input [3:0] a,          
    input [3:0] b,          
    input [2:0] op,
    output [6:0] sseg_c_o,
    output [3:0] sseg_a_o    
);

    wire [3:0] anode, bcd_seg;
    wire [7:0] result;
    wire [15:0] bcd_d_out;
    wire rdy;

    calculation UUT1(.a(a), .b(b), .op(op), .result(result));
    
    Bin2bcd UUT2(.clk(clk), .reset(reset), .bin_d_in({4'b0, result}), .bcd_d_out(bcd_d_out), .rdy(rdy));
        
    anode_gen UUT3(.clk(clk), .reset(reset), .anode(anode));
    
    mux_4_to_1 UUT4(.clk(clk), .reset(reset), .rdy(rdy), .anode(anode), .bcd_in(bcd_d_out), .sseg_a_o(sseg_a_o), .bcd_seg(bcd_seg));
    
    seven_seg_decoder UUT5(.clk(clk), .bcd_seg(bcd_seg), .sseg_c_o(sseg_c_o));

endmodule
