`timescale 1ns / 1ps
module mode3( input clk,
              input symbol_clk,
              input [31:0]switch_clk_cycles,
              input [15:0] DS1,
              input [15:0] DS2,
              input [15:0] DS3,
              output reg  [15:0]  out_3   );
reg [31:0] count=1;
always @(posedge clk) begin
if (count<(switch_clk_cycles)  ) begin
out_3<=DS1;
count<=count+1;
end
else if (count < (2*(switch_clk_cycles)) ) begin
out_3<=DS2;
count<=count+1;
end
else if ( count < 3*(switch_clk_cycles)) begin
out_3<=DS3;
count<=count+1;
end
else count<=1;
end
              
              
endmodule
