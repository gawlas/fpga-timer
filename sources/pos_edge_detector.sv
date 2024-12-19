`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 10:40:37 AM
// Design Name: 
// Module Name: pos_edge_detector
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


module pos_edge_detector(
    input IN,
    input CLK,
    input RST_N,
    output OUT
    );
    
    reg delay;
    reg buff;
    
    always @(posedge CLK or negedge RST_N) begin
        if (RST_N == 1'b0) begin
            delay <= 0;
            buff <= 0;
        end
        else begin
            buff <= IN;
            delay <= buff;
        end
    end
    
    assign OUT = buff & ~delay;
endmodule
