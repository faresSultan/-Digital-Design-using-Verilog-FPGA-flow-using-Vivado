
 module Q1_tb();

    reg CLR_tb,D_tb,G_tb;
    wire Q_tb;

    active_low_clear_latch DUT_latch (.CLR(CLR_tb),.D(D_tb),.G(G_tb),.Q(Q_tb));

    initial begin
        
         // Checking the functionality of the CLR signal
        CLR_tb = 0;     
        D_tb = 1;
        G_tb = 1;
        #10;
        
        // checking the rest of the design while clear signal is disabled
        CLR_tb = 1;

        repeat(20) begin
            D_tb = $random;
            G_tb = $random;
            #10;
        end

    end
    
 endmodule