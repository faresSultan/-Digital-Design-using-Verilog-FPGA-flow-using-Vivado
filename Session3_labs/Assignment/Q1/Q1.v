module active_low_clear_latch (CLR,D,G,Q);

    input CLR,D,G;
    output reg Q;

    always @(G or CLR or D) begin
        
        if(~CLR) begin
            Q <= 0;
        end
        else if (G == 1) begin
            Q <= D;
        end
    end
    
endmodule