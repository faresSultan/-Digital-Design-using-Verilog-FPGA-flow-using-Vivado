
  module mux3_1_always(
        D0,D1,D2,S0,S1,Y
    );

    input D0,D1,D2,S0,S1;
    output reg Y;

    always @(*) begin
        
        case ({S1,S0})
            2'b00: Y = D0;
            2'b01: Y = D1;
            default: Y = D2;
        endcase

    end
        
    endmodule