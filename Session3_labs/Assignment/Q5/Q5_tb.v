module Q5_tb();
    reg d,en,clk,aln,adn,sln,sd,lat;
    wire q_dut;
    SLE_with_LAT dut(d,clk,en,aln,adn,sln,sd,lat,q_dut);
    initial begin
        clk=0;
        forever begin
        #1; clk=!clk;
        end
    end
    integer i;
    initial begin
        en=0; aln=1;sln=1;
        @(negedge clk);
        for(i=0;i<100;i=i+1)begin
            if(i<30)begin
             lat=1;adn=1;sd=0;
            end
            else if(i>30&&i<60)begin
                lat=1;adn=0;sd=1;
             end
            else begin
                 lat=0; adn=1; sd=1; 
            end
            d=$random; en=$random; aln=$random; sln=$random;
            @(negedge clk);
        end
        $stop;
    end
endmodule
