module s3 (D,E,PRE,CLK,Q);

    input D,E,PRE,CLK;
    output reg Q;

    always @(PRE, posedge CLK) begin

        if (PRE == 0) begin
            Q <= 1;
        end
        else if (E == 1) begin
            Q <= D;
        end
        
    end
    
endmodule