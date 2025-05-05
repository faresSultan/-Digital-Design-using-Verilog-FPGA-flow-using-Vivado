
/*-----Q1-----*/
module F (A,out);

input [3:0] A;
output out;

    and(AND1, A[2], !A[3]);
    and(AND2, !A[3], A[1], A[0]);
    or(out,AND1,AND2);

    
endmodule