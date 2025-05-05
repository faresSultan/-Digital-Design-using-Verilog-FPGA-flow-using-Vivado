module Parameterized_Shift_register #(
   parameter LOAD_AVALUE = 1,
   parameter LOAD_SVALUE = 1,
   parameter SHIFT_DIRECTION = "LEFT",
   parameter SHIFT_WIDTH = 8
) 
(sclr,sset,shiftin,load,data,clk,en,aclr,aset,shiftout,q);
input sclr,sset,shiftin,load,clk,en,aclr,aset;
input [SHIFT_WIDTH-1:0] data;
output reg shiftout;
output reg [SHIFT_WIDTH-1:0] q;

always @(posedge clk or posedge aclr or posedge aset) begin

    if (aclr == 1) begin
        q <= 0;        
    end 

    else if (aset == 1) begin
        q <= LOAD_AVALUE;
    end

    else if ((en == 1) && clk) begin
        if (sclr == 1) begin
            q <= 0;
        end else if (sset == 1) begin
            q <= LOAD_SVALUE;
        end
    end else if (load == 1) begin
        q <= data;
    end 

    else begin
        if ((en == 1) && SHIFT_DIRECTION == "LEFT") begin
            q <= {data[6:0],shiftin};
            shiftout <= data[7];
        end else if ((en == 1) && SHIFT_DIRECTION == "RIGHT") begin
            q <= {shiftin,data[7:1]};
            shiftout <= data[0];
        end
    end
end  
endmodule


