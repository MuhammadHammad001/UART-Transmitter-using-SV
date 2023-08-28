module Datapath(input logic [7:0]Data_In,
                input logic start_o,shift_o,load_xmt_shift_reg,clear_baud,clear_i,clk,rst,
                output logic counter_i,counter_baud,Tx);
       logic [8:0]xmt_shift_reg,shifted_reg;
       logic [3:0]baud_counter_value;
       logic [3:0]counter_value;
       Register R1(clk,rst,Data_In,load_xmt_shift_reg,xmt_shift_reg);
       ShiftRegister SR1(clk,rst,start_o,shift_o,xmt_shift_reg,shifted_reg);
       ValueCounter C1(clear_i,clk,baud_counter_value,counter_value);
       Counter C2(clear_baud,clk,baud_counter_value);
       Comparator Com1(counter_value,4'd9,counter_i);
       Comparator Com2(baud_counter_value,4'd5,counter_baud);
       Mux M1(1,shifted_reg[0],start_o,Tx);
       
endmodule
