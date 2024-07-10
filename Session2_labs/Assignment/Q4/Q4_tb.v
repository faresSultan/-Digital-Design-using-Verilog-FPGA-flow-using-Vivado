module Q4_tb ();
    
    reg  A_tb,B_tb;
    wire C_tb;
    reg C_exp;

    N_bit_adder adder_tb (.A(A_tb),.B(B_tb),.C(C_tb));
integer i;

    initial begin

        for(i=0;i<20;i = i+1)begin
            A_tb = $random;
            B_tb = $random;
            
            C_exp = A_tb + B_tb;

            #10; 
            if (C_tb != C_exp) begin
                $display("Error - Output is incorrect\n");
                #10;
                $stop; 
            end
              
        end
        $display("Passed");
            $stop;
    end
    
endmodule
