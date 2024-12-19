`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2024 11:44:36 PM
// Design Name: 
// Module Name: mux_4bit_4_to_1_tb
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


module mux_4bit_4_to_1_tb;
    // inputs
    reg [3:0] IN_0 = 4'b1111;
    reg [3:0] IN_1 = 4'b1001;
    reg [3:0] IN_2 = 4'b0110;
    reg [3:0] IN_3 = 4'b1010;
    reg [1:0] SEL;
    
    // outputs
    wire [3:0] OUT;
       
    // create UUT
    mux_4bit_4_to_1 UUT(
        .IN_0(IN_0),
        .IN_1(IN_1),
        .IN_2(IN_2),
        .IN_3(IN_3),
        .SEL(SEL),
        .OUT(OUT)
    );
    
    integer i; 
    initial begin
        for (i = 0; i < 4; i = i + 1) begin
			SEL = i;
			#10;
		end
        
        $finish;
    end
endmodule
