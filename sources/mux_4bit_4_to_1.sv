`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2024 14:50:29
// Design Name: 
// Module Name: mux_4bit_4_to_1
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


module mux_4bit_4_to_1(
    input [3:0] IN_0,
    input [3:0] IN_1,
    input [3:0] IN_2,
    input [3:0] IN_3,
    input [1:0] SEL,
    output reg [3:0] OUT
    );
    
    always @(*) begin
        case (SEL)
            2'b00 : OUT = IN_0;
            2'b01 : OUT = IN_1;
            2'b10 : OUT = IN_2;
            2'b11 : OUT = IN_3;
        endcase
    end
endmodule
