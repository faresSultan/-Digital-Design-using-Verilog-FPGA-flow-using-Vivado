module mux_3_1_tb ();

reg D0_tb,D1_tb,D2_tb,S0_tb,S1_tb;
wire Y_dut1 , Y_dut2;

mux3_1_assign DUT_1 (.D0(D0_tb),.D1(D1_tb),.D2(D2_tb),.S0(S0_tb),.S1(S1_tb),.Y(Y_dut1));
mux3_1_always DUT_2 (.D0(D0_tb),.D1(D1_tb),.D2(D2_tb),.S0(S0_tb),.S1(S1_tb),.Y(Y_dut2));

    integer i;

    initial begin
        for(i=0;i<99;i = i+1)begin
            D0_tb = $random;
            D1_tb = $random;
            D2_tb = $random;
            S0_tb = $random;
            S1_tb = $random;
            #10;
            if (Y_dut1 != Y_dut2) begin
                $display("Error - mux output is incorrect");
                $stop;  
            end
            
        end
        $display("Passed");
            $stop;
    end

    
endmodule