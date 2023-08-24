`timescale 1ns / 1ps
module multiplexer( input [15:0] out_1,
                    input [15:0] out_2,
                    input [15:0] out_3,
                    input [1:0]  mode,
                    output reg  [15:0]  multiplexed_data 
                    );
always @(*) begin
case(mode)
2'd1: multiplexed_data <=out_1;
2'd2:multiplexed_data <=out_2;
2'd3:multiplexed_data <=out_3;
endcase
end                    
endmodule
