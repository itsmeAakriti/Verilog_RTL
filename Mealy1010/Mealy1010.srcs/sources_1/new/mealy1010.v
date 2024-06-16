`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.06.2024 22:59:00
// Design Name: 
// Module Name: mealy1010
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


module mealy1010(
input clk,reset,in,
output reg out
    );
    reg [1:0] pr_st,nxt_st;
    parameter idle=2'b00;
    parameter s0=2'b01;
    parameter s1=2'b10;
    parameter s2=2'b11;
    
    always@(posedge clk)
    begin
    if(reset)
    begin
    pr_st<=idle;
    out<=0;
    end
    else
    pr_st<=nxt_st;
    end
    always@(in,pr_st)
    begin
    case(pr_st)
    idle: 
        begin
        if(in==1)
        begin
        nxt_st=s1;
        out=0;
        end
        else
        begin
        nxt_st=idle;
        out=0;
        end
        end
   s0: 
       begin
       if(in==1)
       begin
       nxt_st=idle;
       out=0;
       end
       else
       begin
       nxt_st=s1;
       out=0;
       end
       end
    s1: 
              begin
              if(in==1)
              begin
              nxt_st=s2;   
              out=0;
              end
              else
              begin
              nxt_st=idle;
              out=0;
              end
              end 
   s2: 
        begin
        if(in==1)
        begin
        nxt_st=idle;   
        out=0;
        end
        else
        begin
        nxt_st=idle;
        out=1;
        end
        end  
    default:
             begin
            if(in==1)
            begin
            nxt_st=s1;
            out=0;
            end
            else
            begin
            nxt_st=idle;
            out=0;
            end
            end
    endcase
    end
endmodule
