

    module mux3_1_assign (
        D0,D1,D2,S0,S1,Y
    );

    input D0,D1,D2,S0,S1;
    output Y;

    assign Y = (({S1,S0})==2'b00)? D0: (({S1,S0})==2'b01)? D1 : D2 ;
        
    endmodule