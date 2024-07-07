
module Q1_tb ();

reg  A_tb,B_tb,C_tb,S_tb;
reg [2:0] D_tb;
wire out_tb,out_bar_tb;
reg out_exp,out_bar_exp;

Func func_tb (.A(A_tb),.B(B_tb),.C(C_tb),.Sel(S_tb),.out(out_tb),.Out_bar(out_bar_tb));

integer i;

    initial begin
        for(i=0;i<99;i = i+1)begin
            D_tb[0] = $random;
            D_tb[1] = $random;
            D_tb[2] = $random;
            S_tb = $random;
            #10;
            if (S_tb == 0) begin
                out_exp = (D_tb[0] & D_tb[1] ) | (D_tb[2]);
                out_bar_exp = ~out_exp;
                if ((out_exp != out_tb) || (out_bar_exp != out_bar_tb)) begin
                     $display("Error - Output is incorrect");
                    $stop; 
                end
                
            end
            
        end
        $display("Passed");
            $stop;
    end



    
endmodule