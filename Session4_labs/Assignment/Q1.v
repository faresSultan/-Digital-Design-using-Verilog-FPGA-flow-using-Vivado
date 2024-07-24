module ALSU #(parameter INPUT_PRIORITY = "A", parameter FULL_ADDER = "ON" ) (
    A,B,opcode,
    cin,serial_in,direction,red_op_A,red_op_B,
    bypass_B,bypass_A,
    clk,rst,
    out,leds);
input [2:0] A,B,opcode;
input cin,serial_in,direction,red_op_A,red_op_B,bypass_A,bypass_B,clk,rst;
output reg [5:0] out;
output reg [15:0] leds;



    
endmodule