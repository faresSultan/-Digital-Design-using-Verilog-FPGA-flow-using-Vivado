module Q2_tb;
  reg [1:0] sel;
  reg i;
  wire [3:0] Y ;
  
  Demux_1_4 demux_DUT (.S(sel), .D(i), .Y(Y));
  initial begin
    sel=2'b00; i=0;#10;
     if (Y == 'b0000) begin
            $display("Case %d passed for S = %d",i,sel);
        end else begin
           $display("Case %d failed for S = %d",i,sel); 
        end
    sel=2'b00; i=1; #10;
     if (Y == 'b0001) begin
            $display("Case %d passed for S = %d",i,sel);
        end else begin
           $display("Case %d failed for S = %d",i,sel); 
        end

    sel=2'b01;i=0;#10;
    if (Y == 'b0000) begin
            $display("Case %d passed for S = %d",i,sel);
        end else begin
           $display("Case %d failed for S = %d",i,sel);
        end

    sel=2'b01;i=1;#10;
    if (Y == 'b0010) begin
            $display("Case %d passed for S = %d",i,sel);
        end else begin
           $display("Case %d failed for S = %d",i,sel); 
        end

    sel=2'b10;i=0; #10;
    if (Y == 'b0000) begin
            $display("Case %d passed for S = %d",i,sel);
        end else begin
           $display("Case %d failed for S = %d",i,sel); 
        end

    sel=2'b10; i=1; #10;
    if (Y == 'b0100) begin
            $display("Case %d passed for S = %d",i,sel);
        end else begin
           $display("Case %d failed for S = %d",i,sel);
        end

    sel=2'b11; i=0; #10;
    if (Y == 'b0000) begin
            $display("Case %d passed for S = %d",i,sel);
        end else begin
           $display("Case %d failed for S = %d",i,sel);
        end

    sel=2'b11; i=1; #10;
    if (Y == 'b1000) begin
            $display("Case %d passed for S = %d",i,sel);
        end else begin
           $display("Case %d failed for S = %d",i,sel);
        end
  end

endmodule