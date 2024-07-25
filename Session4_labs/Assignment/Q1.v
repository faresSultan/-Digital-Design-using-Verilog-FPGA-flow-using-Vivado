module ALSU #(parameter INPUT_PRIORITY = "A", parameter FULL_ADDER = "ON" ) (
    A,B,opcode,
    cin,serial_in,direction,red_op_A,red_op_B,
    bypass_B,bypass_A,
    clk,rst,
    out,leds);
input [2:0] A,B,opcode;
wire [2:0] A_r,B_r,opcode_r;

input cin,serial_in,direction,red_op_A,red_op_B,bypass_A,bypass_B;
wire cin_r,serial_in_r,direction_r,red_op_A_r,red_op_B_r,bypass_A_r,bypass_B_r;

input clk,rst;
output [5:0] out;
reg [5:0] out_r;

output [15:0] leds;
reg [15:0] leds_r;

N_bit_reg #(.N = 3) A_reg(.D(A),.clk(clk),.rst(rst),.out_r(A_r)); 
N_bit_reg #(.N = 3) B_reg(.D(B),.clk(clk),.rst(rst),.out_r(B_r)); 
N_bit_reg #(.N = 3) opcode_reg(.D(opcode),.clk(clk),.rst(rst),.out_r(opcode_r));

N_bit_reg #(.N = 1) cin_reg(.D(cin),.clk(clk),.rst(rst),.out_r(cin_r)); 
N_bit_reg #(.N = 1) serial_in_reg(.D(serial_in),.clk(clk),.rst(rst),.out_r(serial_in_r)); 
N_bit_reg #(.N = 1) direction_reg(.D(direction),.clk(clk),.rst(rst),.out_r(direction_r)); 
N_bit_reg #(.N = 1) red_op_A_reg(.D(red_op_A),.clk(clk),.rst(rst),.out_r(red_op_A_r));  
N_bit_reg #(.N = 1) red_op_B_reg(.D(red_op_B),.clk(clk),.rst(rst),.out_r(red_op_B_r));  
N_bit_reg #(.N = 1) bypass_A_reg(.D(bypass_A),.clk(clk),.rst(rst),.out_r(bypass_A_r));    
N_bit_reg #(.N = 1) bypass_B_reg(.D(bypass_B),.clk(clk),.rst(rst),.out_r(bypass_B_r));

N_bit_reg #(.N = 16) leds_reg(.D(leds_r),.clk(clk),.rst(rst),.out_r(leds));    
N_bit_reg #(.N = 6) out_reg(.D(out_r),.clk(clk),.rst(rst),.out_r(out));    



    always @(posedge clk or posedge rst) begin
        if(rst == 1) begin
            out_r = 0;
            leds_r = 0;
        end

        else begin
            if ((bypass_A_r || bypass_B_r) == 1) begin // Bypass condition
            if ((INPUT_PRIORITY == "A") && (bypass_A_r == 1)) out_r = A_r;
            else if ((INPUT_PRIORITY == "A") && (bypass_A_r == 0) &&(bypass_B_r == 1)) out_r = B_r;
            else if ((INPUT_PRIORITY == "B") && (bypass_B_r == 1)) out_r = B_r;
            else if ((INPUT_PRIORITY == "B") && (bypass_B_r == 0) &&(bypass_A_r == 1)) out_r = A_r;     
            end 

            else if (opcode_r == 3'b000) begin    // AND
                if ((red_op_A_r && red_op_B_r) == 0) out_r = A_r & B_r;
                else if ((INPUT_PRIORITY == "A") && (red_op_A_r == 1)) out_r = &A_r; 
                else if ((INPUT_PRIORITY == "B") && (red_op_B_r == 1)) out_r = &B_r;
                else if ((INPUT_PRIORITY == "A") && (red_op_A_r == 0) &&(red_op_B_r == 1)) out_r = &B_r; 
                else if ((INPUT_PRIORITY == "B") && (red_op_B_r == 0) &&(red_op_A_r == 1)) out_r = &A_r; 
            end

            else if (opcode_r == 3'b001) begin  // XOR
                if ((red_op_A_r && red_op_B_r) == 0) out_r = A_r ^ B_r;
                else if ((INPUT_PRIORITY == "A") && (red_op_A_r == 1)) out_r = ^A_r; 
                else if ((INPUT_PRIORITY == "B") && (red_op_B_r == 1)) out_r = ^B_r;
                else if ((INPUT_PRIORITY == "A") && (red_op_A_r == 0) &&(red_op_B_r == 1)) out_r = ^B_r; 
                else if ((INPUT_PRIORITY == "B") && (red_op_B_r == 0) &&(red_op_A_r == 1)) out_r = ^A_r; 
            end

            else if (opcode_r == 3'b010) begin    // ADD
                 if (FULL_ADDER == "ON") out_r = A_r + B_r + cin_r;
                 else if (FULL_ADDER == "OFF") out_r = A_r + B_r;
            end 

            else if (opcode_r == 3'b011) begin    // MULTIPLY
                 out_r = A_r * B_r;
            end 

            else if (opcode_r == 3'b100) begin    // SHFIT
                 if (direction_r == 1) out_r = {out_r[6:0],serial_in_r};
                 else out_r = {serial_in_r,out_r[7:1]};
            end

            else if (opcode_r == 3'b101) begin    // ROTATE
                 if (direction_r == 1) out_r = {out_r[6:0],out_r[7]};
                 else out_r = {out_r[0],out_r[7:1]};
            end

            else if ((opcode_r == 3'b110) || (opcode_r == 3'b111)) begin    // invalid cases
                 if (leds_r == 16'hffff) begin
                    leds_r = 16'h0000;
                 end else leds_r = 16'hffff;
            end


        end

    end

endmodule

module N_bit_reg #(N=1) (D,clk,rst,out_r);

    input [N-1:0] D;
    input rst,clk;
    output reg [N-1:0] out_r;

    always @(posedge clk or posedge rst) begin
        if (rst == 1) out_r <= 0;
        else if(clk == 1) out_r <= D;
    end
    
endmodule