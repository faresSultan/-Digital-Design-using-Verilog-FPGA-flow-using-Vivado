module DSP48A1_tb(); 

//--------inputs------------
    reg [17:0] A,B,D;
    reg [47:0] C,PCIN;
    reg [7:0] OPMODE;
    reg clk;
    reg CARRYIN,BCIN;
    reg RSTA,RSTB,RSTC,RSTD,RSTP,RSTM,RSTCARRYIN,RSTOPMODE;
    reg CEA,CEB,CEC,CED,CEP,CEM,CECARRYIN,CEOPMODE;
//outputs------------

    wire [17:0] BCOUT;
    wire [47:0] PCOUT,P;
    wire [35:0] M;
    wire CARRYOUT, CARRYOUTF;

   
    DSP48A1 DUT_preAdder (.A(A),.B(B),.C(C),.D(D),
    .clk(clk),.CARRYIN(CARRYIN),
    .OPMODE(OPMODE),.BCIN(BCIN),
    .RSTA(RSTA),.RSTB(RSTB),.RSTC(RSTC),.RSTD(RSTD),
    .RSTP(RSTP),.RSTM(RSTM),
    .RSTCARRYIN(RSTCARRYIN),.RSTOPMODE(RSTOPMODE),
    .CEA(CEA),.CEB(CEB),.CEC(CEC),.CED(CED),
    .CEM(CEM),.CEP(CEP),
    .CECARRYIN(CECARRYIN),.CEOPMODE(CEOPMODE),
    .PCIN(PCIN),
    .BCOUT(BCOUT),.PCOUT(PCOUT),.P(P),.M(M),.CARRYOUT(CARRYOUT),.CARRYOUTF(CARRYOUTF));



     initial begin
        clk = 0;
        forever begin
             #1;
             clk = !clk;
        end
    end
    
// //---------Pre-adder/sub Stage testbench-----------
// initial begin
//     RSTB = 1;RSTD = 1; CEOPMODE = 1;
//     @(negedge clk)
//     RSTB = 0; RSTD = 0;
//     CEB = 1; CED = 1;
//     BCIN = 500;
//     B = 450;
//     D = 500;    
//     OPMODE= 8'b00000000;
//     @(negedge clk)
//     @(negedge clk)
//     OPMODE[6] = 1;
//     @(negedge clk)
//     @(negedge clk)
//     $stop; // tested and working well
// end
    
endmodule
 
 
 
 
