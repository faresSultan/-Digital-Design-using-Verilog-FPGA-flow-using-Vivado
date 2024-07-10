
module N_bit_adder #(parameter N = 1) (A,B,C);

input [N-1:0] A,B;
output [N-1:0] C;

assign C = A+B;
    
endmodule