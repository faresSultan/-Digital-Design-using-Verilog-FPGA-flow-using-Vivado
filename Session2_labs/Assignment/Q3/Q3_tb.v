module Decimal_to_BCD_Encoder (D,Y);

input [9:0] D;
Output reg [3:0] Y;

always @(*) begin

    case (D)
        10'h001: Y = 0; 
        10'h002: Y = 1; 
        10'h004: Y = 2; 
        10'h008: Y = 3; 
        10'h010: Y = 4; 
        10'h020: Y = 5; 
        10'h040: Y = 6; 
        10'h080: Y = 7; 
        10'h100: Y = 8; 
        10'h200: Y = 9; 
        default: Y=0;
    endcase
    
end

    
endmodule