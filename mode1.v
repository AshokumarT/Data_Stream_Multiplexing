`timescale 1ns / 1ps
module mode1( input clk,
              input symbol_clk,
              input [31:0] switch_clk_cycles,
              input [15:0] DS1,
              output reg  [15:0] out_1
              );
 reg [15:0] count=1;
 always@(posedge clk) begin
 if (count <  switch_clk_cycles) begin
 out_1 <= DS1;
 count <= count+1;
 end
 else count <= 1;
 end            
endmodule
