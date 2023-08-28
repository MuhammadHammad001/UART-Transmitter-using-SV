module testbench();

  logic clk, rst;
  logic Tx, T_Byte, Byte_ready;
  logic [7:0] Data_In;

  
	toplevel DT(.Data_In(Data_In),.Byte_ready(Byte_ready),.T_Byte(T_Byte), .clk(clk), .rst(rst),.Tx(Tx));

  initial 
  begin         
    clk <= 1'b0;
    forever begin
      #10 clk = ~clk;
    end
  end

  initial begin
    rst <= 1'b1;
    Data_In <= 8'b00100100;
    Byte_ready <= 1'b0;
    T_Byte <= 1'b0;
    @(posedge clk);
    rst <= 1'b0;
    @(posedge clk);
    Byte_ready <= 1'b1;
    repeat (10) @(posedge clk);
    T_Byte <= 1'b1;
	Byte_ready<=0;
    repeat (200) @(posedge clk);
    $stop;
  end

  initial 
  begin
     $monitor("Tx = %b", Tx);
  end

endmodule

