`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 10:32:00 AM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    input wire IN,
    input wire CLK,
    input wire RST_N,
    output reg OUT
    );
    // parametrize debounce threshold baed on clock frequency and debounce time
    localparam CLOCK_FREQ = 100_000_000;    // clock frequency in Hz
    localparam DEBOUNCE_TIME_MS = 20;       // debounce time in milliseconds
    localparam THRESHOLD = (CLOCK_FREQ * DEBOUNCE_TIME_MS) / 1000;
    reg [$clog2(THRESHOLD)-1:0] counter = 0;

    always @(posedge CLK or negedge RST_N) begin
        if (RST_N == 1'b0) begin
            counter <= 0;
            OUT <= 0;
        end
        else if (IN == OUT) begin
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
            if (counter >= THRESHOLD) begin
                OUT <= IN;
                counter <= 0;
            end
        end
    end
endmodule
