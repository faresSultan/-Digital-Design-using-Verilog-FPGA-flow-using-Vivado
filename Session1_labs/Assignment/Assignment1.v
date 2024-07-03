
// /*-----Q1-----*/
// module mux2(in0,in1,sel,out);

//     input in0, in1, sel;
//     output out;
//     assign out = (sel==1)? in1:in0;

// endmodule

// module func (A,B,C,D,E,F,Sel,Out,Out_bar);

// input A,B,C,D,E,F,Sel;
// output Out, Out_bar;
// wire AND1, XNOR1;

// assign AND1 = A&B&C;
// assign XNOR1 = !(D^E^F);

// mux2 m1 (.sel(Sel), .in0(AND1), .in1(XNOR1),.out(Out));
// assign Out_bar = !Out;

// endmodule


/*-----Q2-----*/

module adder_4bit (A,B,Sum);

input [3:0] A,B;
output [4:0] Sum;

assign Sum = A+B;
    
endmodule