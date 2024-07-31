module DSP48A1 #(
    parameter A0REG = 0,parameter A1REG = 1,
    parameter B0REG = 0,parameter B1REG = 1,
    parameter CREG = 1, parameter DREG = 1, parameter MREG = 1
    parameter PREG = 1, parameter CARRYINREG = 1, parameter CARRYOUTREG = 1, parameter OPMODEREG = 1,
    parameter CARRYINSEL = "OPMODE5", parameter B_INPUT = "DIRECT", parameter RSTTYPE = "SYNC"   
) (
    ports
);
    
endmodule