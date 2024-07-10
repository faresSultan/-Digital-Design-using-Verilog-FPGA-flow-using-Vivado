
module ALU_N_bits #(parameter n = 4) ( a,b,op,result);

input [n-1:0] a,b;
input [1:0] op;
wire adder_out;
output reg [n-1:0] result;

N_bit_adder#(.N(n)) H_adder (.A(a),.B(b),.C(adder_out));

    always @(*) begin  
        case (op)  

         2'b00: result = adder_out;
         2'b10: result = a-b;
         2'b01: result = a|b;
         2'b11: result = a^b;
         default: result = 0;

        endcase
    end     

    
endmodule