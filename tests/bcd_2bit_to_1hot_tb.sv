`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2024 11:39:31 PM
// Design Name: 
// Module Name: bcd_2bit_to_1hot_tb
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


module bcd_2bit_to_1hot_tb;
    // inputs
    reg [1:0] IN;
    
    // outputs
    wire [3:0] OUT;
       
    // create UUT
    bcd_2bit_to_1hot UUT(
        .IN(IN),
        .OUT(OUT)
    );
    
    integer i;
    
    initial begin
        for (i = 0; i < 4; i = i + 1) begin
			IN = i;
			#10;
		end
        
        $finish;
    end
endmodule
