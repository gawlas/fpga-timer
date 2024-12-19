`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2024 10:12:49 PM
// Design Name: 
// Module Name: display_controller
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


module display_controller(
    input CLK,
    input RST_N,
    output reg [1:0] SEL
    );
    
    localparam CLOCK_FREQ = 100_000_000;    // Hz
    localparam SINGLE_DIODE_TIME = 5;       // ms
    localparam THRESHOLD = (CLOCK_FREQ * SINGLE_DIODE_TIME) / 1000;
    reg [$clog2(THRESHOLD)-1:0] counter = 0;
    
    always @(posedge CLK or negedge RST_N) begin
        if (RST_N == 1'b0) begin
            counter <= 0;
            SEL <= 2'b00;
        end
        else begin
            counter <= counter + 1;
            if (counter >= THRESHOLD) begin
                SEL <= SEL + 1;
                counter <= 0;
            end
        end
    end
endmodule
