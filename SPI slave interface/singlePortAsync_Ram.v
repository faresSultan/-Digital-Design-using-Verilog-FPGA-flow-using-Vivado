
module singlePortAsync_Ram #(parameter ADDR_WIDH = 8,parameter MEM_DEPTH = 256,parameter DATA_WIDH = 8)(
        din,rx_valid,dout,tx_valid,clk,rst_n
    );

    input clk,rst_n,rx_valid;
    input [ADDR_WIDH+1:0] din;  // (DATA_WIDTH+2)-bit input frame
    
    output reg [DATA_WIDH-1:0] dout; // DATA_WIDTH-bit output word
    output reg tx_valid;

    reg [DATA_WIDH-1 : 0] mem [MEM_DEPTH-1 :0]; 
      
    
    always @(posedge clk or negedge rst_n) begin
        
        if (~rst_n) begin
            dout <= 0;
            tx_valid <=0;
        end
        else begin
            case ({din[9],din[8]})
                2'b00: mem[0] <= din[7:0];   // word 0 will hold the address to be written in
                2'b01: if (rx_valid == 1) mem[mem[0]] <= din[7:0];
                2'b10: mem[0] <= din[7:0];
                2'b11: dout <= mem[mem[0]];
                       tx_valid = 1;
            endcase        
        end
            
    end

endmodule