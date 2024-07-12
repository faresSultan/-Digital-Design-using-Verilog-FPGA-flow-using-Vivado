
module Gray_Hot_encoder #( USE_GRAY=1) (A,B);

    input [2:0]A;
    output reg [6:0]B;

    always @(A) begin
        
        if(USE_GRAY == 1) begin
            
            case (A)
             'b000: B = 7'b0000000;
             'b001: B = 7'b0000001;
             'b010: B = 7'b0000011;
             'b011: B = 7'b0000010;
             'b100: B = 7'b0000110;
             'b101: B = 7'b0000111;
             'b110: B = 7'b0000101;
             'b111: B = 7'b0000100;
            endcase
        end
        else begin
            case (A)
             'b000: B = 7'b0000000;
             'b001: B = 7'b0000001;
             'b010: B = 7'b0000010;
             'b011: B = 7'b0000100;
             'b100: B = 7'b0001000;
             'b101: B = 7'b0010000;
             'b110: B = 7'b0100000;
             'b111: B = 7'b1000000;
            endcase
            
        end
        
    end
    
endmodule