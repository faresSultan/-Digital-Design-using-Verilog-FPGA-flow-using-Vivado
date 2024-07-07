
module N_way_2_1_mux #(parameter N = 1 ) (in0,in1,sel,out);

    input [N-1:0] in0, in1;
    input sel;
    output [N-1:0] out;
    assign out = (sel==1)? in1:in0;
    
endmodule

module Func (A,B,C,D,Sel,Out,Out_bar);

    input A,B,C,Sel;
    input [2:0] D;

    output Out,Out_bar;

    xnor (XNOR1,A,B,C);

    or (OR1, (D[0]&D[1]),D[2]);

    N_way_2_1_mux MUX1 (.in0(OR1),.in1(XNOR1),.sel(Sel),.out(Out));
    assign Out_bar = ~Out;
    
endmodule


