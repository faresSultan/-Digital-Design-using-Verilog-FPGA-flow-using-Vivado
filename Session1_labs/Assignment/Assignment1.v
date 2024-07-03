
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


// /*-----Q2-----*/

// module adder_4bit (A,B,Sum);

// input [3:0] A,B;
// output [4:0] Sum;

// assign Sum = A+B;
    
// endmodule

// /*-----Q3-----*/

// module Dec2_4 (A,D);

// input [1:0] A;
// output reg [3:0] D;

// always @(*) begin
    
//     case (A)

//     2'b00: D = 'b0001;
//     2'b01: D = 'b0010;
//     2'b10: D = 'b0100;
//     2'b11: D = 'b1000;
        
//     default:
//     D = 'b0000; 

//     endcase
// end
    
// endmodule


/*-----Q4-----*/

module EvenParityDet (A,out_with_parity);

input [7:0] A;
output [8:0] out_with_parity;
assign out_with_parity = {A[7:0], ^A};
    
endmodule