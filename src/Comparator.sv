module Comparator(
input logic [3:0]in1,
input logic [3:0]in2,
output logic result
    );
    always_comb begin
       if (in1<in2)
           result=0;
       else
           result=1;
    end
endmodule
