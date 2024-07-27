module DSP #(parameter OPERATION = "ADD") (
    input [17:0] A, B, D,
    input [47:0] C,
    input clk,
    input rst_n,
    output reg [47:0] P
);
    
    reg [47:0] multiplier_out;
    reg [18:0] adder1;
    reg [17:0] A_reg1,A_reg2,B_reg,D_reg;
    reg [47:0] C_reg;
    
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            P <= 48'b0;  // Reset output
        end else begin
            A_reg1 <= A;
            A_reg2 <= A_reg1;
            B_reg <= B;
            C_reg <= C;
            D_reg <= D;
            if (OPERATION == "ADD") begin
                adder1 <= D_reg + C_reg;
                multiplier_out <= A_reg2 * adder1; 
                P <= multiplier_out + C;

            end else if (OPERATION == "SUBTRACT") begin
                adder1 <= D_reg - C_reg;
                multiplier_out <= A_reg2 * adder1;
                P <= (multiplier_out - C);
            end
        end
    end

endmodule


    