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


// opmode reg init
    wire OPMODE_r;
    VAL_REG_MUX#(.N(8)) OPMODE_REG (.val(OPMODE),.sel(OPMODEREG),.rst(RSTOPMODE),.CE(CEOPMODE),.clk(clk),.mux_out(OPMODE_r));

// pre-adder/subtractor stage
    wire D_r,B0_in,B0_r;
    reg preStage_out;
    assign B0_in = (B_INPUT == "DIRECT")? B:((B_INPUT == "CASCADE")? BCIN : 0); 

    VAL_REG_MUX#(.N(18)) D_REG (.val(D),.sel(DREG),.rst(RSTD),.CE(CED),.clk(clk),.mux_out(D_r));
    VAL_REG_MUX#(.N(18)) B_REG (.val(B0_in),.sel(BREG),.rst(RSTB),.CE(CEB),.clk(clk),.mux_out(B0_r));

    always @(B0_r,D_r,OPMODE[6]) begin
        if (OPMODE[6] == 0) preStage_out = D_r + B0_r;
        else if (OPMODE[6] == 1) preStage_out = D_r - B0_r;
    end


endmodule



module VAL_REG_MUX #(parameter N = 1) (val,sel,rst,CE,clk,mux_out);

    input [N-1:0] val;
    input clk,rst,sel,CE;
    output [N-1:0] mux_out;
    reg val_r;

    always @(posedge clk) begin
        if(rst) val_r = 0;
        else if (CE) val_r = val;
    end    
     
     assign mux_out = (sel == 1)? val_r:val;
    
endmodule