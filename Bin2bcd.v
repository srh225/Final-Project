`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 01:39:05 PM
// Design Name: 
// Module Name: Bin2bcd
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


module Bin2bcd(
    input clk,
    input reset,
    input[11:0] bin_d_in,
    output reg [15:0] bcd_d_out,
    output reg rdy
);
   
    //State variables
    parameter IDLE = 3'b000;
    parameter SETUP = 3'b001;
    parameter ADD = 3'b010;
    parameter SHIFT = 3'b011;
    parameter DONE = 3'b100;
   
    //reg [11:0]  bin_data    = 0;
    reg [27:0] bcd_data = 0;
    reg [2:0] state = IDLE;
    reg [3:0] sh_counter = 0;
    
    always @(posedge clk or posedge reset)
    begin
    if (reset) 
    begin
        bcd_data <= 28'b0;
        bcd_d_out <= 16'b0;
        rdy <= 0;
        state <= IDLE;
        sh_counter <= 0;
    end 
    else 
    begin
        case(state)
            IDLE:
                begin
                    rdy <= 0;
                    bcd_data <= {16'b0, bin_d_in};
                    state <= SETUP;
                end
            SETUP:
                begin
                    state <= ADD;
                end  
            ADD:
                begin
                    if(bcd_data[15:12] > 4)
                        begin
                            bcd_data[15:12] <= bcd_data[15:12] + 3;
                        end
                    if(bcd_data[19:16] > 4)
                        begin
                            bcd_data[19:16] <= bcd_data[19:16] + 3;
                        end
                    if(bcd_data[23:20] > 4)
                        begin
                            bcd_data[23:20] <= bcd_data[23:20] + 3;
                        end
                    if(bcd_data[27:24] > 4)
                        begin
                            bcd_data[27:24] <= bcd_data[27:24] + 3;
                        end
                    state <= SHIFT;
                end  
            SHIFT:
                begin
                bcd_data <= {bcd_data[26:0], 1'b0};
                sh_counter <= sh_counter + 1;
                if(sh_counter == 12)
                    begin
                    sh_counter <= 0;
                    state <= DONE;
                    end
                else
                    begin
                    state <= ADD;
                    end
                end
            DONE:
                begin
                bcd_d_out <= bcd_data [27:12];
                rdy <= 1;
                state <= IDLE;
                end
            endcase  
    end
 
end
     
endmodule