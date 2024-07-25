module DSP #(parameter OPERATION = "ADD") (
    input [17:0] A, B, D,
    input [47:0] C,
    input clk,
    input rst_n,
    output reg [47:0] P
);
    
    reg [47:0] multiplier_out;
    reg [18:0] adder1;
    
    always @(posedge clk) begin
        if(OPERATION == "ADD") Adder1 <= D+B;
        else if(OPERATION == "SUBTRACT") Adder1 <= D-B;

        multiplier_out <= A * Adder1;
    end
    

    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            P <= 48'b0;  // Reset output
        end else begin
            if (OPERATION == "ADD") begin
                
                P <= multiplier_out + C;
            end else if (OPERATION == "SUBTRACT") begin
                
                P <= (multiplier_out - C);
            end
        end
    end

endmodule


    