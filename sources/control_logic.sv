`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2024 12:31:32 AM
// Design Name: 
// Module Name: control_logic
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


module control_logic(
    input CLK,
    input RST_N,
    input [3:0] BTN,
    output [3:0] DIGIT_0,
    output [3:0] DIGIT_1,
    output reg [3:0] DIGIT_2,
    output reg [3:0] DIGIT_3
    );
    
    parameter STATE_IDLE = 0;
    parameter STATE_SET_MINUTES = 1;
    parameter STATE_SET_SECUNDS = 2;
    parameter STATE_COUNT = 3;
    parameter STATE_PAUSE = 4;
    parameter STATE_BEEP = 5;
    
    parameter BUTTON_UP = 0;
    parameter BUTTON_DOWN = 1;
    parameter BUTTON_STOP = 2;
    parameter BUTTON_OK = 3;
    
    reg [2:0] state;
    reg [5:0] minutes;
    reg [5:0] seconds;
    reg [31:0] counter;
    
    
    always @(posedge CLK or negedge RST_N) begin
        if (RST_N == 1'b0) begin
            state <= STATE_IDLE;
            minutes <= 0;
            seconds <= 0;
            counter <= 0;
        end
        else begin
            case (state)
                STATE_IDLE:
                    minutes <= 0;
                    seconds <= 0;
                    counter <= 0;

                    // start set time mode
                    if (BTN[BUTTON_OK] == 1'b1) begin
                        state <= STATE_SET_MINUTES;
                    end
                STATE_SET_MINUTES:
                    // increase minutes
                    if (BTN[BUTTON_UP] == 1'b1) begin
                        if(minutes == 59) begin
                            minutes <= 0;
                        end
                        else begin
                            minutes <= minutes + 1;
                        end
                    end
                    // decrease minutes
                    else if (BTN[BUTTON_DOWN]) begin
                        if(minutes == 0) begin
                            minutes <= 59;
                        end
                        else begin
                            minutes <= minutes - 1;
                        end
                    end
                    // next step
                    else if (BTN[BUTTON_OK]) begin
                        state <= STATE_SET_SECUNDS;
                    end
                    // cancel
                    else if (BTN[BUTTON_STOP]) begin
                        state <= STATE_IDLE;
                    end
                STATE_SET_SECUNDS:
                    // increase seconds
                    if (BTN[BUTTON_UP] == 1'b1) begin
                        if(seconds == 59) begin
                            seconds <= 0;
                        end
                        else begin
                            seconds <= seconds + 1;
                        end
                    end
                    // decrease seconds
                    else if (BTN[BUTTON_DOWN]) begin
                        if(seconds == 0) begin
                            seconds <= 59;
                        end
                        else begin
                            seconds <= seconds - 1;
                        end
                    end
                    // next step
                    else if (BTN[BUTTON_OK]) begin
                        state <= STATE_COUNT;
                    end
                    // cancel
                    else if (BTN[BUTTON_STOP]) begin
                        state <= STATE_IDLE;
                    end
                STATE_COUNT:
                    // cancel
                    if (BTN[BUTTON_STOP]) begin
                        state <= STATE_IDLE;
                    end
                    // pause
                    else if (BTN[BUTTON_OK]) begin
                        state <= STATE_PAUSE;
                    end
                    // counting finished
                    else if(minutes == 0 && seconds == 0) begin
                        state <= STATE_BEEP;
                    end
                    // count
                    else begin
                        counter <= counter + 1;

                        if (counter == 100000000) begin
                            if(seconds == 0) begin
                                seconds <= 59;
                                minutes <= minutes - 1;
                            end
                            else begin
                                seconds <= seconds - 1;
                            end
                        end
                    end
                STATE_PAUSE:
                    // cancel
                    if (BTN[BUTTON_STOP]) begin
                        state <= STATE_IDLE;
                    end
                    // resume
                    else if (BTN[BUTTON_OK]) begin
                        state <= STATE_COUNT;
                    end
                STATE_BEEP:
                    // todo: implement some kind of alarm
                    state <= STATE_IDLE;
            endcase
        end
    end
    
    binary_to_bcd BCD1 (
        .BINARY(minutes),
        .BCD1(DIGIT_0),
        .BCD2(DIGIT_1)
    );

    binary_to_bcd BCD1 (
        .BINARY(seconds),
        .BCD1(DIGIT_2),
        .BCD2(DIGIT_3)
    );
endmodule
