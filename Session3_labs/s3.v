module s3 (D,E,PRE,CLK,Q);

    input D,E,PRE,CLK;
    output reg Q;

    always @(negedge PRE, posedge CLK) begin

        if (~PRE) begin
            Q <= 1;
        end
        else if (E) begin
            Q <= D;
        end
        
    end
    
endmodule