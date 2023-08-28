module Controller(
input logic Byte_ready,T_Byte,
input logic clk,rst,
input logic counter_i,counter_baud,
output logic start_o,shift_o,load_xmt_shift_reg,clear_baud,clear_i
    );
    logic [1:0] CS,NS;
    parameter S0=2'b00;
    parameter S1=2'b01;
    parameter S2=2'b10;
    
    always_ff @(posedge clk)
    begin
         if (rst==1)
            CS<=S0;
         else
            CS<=NS;
    end
    
    always_comb begin
         case(CS)
             S0:
                if(Byte_ready==0)
                     NS<=S0;
                else
                     NS<=S1;
             S1:
                if(T_Byte==0)
                     NS<=S1;
                else
                     NS<=S2;
             S2:
                if(counter_i==0 && counter_baud==0)
                     NS<=S2;
                else if(counter_i==0 && counter_baud==1)
                     NS<=S2;
                else if(counter_i==1 && counter_baud==0)
                     NS<=S2;
                else 
                     NS<=S0;
         endcase
    end
    
    always_comb begin
         case(CS)
            S0:
               if (Byte_ready==0) begin
                  clear_baud<=1;
                  clear_i<=1;
                  start_o<=0;
                  end
               else begin
                  clear_baud<=1;
                  clear_i<=1;
                  start_o<=0;
                  shift_o<=0;
                  load_xmt_shift_reg<=1;
                  end
            S1: 
               if (T_Byte ==0) begin
                  clear_baud<=1;
                  clear_i<=1;
                  start_o<=0;
                  shift_o<=0;
                 end
               else begin
                  clear_baud<=1;
                  clear_i<=1;
                  start_o<=1;
                  shift_o<=0;
                  end
           S2:
               if(counter_i==0 && counter_baud==0) begin
                  clear_i<=0;
                  clear_baud<=0;
                  start_o<=1;
                  shift_o<=0;
                  end
               else if(counter_i==0 && counter_baud==1) begin
                  clear_i<=0;
                  shift_o<=1;
                  start_o<=1;
                  clear_baud<=1;
                  end
               else if(counter_i==1 && counter_baud==0) begin
                  clear_i<=0;
                  clear_baud<=0;
                  start_o<=1;
                  shift_o<=0;
                  end
               else begin
                  clear_i<=1;
                  clear_baud<=1;
                  end
         endcase
    end
endmodule
