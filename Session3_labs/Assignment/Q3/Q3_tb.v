module Q3_tb ();
    reg clk,rstn_tb;
    wire [3:0] out_tb;


Ripple_counter_4bits DUT (.clk(clk),.rstn(rstn_tb),.out(out_tb));

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end



    initial begin
        rstn_tb = 0;
        @(negedge clk);
        
        rstn_tb = 1;

        repeat (50) begin
            @(negedge clk);
        end
        $stop;

    end

endmodule