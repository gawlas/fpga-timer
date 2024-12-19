`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2024 14:09:50
// Design Name: 
// Module Name: top
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


module top(
    input CLK100MHZ,
    input CPU_RESETN,
    input [3:0] BTN,
    output [7:0] SEGMENT,
    output [7:0] AN
    );
    
    
    wire [3:0] input_out;
    wire [3:0] digit_0;
    wire [3:0] digit_1;
    wire [3:0] digit_2;
    wire [3:0] digit_3;
    
    input_logic IN_LOGIC(
        .CLK(CLK100MHZ),
        .RST_N(CPU_RESETN),
        .IN(BTN),
        .OUT(input_out)
    );
    
    control_logic CONTROL_LOGIC(
        .CLK(CLK100MHZ),
        .RST_N(CPU_RESETN),
        .BTN(input_out),
        .DIGIT_0(digit_0),
        .DIGIT_1(digit_1),
        .DIGIT_2(digit_2),
        .DIGIT_3(digit_3)
    );
        
    output_logic OUT_LOGIC(
        .DIGIT_0(digit_0),
        .DIGIT_1(digit_1),
        .DIGIT_2(digit_2),
        .DIGIT_3(digit_3),
        .SEGMENT(SEGMENT),
        .SELECT(AN),
        .CLK(CLK100MHZ),
        .RST_N(CPU_RESETN)
    );
endmodule
