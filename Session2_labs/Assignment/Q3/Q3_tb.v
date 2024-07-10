module Decimal_to_BCD_Encoder_tb ();

    reg  [9:0] D_tb;
    reg  [3:0] Y_exp;
    wire  [3:0] Y_tb;
    Decimal_to_BCD_Encoder BCD_encoder_tb (.D(D_tb),.Y(Y_tb));
integer i;

    initial begin


        D_tb = 10'h001;
        #10;
        D_tb = 10'h010;
        #10;
        D_tb = 10'h040;
        #10;
        D_tb = 10'h200;
        #10;
        D_tb = 10'h200;
        #10;
        for(i=0;i<40;i = i+1)begin
            D_tb = $random;
            
           case (D_tb)
                  10'h001: Y_exp = 0;  
                  10'h002: Y_exp = 1; 
                  10'h004: Y_exp = 2; 
                  10'h008: Y_exp = 3; 
                  10'h010: Y_exp = 4; 
                  10'h020: Y_exp = 5; 
                  10'h040: Y_exp = 6; 
                  10'h080: Y_exp = 7; 
                  10'h100: Y_exp = 8; 
                  10'h200: Y_exp = 9; 
                  default: Y_exp = 0;
    endcase
    
            #10; 
            if (Y_tb != Y_exp) begin
                $display("Error - Output is incorrect\n");
                #10;
                $stop; 
            end
              
        end
        $display("Passed");
            $stop;
    end
    
endmodule
