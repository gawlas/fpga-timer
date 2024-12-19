`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2024 14:40:36
// Design Name: 
// Module Name: seven_segment_decoder
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


module seven_segment_decoder(
    input [3:0] DIGIT,
    output reg [7:0] SEGMENT
    );
        
    always @(DIGIT) begin
        case (DIGIT)
            4'b0000 : SEGMENT = 8'b00111111; // 0
            4'b0001 : SEGMENT = 8'b00000110; // 1
            4'b0010 : SEGMENT = 8'b01011011; // 2
            4'b0011 : SEGMENT = 8'b01001111; // 3
            4'b0100 : SEGMENT = 8'b01100110; // 4
            4'b0101 : SEGMENT = 8'b01101101; // 5
            4'b0110 : SEGMENT = 8'b01111101; // 6
            4'b0111 : SEGMENT = 8'b00000111; // 7
            4'b1000 : SEGMENT = 8'b01111111; // 8
            4'b1001 : SEGMENT = 8'b01101111; // 9
            default : SEGMENT = 8'b00000000; // EMPTY
        endcase
    end
endmodule
