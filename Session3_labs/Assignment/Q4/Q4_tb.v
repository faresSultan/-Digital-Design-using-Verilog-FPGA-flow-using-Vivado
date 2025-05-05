module Q4_tb();
   reg sclr,sset,shiftin,load,clk,enable,aclr,aset;
   reg [7:0]data;
   wire shiftout;
   wire [7:0]q;
Parameterized_Shift_register dut(.sclr(sclr),.sset(sset),.shiftin(shiftin),.load(load),.data(data),.clk(clk),
.en(enable),.aclr(aclr),.aset(aset),.shiftout(shiftout),.q(q));
initial begin
   clk=0;
   forever begin
   #1 clk=!clk;
   end
 end

integer i;
initial begin
   sclr=0; 
   sset=0;
   aclr=0;
   aset=0;
   enable=1;
   data=0;
   shiftin=0; 
   load=0;
   enable=1;
   @(negedge clk);
      for(i=0;i<100;i=i+1)begin
         sset=$random;
         data=$random;
         shiftin=$random;
         load=$random;
         if(i>60 && i<100)begin 
            aclr=$random; aset=$random; sclr=$random; enable=$random; 
         end
         @(negedge clk);
      end
   $stop;

end
endmodule