`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2024 11:03:48 PM
// Design Name: 
// Module Name: seven_segment_decoder_tb
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


module seven_segment_decoder_tb;
    // inputs
    reg [3:0] DIGIT;
    
    // outputs
    wire [7:0] SEGMENT;
       
    // create UUT
    seven_segment_decoder UUT(
        .DIGIT(DIGIT),
        .SEGMENT(SEGMENT)
    );
    
    integer i;
    
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            #10;
			DIGIT = i;
		end
        
        // wait
        #10;
        
        // end simulation
        $finish;
    end
endmodule

