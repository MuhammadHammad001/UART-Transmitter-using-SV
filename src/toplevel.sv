module toplevel(input logic [7:0]Data_In,
                input logic Byte_ready,T_Byte,clk,rst,
                output logic Tx
);

logic start_o,shift_o,load_xmt_shift_reg,clear_baud,clear_i;
logic counter_i,counter_baud;

Datapath D1(Data_In,start_o,shift_o,load_xmt_shift_reg,clear_baud,clear_i,clk,rst,counter_i,counter_baud,Tx);

Controller C1(Byte_ready,T_Byte,clk,rst,counter_i,counter_baud,start_o,shift_o,load_xmt_shift_reg,clear_baud,clear_i);

endmodule