module ALU_with_reg(A,B,opcode,clk,rst,out);

    input [3:0] A,B;
    input [1:0] opcode;
    input clk,rst;

    reg [3:0]A_reg,B_reg;
    reg [1:0]opcode_reg;
    reg [7:0]out_alu;
    output reg [7:0] out;

    ALU alu (.A(A_reg),.B(B_reg),.op(opcode_reg),.out(out_alu));
    N_bit_reg #(.N(4)) A_r (.D(A),.clk(clk),.rst(rst),.out_r(A_reg));
    N_bit_reg #(.N(4)) B_r (.D(B),.clk(clk),.rst(rst),.out_r(B_reg));
    N_bit_reg #(.N(2)) op_r (.D(opcode),.clk(clk),.rst(rst),.out_r(opcode_reg));
    N_bit_reg #(.N(8)) aluOut_r (.D(out_alu),.clk(clk),.rst(rst),.out_r(out));

    // not yet tested

endmodule

module ALU (A,B,op,out);
    input [3:0]A,B;
    input [1:0]op;
    output reg [7:0]out;

    always @(*) begin
        case (op)
           'b00 : out = A + B;
           'b01 : out = A * B;
           'b10 : out = A | B;
           'b11 : out = A & B; 
        endcase
    end
endmodule

module N_bit_reg #(N=4) (D,clk,rst,out_r);

    input [N-1:0] D;
    input rst,clk;
    output reg [N-1:0] out_r;

    always @(posedge clk or posedge rst) begin
        if (rst == 1) out_r <= 0;
        else if(clk == 1) out_r <= D;
    end
    
endmodule