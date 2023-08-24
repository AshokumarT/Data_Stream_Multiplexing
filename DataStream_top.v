`timescale 1ns / 1ps
module DataStream_top(input clk,
                      input symbol_clk,
                      input [31:0]switch_clock_cycles,
                      input [1:0] mode,
                      input [15:0] DS1,
                      input [15:0] DS2,
                      input [15:0] DS3,
                      output  [15:0] multiplexed_data  );
 wire [15:0] out_1;
 wire [15:0] out_2;
 wire [15:0] out_3;
 mode1 U1(clk,symbol_clk,switch_clock_cycles,DS1,out_1);
 mode2 U2(clk,symbol_clk,switch_clock_cycles,DS1,DS2,out_2);                      
 mode3 U3(clk,symbol_clk,switch_clock_cycles,DS1,DS2,DS3,out_3); 
 multiplexer U4(out_1,out_2,out_3,mode,multiplexed_data);                     
endmodule
