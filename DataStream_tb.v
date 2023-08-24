`timescale 1ns / 1ps
module DataStream_tb ;
reg clk;
reg symbol_clk;
reg [1:0] mode;
reg [31:0] switch_clock_cycles;
reg [15:0] DS1;
reg [15:0] DS2;
reg [15:0] DS3;
wire [15:0] multiplexed_data;


DataStream_top DUT (
    .clk(clk),
    .symbol_clk(symbol_clk),
    .mode(mode),
    .switch_clock_cycles(switch_clock_cycles),
    .DS1(DS1),
    .DS2(DS2),
    .DS3(DS3),
    .multiplexed_data(multiplexed_data)
);
integer t_clk=5;
integer t_sym_clk=10;
initial begin
clk=1;
symbol_clk=1;
//switch_clock_cycles=(t_sym_clk/t_clk);//mode1
switch_clock_cycles=(t_sym_clk/t_clk)/2;//
//switch_clock_cycles=(t_sym_clk/t_clk)/3;//mode3
mode=2'b10;
DS1=16'd1;
DS2=16'd7;
DS3=16'd10;
end
always #t_clk clk=~clk;
always #t_sym_clk symbol_clk=~symbol_clk;
always @(posedge symbol_clk) begin
DS1=DS1+1;
DS2=DS2+1;
DS3=DS3+1;
end
endmodule
