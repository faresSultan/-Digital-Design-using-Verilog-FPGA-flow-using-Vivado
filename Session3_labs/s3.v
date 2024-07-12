// module dff_E_PRE (D,E,PRE,CLK,Q);

//     input D,E,PRE,CLK;
//     output reg Q;

//     always @(negedge PRE or posedge CLK) begin

//         if (~PRE) begin
//             Q <= 1;
//         end
//         else if (E) begin
//             Q <= D;
//         end
//         // else Q=Q is meaningless
        
//     end
    
// endmodule



module shift_r (C,SI,LEFT_RIGHT,PO);

    input C,SI,LEFT_RIGHT;
    output [7:0] PO;

    always @(posedge C) begin
        
        if (LEFT_RIGHT) begin
            PO <= {SI,PO[7:1]};
        end
        else begin
            PO <= {PO[6:0],SI};
        end
    end
    
endmodule