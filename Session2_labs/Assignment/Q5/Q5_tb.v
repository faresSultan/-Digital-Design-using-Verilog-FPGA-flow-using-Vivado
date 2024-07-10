module Q5_tb ();

    parameter N = 4;

    reg [N-1:0] A_tb,B_tb;
    reg [1:0] op_tb;
    wire [N-1:0] res_tb;
    
    reg [N-1:0] res_exp;


    ALU_N_bits #(.n(N)) ALU_DUT (.a(A_tb),.b(B_tb),.op(op_tb),.result(res_tb));
integer i;

    initial begin

        for(i=0;i<50;i = i+1)begin
            A_tb = $random;
            B_tb = $random;
            op_tb = $random;
            
            case (op_tb)
                'b00: res_exp = A_tb + B_tb;  
                'b10: res_exp = A_tb - B_tb;  
                'b01: res_exp = A_tb | B_tb;  
                'b11: res_exp = A_tb ^ B_tb;   
            endcase
            #10;
            
            if (res_tb != res_exp) begin
                $display("Error - Output is incorrect\n");
                #10;
                $stop; 
            end
              
        end
        $display("Passed");
            $stop;
    end
    
endmodule
