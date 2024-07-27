
// module Q1_tb ();
//     reg clk, rst;
//     reg [2:0] A, B, opcode;
//     reg cin, serial_in, direction, red_op_A, red_op_B, bypass_A, bypass_B;
//     wire [5:0] out;
//     reg [5:0] out_exp;
//     wire [15:0] leds;

//     ALSU #(.INPUT_PRIORITY("A"), .FULL_ADDER("ON")) ALSU_DUT(
//         .A(A), .B(B), .opcode(opcode),
//         .cin(cin), .serial_in(serial_in), .direction(direction), .red_op_A(red_op_A), .red_op_B(red_op_B),
//         .bypass_B(bypass_B), .bypass_A(bypass_A),
//         .clk(clk), .rst(rst),
//         .out(out), .leds(leds)
//     );

//     initial begin
//         clk = 0;
//         forever begin
//             #1 clk = ~clk;
//         end
//     end

//     initial begin
//         // Reset Test
//         A = 1;
//         B = 1;
//         opcode = 0;
//         rst = 1;
//         @(negedge clk)
//         @(negedge clk)
//         if ((out == 0) && (leds == 0)) $display("Passed for rst test");
//         else $display("Failed for rst test");
//         rst = 0;

//         // Bypass Test
//         bypass_A = 1;
//         bypass_B = 1;
//         A = 3'b111;
//         B = 3'b110;
//         cin = $random;  
//         serial_in = $random;
//         direction = $random;
//         red_op_A = $random ;
//         red_op_B = $random ;
//         opcode = 3'b010;
//         @(negedge clk)
//         @(negedge clk)

//         if (out === 6'b000111) $display("Passed for bypass test");
//         else $display("Failed for bypass test");
//         bypass_A = 0;
//         bypass_B = 0;

//         // Randomized Test for OpCodes
//         repeat(50) begin
//             opcode = $urandom_range(0, 5);
//             A = $urandom_range(0, 7);  
//             B = $urandom_range(0, 7);  
//             cin = $random % 2;
//             serial_in = $random;
//             direction = $random;
//             red_op_A = $random;
//             red_op_B = $random;
            
          
//             case (opcode)
//                 3'b000: if (red_op_A) out_exp =  &A;  // Reduction
//                         else if ((red_op_A == 0) && (red_op_B == 1)) out_exp = &B;
//                         else out_exp = A & B;

//                 3'b001: if (red_op_A) out_exp = ^A;  // Reduction
//                         else if ((red_op_A == 0) && (red_op_B == 1)) out_exp =  ^B;
//                         else out_exp = A ^ B;

//                 3'b010: out_exp =  A + B + cin;

//                 3'b011: out_exp =  A * B;

//                 3'b100: if (direction) out_exp = {out_exp[4:0], serial_in};
//                         else out_exp = {serial_in, out_exp[5:1]};

//                 3'b101: if (direction) out_exp = {out_exp[4:0], out_exp[5]};
//                         else out_exp = {out_exp[0], out_exp[5:1]};
                
//                 default: out_exp = 6'bxxxxxx;  
//             endcase

//             @(negedge clk)
//             @(negedge clk)
//             if (out != out_exp) begin
//                 $display("%t: Failed for opcode %b: expected %b, got %b", $time, opcode, out_exp, out);
//               //  $stop;
//             end 
//         end
//         $display("All tests passed!");
//         $stop;
//     end

// endmodule

module Q2_tb ();
     reg [17:0] A, B, D;
    reg [47:0] C;
    reg clk;
    reg rst_n;
    wire [47:0] P;  
 DSP DUT (A,B,D,C,clk,rst_n,P);

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        rst_n = 0;
        @(negedge clk);

        rst_n = 1;

        A = 2; B = 1;D = 1;C = 1;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);

        A = 2;B = 2; D = 3;C = 1;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        
        $stop;
    end
    

endmodule