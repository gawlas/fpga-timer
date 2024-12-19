`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2024 14:57:44
// Design Name: 
// Module Name: bcd_2bit_to_1hot
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


module bcd_2bit_to_1hot(
    input [1:0] IN,
    output reg [7:0] OUT
    );
        
    always @(*) begin
        case (IN)
            4'b00 : OUT = 8'b00000001; // 0
            4'b01 : OUT = 8'b00000010; // 1
            4'b10 : OUT = 8'b00000100; // 2
            4'b11 : OUT = 8'b00001000; // 3
        endcase
    end
endmodule
