
module Q1e_tb ();
    
    parameter USE_GRAY_tb = 0 ;
    reg [2:0]A_tb;
    wire [6:0]B_tb;

    Gray_Hot_encoder #(.USE_GRAY(USE_GRAY_tb)) encoder_tb (.A(A_tb),.B(B_tb));

    initial begin
        // A_tb = 'b000;
        // #10;
        // if (B_tb == 'b0000000) begin
        //     $display("Case %d passed for Gray Encoding",A_tb);
        // end else begin
        //    $display("Case %d failed for Gray Encoding",A_tb); 
        // end

        // A_tb = 'b001;
        // #10;
        // if (B_tb == 'b0000001) begin
        //     $display("Case %d passed for Gray Encoding",A_tb);
        // end else begin
        //    $display("Case %d failed for Gray Encoding",A_tb); 
        // end

        // A_tb = 'b010;
        // #10;
        // if (B_tb == 'b0000011) begin
        //     $display("Case %d passed for Gray Encoding",A_tb);
        // end else begin
        //    $display("Case %d failed for Gray Encoding",A_tb); 
        // end
        

        // A_tb = 'b011;
        // #10;
        // if (B_tb == 'b0000010) begin
        //     $display("Case %d passed for Gray Encoding",A_tb);
        // end else begin
        //    $display("Case %d failed for Gray Encoding",A_tb); 
        // end

        // A_tb = 'b100;
        // #10;
        // if (B_tb == 'b0000110) begin
        //     $display("Case %d passed for Gray Encoding",A_tb);
        // end else begin
        //    $display("Case %d failed for Gray Encoding",A_tb); 
        // end

        // A_tb = 'b101;
        // #10;
        // if (B_tb == 'b0000111) begin
        //     $display("Case %d passed for Gray Encoding",A_tb);
        // end else begin
        //    $display("Case %d failed for Gray Encoding",A_tb); 
        // end
        
        // A_tb = 'b110;
        // #10;
        // if (B_tb == 'b0000101) begin
        //     $display("Case %d passed for Gray Encoding",A_tb);
        // end else begin
        //    $display("Case %d failed for Gray Encoding",A_tb); 
        // end
        
        // A_tb = 'b111;
        // #10;
        // if (B_tb == 'b0000100) begin
        //     $display("Case %d passed for Gray Encoding",A_tb);
        // end else begin
        //    $display("Case %d failed for Gray Encoding",A_tb); 
        // end
/*----------------------HOT ENCODING TB----------------------*/
        A_tb = 'b000;
        #10;
        if (B_tb == 'b0000000) begin
            $display("Case %d passed for Hot Encoding",A_tb);
        end else begin
           $display("Case %d failed for Hot Encoding",A_tb); 
        end

        A_tb = 'b001;
        #10;
        if (B_tb == 'b0000001) begin
            $display("Case %d passed for Hot Encoding",A_tb);
        end else begin
           $display("Case %d failed for Hot Encoding",A_tb); 
        end

        A_tb = 'b010;
        #10;
        if (B_tb == 'b0000010) begin
            $display("Case %d passed for Hot Encoding",A_tb);
        end else begin
           $display("Case %d failed for Hot Encoding",A_tb); 
        end
        

        A_tb = 'b011;
        #10;
        if (B_tb == 'b0000100) begin
            $display("Case %d passed for Hot Encoding",A_tb);
        end else begin
           $display("Case %d failed for Hot Encoding",A_tb); 
        end

        A_tb = 'b100;
        #10;
        if (B_tb == 'b0001000) begin
            $display("Case %d passed for Hot Encoding",A_tb);
        end else begin
           $display("Case %d failed for Hot Encoding",A_tb); 
        end

        A_tb = 'b101;
        #10;
        if (B_tb == 'b0010000) begin
            $display("Case %d passed for Hot Encoding",A_tb);
        end else begin
           $display("Case %d failed for Hot Encoding",A_tb); 
        end
        
        A_tb = 'b110;
        #10;
        if (B_tb == 'b0100000) begin
            $display("Case %d passed for Hot Encoding",A_tb);
        end else begin
           $display("Case %d failed for Hot Encoding",A_tb); 
        end
        
        A_tb = 'b111;
        #10;
        if (B_tb == 'b1000000) begin
            $display("Case %d passed for Hot Encoding",A_tb);
        end else begin
           $display("Case %d failed for Hot Encoding",A_tb); 
        end

        
    end


endmodule