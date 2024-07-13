module Ripple_counter_4bits (clk,rstn,out);

    input clk,rstn;
    output reg [3:0] out;
    wire [3:0] out_temp;
    wire [3:0] Q;

    //assign out_temp = out;

    D_type_ff DFF0 (.d(out[0]),.rstn(rstn),.clk(clk ),.q(Q[0]),.q_bar(out_temp[0]));
    D_type_ff DFF1 (.d(out[1]),.rstn(rstn),.clk(Q[0]),.q(Q[1]),.q_bar(out_temp[1]));
    D_type_ff DFF2 (.d(out[2]),.rstn(rstn),.clk(Q[1]),.q(Q[2]),.q_bar(out_temp[2]));
    D_type_ff DFF3 (.d(out[3]),.rstn(rstn),.clk(Q[2]),.q(Q[3]),.q_bar(out_temp[3]));
    
    always @( posedge clk or negedge rstn) begin

        if (~rstn) begin
            out = 0;
        end else begin
            out = out_temp;
        end
        
    end
endmodule