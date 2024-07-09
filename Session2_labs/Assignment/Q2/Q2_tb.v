module Q2_tb ();

reg  [3:0] X_tb;
reg  [1:0] Y_exp;
wire  [1:0] Y_tb;
Priority_encoder_4bit encoder_tb (.X(X_tb),.Y(Y_tb));
integer i;

    initial begin
        for(i=0;i<99;i = i+1)begin
            X_tb = $random;
            
            if (X_tb[3] === 1) begin
                Y_exp = 2'b11;
             end
             else if ((X_tb[3] === 0) && (X_tb[2] === 1)) begin
                
                  Y_exp = 2'b10;
             end
             else if ((X_tb[3] === 0) && (X_tb[2] === 0) && (X_tb[1] === 1)) begin
                
                  Y_exp = 2'b01;
             end
             else begin
                
                  Y_exp = 2'b00;
             end

            if (Y_tb != Y_exp) begin
                $display("Error - Output is incorrect\n");
                #10;
                $stop; 
            end
            #10;   
        end
        $display("Passed");
            $stop;
    end



    
endmodule