module Counter(
input logic clear,clk,
output logic [3:0]counter_value
    );
    always_ff @(posedge clk) begin
        if(clear==1)
            counter_value<=4'd0;    
        else 
            counter_value<=counter_value+4'd1;
    end
endmodule
