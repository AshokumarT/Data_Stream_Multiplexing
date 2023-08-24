# Data_Stream_Multiplexing
Inputs :                                                                Outputs:

clk: Internal clock signal operating at 100                                     output_data: 16-bit output data stream
MHz.                                                                            representing the selected data stream based
                                                                                on the mode of operation.
symbol_clk: External clock synchronizing                                        
incoming data streams, frequency ranging
from 1 kHz to 50 MHz.
mode: 2-bit input to determine the desired
mode of operation (values 00, 01, 10, or 11).

switch_clk_cycles: 32-bit input
representing the number of clk cycles after
which the data stream in the output should
switch to the next one.

DS1, DS2, DS3: 16-bit data streams
synchronized with the symbol_clk.

In this design, there are four submodules are used in top module (DataStream_top.v). they are
1.mode1.v :
            In this sub module mode1 respective output is assigned to DS1 when count is less than switch_clk_cycles, 
            means output takes next input after  switch_clk_cycles number of the clk cycles.
2.mode2:            
       In this sub module mode1 respective output is assigned to DS1 when count is less than switch_clk_cycles(scc), 
       output is assigned to DS2 when count is in betweeen switch_clk_cycles and 2 times switch_clk_cycles.
      here 2 times switch_clk_cycles represents total number of clk cycles for one symbol clock cycle.
     
     count= 1                              scc                        2*scc 
            |<---------------DS1----------->|<----------DS2------------>|
            |<--total number of clk cycles for one symbol clock cycle-->|
3.mode3:            
       In this sub module mode1 respective output is assigned to DS1 when count is less than switch_clk_cycles(scc), 
       output is assigned to DS2 when count is in betweeen switch_clk_cycles and 2 times switch_clk_cycles.
       output is assigned to DS3 when count is in betweeen 2 times switch_clk_cycles and 3 times switch_clk_cycles.
      here 3 times switch_clk_cycles represents total number of clk cycles for one symbol clock cycle.
     
     count= 1                 scc                 2*scc                 3*scc
            |<-------DS1-------|<-------DS2------->|<-------DS3-------->|
            |<--total number of clk cycles for one symbol clock cycle-->|  
4.multiplexer:
              Based on the mode, final output is generated in this modules using case statement. 

In top module , as specified in the code sub module a instantation is done.


