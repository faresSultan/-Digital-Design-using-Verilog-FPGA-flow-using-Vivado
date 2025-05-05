// module sync_dp_RAM #(parameter MEM_WIDTH = 16, parameter MEM_DEPTH = 1024, parameter ADDR_SIZE = 10) (
//    din,addr_wr,addr_rd,wr_en,rd_en,blk_select,dout,clk,rst
// );

// input [MEM_WIDTH-1:0] din;
// input [ADDR_SIZE-1:0] addr_rd,addr_wr; 
// input wr_en,rd_en,blk_select,clk,rst; 
// output reg [MEM_WIDTH-1:0] dout; 

// reg [MEM_WIDTH-1:0] mem [MEM_DEPTH-1:0];
 
// always @(posedge clk) begin
//     if (rst) begin
//         dout <= 0;
//     end
//     else begin
//         if (blk_select) begin
//             if (wr_en) mem[addr_wr] <= din;
//             if (rd_en) dout <= mem[addr_rd];
//         end
//     end
// end    
// endmodule

// module sync_dp_RAM_tb ();

//     reg wr_en,rd_en,blk_select;
//     reg [15:0] din;
//     reg [9:0] addr_rd,addr_wr;
//     reg clk, rst;

//     wire [15:0] dout;
    
//     sync_dp_RAM m1(.din(din),.addr_wr(addr_wr),.addr_rd(addr_rd),.wr_en(wr_en),.rd_en(rd_en),
//     .blk_select(blk_select),.dout(dout),.clk(clk),.rst(rst))

// initial begin
//     clk =0;
//     forever begin
//         #1 clk = ~clk;
//     end
// end

// initial begin
//     $readmemh("mem.dat",m1.mem);
//     rd_en = 0;
//     addr_rd = 0;

//     repeat(10000) begin
//         blk_select = $random;
//         din = $random;
//         addr_wr = $random;
//         wr_en = $random;
//         @(negedge clk)
//     end
// end
    
    
// endmodule


module Vending_mc_controller (D_in,Q_in,Dispense,Change,clk,rst);
    parameter Wait = 2'b00 ;
    parameter Q_25 = 2'b01 ;
    parameter Q_50 = 2'b11 ;

    input D_in,Q_in,clk,rst;
    output reg Dispense,Change;
    (* fsm_encoding = "gray" *)     // for the synsthis tool
    reg [1:0] cs,ns;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cs <= Wait;
        end else begin
            cs <= ns;
            
        end
    end

    always @(cs , D_in, Q_in) begin

        case (cs)

            Wait: if(D_in == 1) begin
                Change = 1;
                Dispense = 1;
                ns = Wait;
                end
                else if (Q_in == 1) begin
                   Change = 0;
                   Dispense = 0;
                   ns = Q_25; 
                end 
                else begin
                    Change = 0;
                    Dispense = 0;
                    ns = Wait;
                end

            Q_25: if(Q_in == 1) begin
                 Change = 0;
                   Dispense = 0;
                   ns = Q_50; 
            end else ns = Q_25;

            Q_50: if(Q_in == 1) begin
                Change = 0;
                Dispense = 1;
                ns = Wait; 
            end else ns = Q_50;
           
        endcase
    end


    
endmodule


module VM_tb ();
reg D_in,Q_in,clk,rst_n;
wire  dispense,change;
//=======================
Vending_mc_controller dut (.clk(clk),.D_in,.Q_in(Q_in),.rst(rst_n),.Dispense(dispense),.Change(change));
//=======================
initial begin
  clk=0;
  forever begin
    #1 clk=~clk;
  end
end
initial begin
  rst_n=1;
  Q_in=0;
  D_in=0;
  @(negedge clk);
  rst_n=0;
  Q_in=0;
  D_in=1;
  @(negedge clk);
  Q_in=0;
  D_in=0;
  @(negedge clk);
    Q_in=1;
  @(negedge clk);
  @(negedge clk);
  @(negedge clk);
  $stop;

end
endmodule