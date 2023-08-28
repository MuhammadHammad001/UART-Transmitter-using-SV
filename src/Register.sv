module Register(
   input logic clk,rst,
   input logic [7:0]data_in,
   input logic load,
   output logic [8:0]out
    );
   always_ff @(posedge clk) begin
      if (rst==1)
         out<=0;
      else if (load==1)
         out<={data_in,1'b0};
   end 
endmodule
