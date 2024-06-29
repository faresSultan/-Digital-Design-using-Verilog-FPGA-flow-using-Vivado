

module mux(in0,in1,sel,out);

    input in0, in1, sel;
    output out;
    assign out = (sel==1)? in1:in0;

endmodule

