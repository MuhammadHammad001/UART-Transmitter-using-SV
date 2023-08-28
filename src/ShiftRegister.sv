module ShiftRegister(
      input logic clk,rst,start,shift,
      input logic [8:0]xmt_shift_reg,
      output logic [8:0]shifted_reg

    );
    always_ff @(posedge clk) begin
         if(rst==1)
            shifted_reg<=0;
         else if (start==0 && shift==0)
               shifted_reg<=xmt_shift_reg;
         else if (start==1 && shift==0)
               shifted_reg<=shifted_reg;
         else if (start==1 && shift==1)
                  shifted_reg<={1'b1,shifted_reg[8:1]};
    end
    
endmodule
