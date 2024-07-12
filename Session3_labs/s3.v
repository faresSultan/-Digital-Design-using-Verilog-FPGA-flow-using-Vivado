module dff_E_PRE (D,E,PRE,CLK,Q);

    input D,E,PRE,CLK;
    output reg Q;

    always @(negedge PRE or posedge CLK) begin

        if (~PRE) begin
            Q <= 1;
        end
        else if (E) begin
            Q <= D;
        end
        // else Q=Q is meaningless
        
    end
    
endmodule