module SLE_with_LAT (D,CLK,EN,ALn,ADn,SLn,SD,LAT,Q);
    
    input D,CLK,EN,ALn,ADn,SLn,SD,LAT;
    output reg Q; 

    always @(posedge CLK or negedge ALn) begin
        if(ALn == 0) begin
            Q <= ~ADn;
        end
        else if (EN == 1) begin
            if(SLn == 0) begin
               Q <= SD;
            end
            else if (SLn == 1) begin
                Q <= D;
            end
        end
    end
    always @(CLK) begin
        if ((EN==1) && (LAT==1)) begin
            if(SLn == 0) begin
               Q <= SD;
            end
            else if (SLn == 1) begin
                Q <= D;
            end
        end
    end
    
endmodule

