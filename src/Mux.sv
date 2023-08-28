module Mux(
    input logic in1,in2,select,
    output logic out
    );
    always_comb begin
        case(select)
           0:
             out=in1;
           1:
             out=in2;
        endcase
    end
endmodule
