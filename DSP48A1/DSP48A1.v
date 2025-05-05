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
    assign BCOUT = B1_r;

    wire [35:0] Mulitplier_out,M_r;
    assign Mulitplier_out = A1_r * B1_r; 
    VAL_REG_MUX#(.N(36),.REG_EN(MREG)) M_REG (.val(Mulitplier_out),.rst(RSTM),.CE(CEM),.clk(clk),.mux_out(M_r));
    assign M = ~(~M_r);  // buffer                                                                      // tested

// Post adder/subtractor stage
    wire [47:0] postStage_op1,postStage_op2,postStage_out;
    wire [47:0] C_r;
    wire Cout;
    wire CarryCascade,CARRYIN_r;
    assign CarryCascade = (CARRYINSEL === "OPMODE5")? OPMODE_r[5]:((CARRYINSEL === "CARRYIN")? CARRYIN : 0);

    VAL_REG_MUX#(.N(48),.REG_EN(CREG)) C_REG ( .val(C),.rst(RSTC),.CE(CEC),.clk(clk),.mux_out(C_r) );
    VAL_REG_MUX#(.N(1),.REG_EN(CARRYINREG)) Cin_REG ( .val(CarryCascade),.rst(RSTCARRYIN),.CE(CECARRYIN),.clk(clk),.mux_out(CARRYIN_r) );
    MUX_4_1_N X (.in0(48'h000000000000),.in1({12'h000,M_r}),.in2(P),.in3({D_r[11:0],A1_r[17:0],B1_r[17:0]}),.sel({OPMODE_r[1],OPMODE_r[0]}),.out(postStage_op1));
    MUX_4_1_N Z (.in0(48'h000000000000),.in1(PCIN),.in2(P),.in3(C_r),.sel({OPMODE_r[3],OPMODE_r[2]}),.out(postStage_op2));

    PostAdderSubtractor postStage (.operand1(postStage_op1),.operand2(postStage_op2),.Cin(CARRYIN_r),.OPMODE(OPMODE_r[7]),.postStage_out(postStage_out),.Cout(Cout));
    VAL_REG_MUX#(.N(48),.REG_EN(PREG)) P_REG ( .val(postStage_out),.rst(RSTP),.CE(CEP),.clk(clk),.mux_out(P) ); // output (P)
    assign PCOUT = P;     // output (PCOUT)
    VAL_REG_MUX#(.N(1),.REG_EN(CARRYOUTREG)) CARRRYOUT_REG ( .val(Cout),.rst(RSTP),.CE(CEP),.clk(clk),.mux_out(CARRYOUT) ); // output (CARRYOUT)
    assign CARRYOUTF = CARRYOUT;

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

module PostAdderSubtractor (operand1,operand2,Cin,OPMODE,postStage_out,Cout);
    input [47:0] operand1,operand2;
    input OPMODE;  // 0 ->add, 1->sub
    input Cin;  
    output reg [47:0] postStage_out;
    output reg Cout;

    always @(*) begin
        if (OPMODE == 0) {Cout,postStage_out} = operand1 + operand2 + Cin;
        else if (OPMODE == 1) {Cout,postStage_out} = operand2 - (operand1+Cin);
    end  
endmodule

module MUX_4_1_N # (parameter N = 48)(in0,in1,in2,in3,sel,out);
    input [N-1:0] in0,in1,in2,in3;
    input [1:0] sel;
    output reg [N-1:0] out;

    always @(*) begin
        case (sel)
            'b00: out = in0; 
            'b01: out = in1; 
            'b10: out = in2; 
            'b11: out = in3; 
        endcase    
    end  
endmodule