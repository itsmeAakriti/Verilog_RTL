`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2024 23:54:50
// Design Name: 
// Module Name: piso_reg
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


module piso_reg(
Clk, Parallel_In,load, Serial_Out);
    input Clk,load;
    input [3:0]Parallel_In;
    output reg Serial_Out;
    reg [3:0]tmp;
    always @(posedge Clk)
    begin
    if(load)
    tmp<=Parallel_In;
    else
    begin
    Serial_Out<=tmp[3];
    tmp<={tmp[2:0],1'b0};
    end
    end
    endmodule
    

