`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 10:50:48 AM
// Design Name: 
// Module Name: synchronizer_tb
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

module synchronizer_tb;
    // inputs
    reg IN;
    reg RST_N;
    reg CLK;
    wire OUT;
        
    // clock
    initial CLK = 0;
    always #5 CLK = ~CLK;
   
    // create UUT
    synchronizer UUT(
        .IN(IN),
        .RST_N(RST_N),
        .CLK(CLK),
        .OUT(OUT)
    );
    
    initial begin
        // set reset
        RST_N = 0;
        IN = 1;
        
        // wait for some time
        #100;
        
        // start
        RST_N = 1;
        
        // wait
        #100;
        
        // end simulation
        $finish;
    end

endmodule
