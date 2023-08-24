`timescale 1ns / 1ps
module mode2(input clk,
              input symbol_clk,
              input [31:0] switch_clk_cycles,
              input [15:0] DS1,
              input [15:0] DS2,
              output reg  [15:0] out_2    );
 reg [15:0] count=1;
always @(posedge clk) begin
 
  if (count <= (switch_clk_cycles)) begin
 out_2<=DS1;
 count<=count+1;
 end
 else if (count < (2*switch_clk_cycles) ) begin
 out_2 <= DS2;
 count<=count+1;
 end
  else count<=1;
 end             
endmodule
