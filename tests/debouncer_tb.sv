`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 11:02:30 AM
// Design Name: 
// Module Name: debouncer_tb
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



module debouncer_tb;
    // inputs
    reg IN;
    reg RST_N;
    reg CLK;
    wire OUT;
        
    // clock
    initial CLK = 0;
    always #5 CLK = ~CLK;
   
    // create UUT
    debouncer UUT(
        .IN(IN),
        .RST_N(RST_N),
        .CLK(CLK),
        .OUT(OUT)
    );
    
    initial begin
        // set reset
        RST_N = 0;
        IN = 0;
        
        // wait for some time
        #100;
        
        // start
        RST_N = 1;
        #100;
        
        IN = 1;
        #100
        IN = 0;
        #100
        IN = 1;
        #200
        IN = 0;
        #50
        IN = 1;
        
        #100_000_000;
        
        // end simulation
        $finish;
    end

endmodule