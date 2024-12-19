`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2024 14:35:32
// Design Name: 
// Module Name: output_logic
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


module output_logic(
    input CLK,
    input RST_N,
    input [3:0] DIGIT_0,
    input [3:0] DIGIT_1,
    input [3:0] DIGIT_2,
    input [3:0] DIGIT_3,
    output [7:0] SEGMENT,
    output [7:0] SELECT
    );
    
    wire [1:0] sel;
    wire [3:0] mux_out;
    wire [7:0] segment_out;
    wire [3:0] select_out;
    
    assign SEGMENT = ~segment_out;
    assign SELECT = ~select_out;
    
    mux_4bit_4_to_1 MUX(
        .IN_0(DIGIT_0),
        .IN_1(DIGIT_1),
        .IN_2(DIGIT_2),
        .IN_3(DIGIT_3),
        .SEL(sel),
        .OUT(mux_out)
    );
    
    bcd_2bit_to_1hot BCD_1HOT(
        .IN(sel),
        .OUT(select_out)
    );
    
    seven_segment_decoder DECODER(
        .DIGIT(mux_out),
        .SEGMENT(segment_out)
    );
    
    display_controller CONTROLLER(
        .CLK(CLK),
        .RST_N(RST_N),
        .SEL(sel)
    );
endmodule
