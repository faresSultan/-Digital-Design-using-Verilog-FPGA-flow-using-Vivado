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

   
    DSP48A1 DUT (.A(A),.B(B),.C(C),.D(D),
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
    

initial begin
    RSTB = 1;RSTD = 1; CEOPMODE = 1;
    RSTA = 1; RSTM = 1; CEM =1;CEA = 1;
    RSTC = 1; RSTCARRYIN = 1; RSTP = 1;
    CEC = 1; CECARRYIN = 1; CEP = 1;
    @(negedge clk)

    //---------Pre-adder/sub Stage testbench-----------
    RSTB = 0; RSTD = 0;
    CEB = 1; CED = 1;
    BCIN = 500;
    B = 450;
    D = 500;    
    OPMODE= 8'b00000000;
    @(negedge clk)
    @(negedge clk)
    OPMODE[6] = 1;
    @(negedge clk)
    @(negedge clk)
//    $stop; // tested and working well

//---------Multiplier Stage testbench-----------
    
    RSTA = 0; RSTM = 0;
    A = 2;
    OPMODE[4] = 0;
    @(negedge clk);
    @(negedge clk);
    OPMODE[4] = 1;
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
//   $stop; // tested and working well 


//---------Post adder/subtractor Stage testbench-----------
    RSTC = 0; RSTCARRYIN = 0; RSTP = 0;
    C = 50; PCIN  = 100;  OPMODE[5] = 0;CARRYIN = 1;
    
    OPMODE[7] = 0; //add operation
    {OPMODE[1],OPMODE[0]} = 2'b00;  // Operand1 = 0
    {OPMODE[3],OPMODE[2]} = 2'b01;  // Operand2 = PCIN = 100
    @(negedge clk);
    @(negedge clk);   // 0+0+100 = 100 (Correct output)
    
    {OPMODE[1],OPMODE[0]} = 2'b01;  // Operand1 = M = 100
    {OPMODE[3],OPMODE[2]} = 2'b11;  // Operand2 = C = 50
    @(negedge clk);
    @(negedge clk);   // 0+50+100 = 150 (Correct output)

    {OPMODE[1],OPMODE[0]} = 2'b11;  // Operand1 = D:A:B = 0x1F4000080032
    {OPMODE[3],OPMODE[2]} = 2'b10;  // Operand2 = P_old = 0x96
    @(negedge clk);
    @(negedge clk);   //  0x1F40000800C8 (Correct output)
    $stop;
end
    
endmodule
 
 
 
 
