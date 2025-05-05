module spi_slave_with_single_port_ram ( MOSI,MISO,SS_n,clk,rst_n);

input MOSI,SS_n,clk,rst_n;

output MISO;

wire [9:0] rx_data;
wire rx_valid,tx_valid;
wire [7:0] tx_data;

// spi slave module
Slave_iterface slave (.clk(clk),.rst_n(rst_n),.MOSI(MOSI),.MISO(MISO),.rx_valid(rx_valid),.tx_valid(tx_valid),.rx_data(rx_data),.tx_data(tx_data),.ss_n(SS_n));

// RAM module
 singlePort_Ram ram (.clk(clk),.rst_n(rst_n),.din(rx_data),.rx_valid(rx_valid),.dout(tx_data),.tx_valid(tx_valid));
    
endmodule