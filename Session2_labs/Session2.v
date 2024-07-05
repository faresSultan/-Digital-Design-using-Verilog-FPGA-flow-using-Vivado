
// /****************LAB1******************/
// module N_Bit_ALU(A,B,ALU_OP,RES);
// parameter N = 4 ;
// input [N-1:0] A,B;
// input [1:0] ALU_OP;
// output reg [N-1:0] RES;

// always @(*) begin
// case ({ALU_OP[1],ALU_OP[0]})

//     2'b00: RES = A+B;
//     2'b01: RES = A-B;
//     2'b10: RES = A|B;
//     2'b11: RES = A^B;
//     default: RES = 0;   
// endcase
// end 
// endmodule