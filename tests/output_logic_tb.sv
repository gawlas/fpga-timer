`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2024 11:51:27 PM
// Design Name: 
// Module Name: output_logic_tb
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


module output_logic_tb;
    // input & output
    reg CLK;
    reg RST_N = 0;
    reg [3:0] DIGIT_0 = 1;
    reg [3:0] DIGIT_1 = 2;
    reg [3:0] DIGIT_2 = 3;
    reg [3:0] DIGIT_3 = 4;
    wire [7:0] SEGMENT;
    wire [3:0] SELECT;
    
    // clock
    initial CLK = 0;
    always #5 CLK = ~CLK;
   
    // create UUT
    output_logic UUT(
        .CLK(CLK),
        .RST_N(RST_N),
        .DIGIT_0(DIGIT_0),
        .DIGIT_1(DIGIT_1),
        .DIGIT_2(DIGIT_2),
        .DIGIT_3(DIGIT_3),
        .SEGMENT(SEGMENT),
        .SELECT(SELECT)
    );
    
    initial begin
        // start
        #100;
        RST_N = 1;
        
        // wait
        #1000000000;
        
        // end simulation
        $finish;
    end
endmodule
