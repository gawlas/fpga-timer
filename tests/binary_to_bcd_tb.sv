`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.12.2024 14:52:05
// Design Name: 
// Module Name: binary_to_bcd_tb
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


module binary_to_bcd_tb;
    reg [5:0] BINARY;
    wire [3:0] BCD1;
    wire [3:0] BCD2;

       
    // create UUT
    binary_to_bcd UUT(
        .BINARY(BINARY),
        .BCD1(BCD1),
        .BCD2(BCD2)
    );
    
    integer i;
    
    initial begin
        for (i = 0; i < 64; i = i + 1) begin
			BINARY = i;
			#10;
		end
        
        $finish;
    end
endmodule
