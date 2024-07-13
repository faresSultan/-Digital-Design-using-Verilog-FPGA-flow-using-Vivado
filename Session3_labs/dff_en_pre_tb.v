module dff_en_pre_tb();
    
    reg clk;
    reg d_tb,e_tb,pre_tb;
    wire q_tb;

    initial begin
        clk = 0;

        forever begin
            #1 clk = ~clk;
        end
    end
        dff_E_PRE DUT (.D(d_tb),.E(e_tb),.PRE(pre_tb),.CLK(clk),.Q(q_tb));
        
    initial begin
        pre_tb = 0;
        d_tb = 0;
        e_tb = 0;
        @(negedge clk);
        pre_tb = 1;

        repeat (10) begin
            d_tb = $random;
        @(negedge clk);
        end

        e_tb = 1;
        repeat (50) begin
            d_tb = $random;
        @(negedge clk);
        end

        repeat (10) begin
            d_tb = $random;
            e_tb = $random;
        @(negedge clk);
        end
        $stop;
        end

        endmodule


