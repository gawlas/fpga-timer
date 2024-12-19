`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 10:27:33 AM
// Design Name: 
// Module Name: input_logic
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


module input_logic(
    input [3:0] IN,
    input CLK,
    input RST_N,
    output [3:0] OUT
    );
    
    wire [3:0] synchronizer_out;
    wire [3:0] debouncer_out;
    wire [3:0] edge_out;
    
    assign OUT = edge_out;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            synchronizer SYNCHRONIZER (
                .CLK(CLK),
                .RST_N(RST_N),
                .IN(IN[i]),
                .OUT(synchronizer_out[i])
            );
            
            debouncer DEBOUNCER (
                .CLK(CLK),
                .RST_N(RST_N),
                .IN(synchronizer_out[i]),
                .OUT(debouncer_out[i])
            );
            
            pos_edge_detector EDGE_DETECTOR (
                .CLK(CLK),
                .RST_N(RST_N),
                .IN(debouncer_out[i]),
                .OUT(edge_out[i])
            );
        end
    endgenerate

endmodule
