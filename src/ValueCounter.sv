module ValueCounter(
    input logic clear_i,clk,
    input logic [3:0]baud_counter_value,
    output logic [3:0]counter_value
    );
    always_ff @(posedge clk) begin
      if (clear_i==1)
         counter_value<=0;
      else if (baud_counter_value>5)
         counter_value<=counter_value+4'd1;
    end
endmodule   
