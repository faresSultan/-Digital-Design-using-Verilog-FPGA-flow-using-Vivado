
// testbench 1 for the parameterized module as a D-type FF
module Q2A_tb ();
    reg clk;
    reg d_tb,rstn_tb;
    wire q_exp,q_bar_exp,q_tb,q_bar_tb;


    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    D_T_ff #(.FF_TYPE("DFF")) DUT_1(.d(d_tb),.rstn(rstn_tb),.clk(clk),.q(q_tb),.q_bar(q_bar_tb));
    D_type_ff  G_model_1(.d(d_tb),.rstn(rstn_tb),.clk(clk),.q(q_exp),.q_bar(q_bar_exp));

    initial begin
        rstn_tb = 0;
        d_tb = 1;
        @(negedge clk);
        if (q_tb == q_exp)
            begin
            $display("reset signal passed testbench");            
            end 
        else 
            begin
             $display("reset signal failed testbench");
              $stop;
            end

        rstn_tb = 1;

        repeat (10) begin
            d_tb = $random;
            @(negedge clk);

             if (q_tb != q_exp) 
                begin
                $display("Failed for this case: d=%d",d_tb);
                 $stop;
                 end
             else 
                begin
            $display("Passed!");
            end
        end
        $stop;
    end 
endmodule


// testbench 2 for the parameterized module as a T-type FF
module Q2B_tb ();

    reg clk;
    reg d_tb,rstn_tb;
    wire q_exp,q_bar_exp,q_tb,q_bar_tb;


    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    D_T_ff #(.FF_TYPE("TFF")) DUT_1(.d(d_tb),.rstn(rstn_tb),.clk(clk),.q(q_tb),.q_bar(q_bar_tb));
    T_type_ff  G_model_2(.t(d_tb),.rstn(rstn_tb),.clk(clk),.q(q_exp),.q_bar(q_bar_exp));

    initial begin
        rstn_tb = 0;
        d_tb = 1;
        @(negedge clk);
        if (q_tb == q_exp)
            begin
            $display("reset signal passed testbench");            
            end 
        else 
            begin
             $display("reset signal failed testbench");
              $stop;
            end

        rstn_tb = 1;

        repeat (10) begin
            d_tb = $random;
            @(negedge clk);

             if (q_tb != q_exp) 
                begin
                $display("Failed for this case: d=%d",d_tb);
                 $stop;
                 end
             else 
                begin
            $display("Passed!");
            end
        end
        $stop;
    end 
    
endmodule