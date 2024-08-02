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
    wire [7:0] OPMODE_r;
    VAL_REG_MUX#(.N(8),.REG_EN(OPMODEREG)) OPMODE_REG (.val(OPMODE),.rst(RSTOPMODE),.CE(CEOPMODE),.clk(clk),.mux_out(OPMODE_r));

// pre-adder/subtractor stage
    wire [17:0] D_r,B0_in,B0_r;
    wire [17:0] preStage_out;
    assign B0_in = (B_INPUT === "DIRECT")? B:((B_INPUT === "CASCADE")? BCIN : 0); 
    VAL_REG_MUX#(.N(18),.REG_EN(DREG)) D_REG (.val(D),.rst(RSTD),.CE(CED),.clk(clk),.mux_out(D_r));
    VAL_REG_MUX#(.N(18),.REG_EN(B0REG)) B0_REG (.val(B0_in),.rst(RSTB),.CE(CEB),.clk(clk),.mux_out(B0_r));
    PreAdderSubtractor preStage (.D(D_r),.B(B0_r),.OPMODE(OPMODE_r[6]),.preStage_out(preStage_out));   // tested

// Mulitplier stage
    wire [17:0] A0_r,A1_r;
    VAL_REG_MUX#(.N(18),.REG_EN(A0REG)) A0_REG (.val(A),.rst(RSTA),.CE(CEA),.clk(clk),.mux_out(A0_r));
    VAL_REG_MUX#(.N(18),.REG_EN(A1REG)) A1_REG (.val(A0_r),.rst(RSTA),.CE(CEA),.clk(clk),.mux_out(A1_r)); // operand 1

    wire [17:0] B1_val,B1_r; 
    assign B1_val = (OPMODE_r[4] == 0)? (B0_r) : (preStage_out);
    VAL_REG_MUX#(.N(18),.REG_EN(B1REG)) B1_REG (.val(B1_val),.rst(RSTB),.CE(CEB),.clk(clk),.mux_out(B1_r)); //operand 2

    wire [35:0] Mulitplier_out,M_r;
    assign Mulitplier_out = A1_r * B1_r; 
    VAL_REG_MUX#(.N(36),.REG_EN(MREG)) M_REG (.val(Mulitplier_out),.rst(RSTM),.CE(CEM),.clk(clk),.mux_out(M_r));
    assign M = ~(~M_r);  // buffer                                                                      // tested


endmodule



module VAL_REG_MUX #(parameter N = 1,parameter REG_EN = 1) (val,rst,CE,clk,mux_out);

    input [N-1:0] val;
    input clk,rst,CE;
    output reg [N-1:0] mux_out;

    generate
        if (REG_EN == 1) begin
             always @(posedge clk) begin
                 if (rst) mux_out <= 0;
                 else if(CE) mux_out <= val;
                 end
        end 
        else if (REG_EN == 0) begin
             
             always@(*) begin
              mux_out = val;  
             end
              
        end    
    endgenerate
    
      
    
endmodule


module PreAdderSubtractor (D,B,OPMODE,preStage_out);
    input [17:0] D,B;
    input OPMODE;
    output reg [17:0] preStage_out;

    always @(*) begin
        if (OPMODE == 0) preStage_out = D + B;
        else if (OPMODE == 1) preStage_out = D - B;
    end
    
endmodule