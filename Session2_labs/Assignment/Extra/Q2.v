module Demux_1_4 (D,S,Y);

input [0:0] D;
input [1:0] S;
output reg [3:0] Y;

always @(D,S) begin
    
    case (S)
        'b00: {Y[3],Y[2],Y[1],Y[0]}  = {3'b000,D};
        'b01: {Y[3],Y[2],Y[1],Y[0]}  = {2'b00,D,1'b0};
        'b10: {Y[3],Y[2],Y[1],Y[0]}  = {1'b0,D,2'b00};
        'b11: {Y[3],Y[2],Y[1],Y[0]}  = {D,3'b000};
    endcase
    
end    
endmodule