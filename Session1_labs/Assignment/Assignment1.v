
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


// /*-----Q4-----*/

// module EvenParityDet (A,out_with_parity);

// input [7:0] A;
// output [8:0] out_with_parity;
// assign out_with_parity = {A[7:0], ^A};
    
// endmodule


/*-----Q5-----*/

// module comparator_4bits (A,B,G,L,E);

// input [3:0] A,B;
// output reg G,L,E;
// always @(*) begin

// if (A>B) begin
//     G = 1;
//     L = 0;
//     E = 0;
// end
// else if (A === B) begin
//     G = 0;
//     L = 0;
//     E = 1;
// end
// else if (A < B) begin
//     G = 0;
//     L = 1;
//     E = 0;
// end
// else begin
//     G = 0;
//     L = 0 ;
//     E = 0;
// end
// end 
// endmodule


/*---------------------------------ASSIGNMENT1_EXTRA---------------------------------*/

// /*-----Q1-----*/
// module F (A,out);

// input [3:0] A;
// output out;

//     and(AND1, A[2], !A[3]);
//     and(AND2, !A[3], A[1], A[0]);
//     or(out,AND1,AND2);
  
// endmodule

// /*-----Q3-----*/

// module F (A,B,C,func);

// input A,B,C;
// output func
// xor (G1,A,B);
// xnor (G2,C,B);
// and (func,C,G1,G2);
    
// endmodule

// /*-----Q4-----*/
// module PN (A,PN);
    
//     input [2:0] A;
//     output PN;

//     and (G1,!A[2],A[1]);
//     and (G2,A[2],A[0]);
//     or (PN, G1, G2);

// endmodule


/*-----Q5-----*/

module ALU_1bit (A,B,Ainvert,Binvert,Cin,op,Result,Cout);

module adder_sub1 (A,B,carryin,inv,R,carryout)

    input A,B,inv,carryin;
    output reg R,carryout;

    always @(*) begin

        if (inv == 0) begin
             {carryout,R} = A+B+carryin;
        end
        
    end

 endmodule

input A,B,Ainvert,Binvert,Cin;
input [1:0] op;
output Result,Cout;

assign Result = (op === 'b00) ? A&B : (op === 'b01) ? A|B : <default_value>);


    
endmodule