module DSP48A1 #(
    parameter A0REG = 0,parameter A1REG = 1,
    parameter B0REG = 0,parameter B1REG = 1,
    parameter CREG = 1, parameter DREG = 1, parameter MREG = 1,
    parameter PREG = 1, parameter CARRYINREG = 1, parameter CARRYOUTREG = 1, parameter OPMODEREG = 1,
    parameter CARRYINSEL = "OPMODE5", parameter B_INPUT = "DIRECT", parameter RSTTYPE = "SYNC"   
)
(
    A,B,C,D,
    clk,CARRYIN,
    OPMODE,BCIN,
    RSTA,RSTB,RSTC,RSTD,
    RSTP,RSTM,
    RSTCARRYIN,RSTOPMODE,
    CEA,CEB,CEC,CED,
    CEM,CEP,
    CECARRYIN,CEOPMODE,
    PCIN,
//------
    BCOUT,PCOUT,P,M,CARRYOUT,CARRYOUTF
);

//--------inputs------------
    input [17:0] A,B,D;
    input [47:0] C,PCIN;
    input [7:0] OPMODE;
    input clk,CARRYIN,BCIN;
    input RSTA,RSTB,RSTC,RSTD,RSTP,RSTM,RSTCARRYIN,RSTOPMODE;
    input CEA,CEB,CEC,CED,CEP,CEM,CECARRYIN,CEOPMODE;

//--------outputs------------
    output [17:0] BCOUT;
    output [47:0] PCOUT,P;
    output [35:0] M;
    output CARRYOUT, CARRYOUTF;


    
endmodule