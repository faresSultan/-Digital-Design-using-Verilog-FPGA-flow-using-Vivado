module T_type_ff (t,rstn,clk,q,q_bar);

    input t,rstn,clk;
    output q,q_bar;
    reg q;
    assign q_bar = ~q;
    always @(posedge clk or negedge rstn) begin
        
        if(~rstn) begin
            q <= 0;
        end
        else if (t == 1) begin
            q <= ~q;
        end
    end
endmodule


module D_type_ff (d,rstn,clk,q,q_bar);

    input d,rstn,clk;
    output q,q_bar;
    reg q;
    assign q_bar = ~q;

    always @(posedge clk or negedge rstn) begin
        
        if(~rstn) begin
            q <= 0;
        end
        else  begin
            q <= d;
        end
    end
endmodule

module D_T_ff #(parameter FF_TYPE = "DFF") (d,rstn,clk,q,q_bar);

    input d,rstn,clk;
    output q,q_bar;
    reg q;
    assign q_bar = ~q;

    always @(posedge clk or negedge rstn) begin

        if(~rstn) begin
            q <= 0;
        end
        else if (FF_TYPE == "DFF") begin
            q = d;
        end 
        else if (FF_TYPE == "TFF") begin
            if (d == 1) begin
                q <= ~q;
            end
        end
        
    end

endmodule