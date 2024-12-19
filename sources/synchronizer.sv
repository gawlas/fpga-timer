`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 10:29:57 AM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(
    input wire IN,
    input RST_N,
    input wire CLK,
    output wire OUT
    );
    
    reg stage1, stage2, stage3;

    always @(posedge CLK or negedge RST_N) begin
        if (RST_N == 1'b0) begin
            stage1 <= 0;
            stage2 <= 0;
            stage3 <= 0;
        end
        else begin
            stage1 <= IN;
            stage2 <= stage1;
            stage3 <= stage2;
        end
    end

    assign OUT = stage3;
endmodule

