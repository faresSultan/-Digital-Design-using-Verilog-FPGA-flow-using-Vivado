module singlePort_Ram_tb ();

    reg clk;
    reg rst_n;
    reg rx_valid;
    reg [ADDR_WIDTH+1:0] din; 
    wire [DATA_WIDTH-1:0] dout;
    wire tx_valid;

singlePort_Ram #(.ADDR_WIDTH(8),.MEM_DEPTH(256),.DATA_WIDTH(8)) DUT_ram (clk,rst_n,rx_valid,din,dout,tx_valid);

initial begin
    clk =0;
    forever begin
        #1 clk = ~clk;
    end
end

initial begin
    $readmemh("mem.dat",DUT_ram.mem);
    

    repeat(10000) begin
       
       
        @(negedge clk)
    end
end
    
    
endmodule