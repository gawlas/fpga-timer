`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2024 10:45:55 PM
// Design Name: 
// Module Name: display_controller_tb
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


module display_controller_tb;
    // inputs
    reg CLK;
    reg RST_N;
    
    // outputs
    wire [1:0] SEL;
    
    // clock
    initial CLK = 0;
    always #5 CLK = ~CLK;
   
    // create UUT
    display_controller UUT(
        .CLK(CLK),
        .RST_N(RST_N),
        .SEL(SEL)
    );
    
    initial begin
        // set reset
        RST_N = 0;
        
        // wait for some time
        #100;
        
        // start
        RST_N = 1;
        
        // wait
        #1000000000;
        
        // end simulation
        $finish;
    end

endmodule
