module Q4_tb ();
parameter w = 4;
    
    reg [w-1:0] A_tb,B_tb;
    wire [w-1:0] C_tb;
    reg [w-1:0] C_exp;

    N_bit_adder#(.N(w)) adder_tb (.A(A_tb),.B(B_tb),.C(C_tb));
integer i;

    initial begin

        A_tb = 'hA;
        B_tb = 'h3;
        #10;

        A_tb = 'b1000;
        B_tb = 'b0101;
        #10;

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
