
module Priority_encoder_4bit (X,Y);

    input [3:0] X;
    output reg [1:0] Y;

always @(*) begin
   casex(X)
    'b1xxx: Y = 'b11;
    'b01xx: Y = 'b10;
    'b001x: Y = 'b01;
    default: Y = 'b00;
    endcase
     
end
    
endmodule