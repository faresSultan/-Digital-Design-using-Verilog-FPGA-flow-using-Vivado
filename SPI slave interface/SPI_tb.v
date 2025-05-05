module SPI_tb ();
  reg MOSI,SS_n,rst_n,clk;
  wire MISO ;
//============= DUT INIT. ===============================
spi_slave_with_single_port_ram dut (.clk(clk),.SS_n(SS_n),.rst_n(rst_n),.MISO(MISO),.MOSI(MOSI));
//============= CLOCK GENERATION ========================
initial begin
  $readmemb("mem.dat",dut.ram.mem);
  clk=0;
  forever begin
    #1 clk=~clk;
  end
end
//============= testbench ================================
initial begin
   rst_n=0;  SS_n=1; MOSI=0;
  @(negedge clk);
  rst_n=1;
  SS_n=0;
  @(negedge clk);
  @(negedge clk);
// 10 bits are being sent through MOSI (address sent)
// accessing the last address of the ram 
  MOSI=0;
  @(negedge clk);
  @(negedge clk);
  MOSI=1;
  repeat(8) begin
  @(negedge clk);
  end
  @(negedge clk);
  SS_n=1;
  @(negedge clk);
//===================================================================
// at idle state 
  SS_n=0;
  @(negedge clk);
  MOSI=0;
  @(negedge clk);
//===================================================================
// sending the 10 bits through MOSI (data is being sent)
  @(negedge clk);
  MOSI=1;
  @(negedge clk);
  repeat(8) begin
    MOSI=$random;
  @(negedge clk);
  end
  @(negedge clk);
  SS_n=1;
  @(negedge clk);
//=====================================================================
//idle state 
  SS_n=0;
  @(negedge clk);
  MOSI=1;
  @(negedge clk);
//=====================================================================
//sending address to read from
  MOSI=1;
  @(negedge clk);
  MOSI=0;
  @(negedge clk);
    MOSI=1;
  repeat(8) begin
  @(negedge clk);
  end
  @(negedge clk);
  SS_n=1;
  @(negedge clk);

//==========================================================
//idle state 
SS_n=0;
@(negedge clk);
MOSI=1;
@(negedge clk);
//READING DATA FROM ADDRESS
repeat(8) begin
  @(negedge clk);
end
@(negedge clk);
SS_n=1;
@(negedge clk);
$stop;
end
endmodule