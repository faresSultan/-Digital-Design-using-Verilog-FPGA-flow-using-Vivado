// // module Q1_tb ();
// //     reg clk,rst;
// //     reg [2:0] A,B,opcode;
// //     reg cin,serial_in,direction,red_op_A,red_op_B,bypass_A,bypass_B;
// //     wire [5:0] out;
// //     reg [5:0] out_exp;
// //     wire [15:0] leds;

// //    ALSU#(.INPUT_PRIORITY("A"),.FULL_ADDER("ON")) ALSU_DUT(
// //     A,B,opcode,
// //     cin,serial_in,direction,red_op_A,red_op_B,
// //     bypass_B,bypass_A,
// //     clk,rst,
// //     out,leds);

// //     initial begin
// //         clk = 0;
// //         forever begin
// //             #1 clk = ~clk;
// //         end
// //     end

// //     initial begin
// //         // rst test
// //         A = 1;
// //         B = 1;
// //         opcode = 0;
// //         rst = 1;
// //         @(negedge clk)
// //         if ((out == 0)&&(leds == 0)) $display("Passed for rst test");
// //         else $display("Failed for rst test");
// //         rst = 0;

// //         // bypass testing
// //         bypass_A = 1;
// //         bypass_B = 1;
// //         A = 'b111;
// //         B = 'b110;
// //         cin = $random;
// //         serial_in = $random;
// //         direction = $random;
// //         red_op_A = $random;
// //         red_op_B = $random;
// //         opcode = 'b010;
// //         @(negedge clk)

// //         if (out == 'b111) $display("Passed for bypass test");
// //         else $display("Failed for bypass test");
// //         bypass_A = 0;
// //         bypass_B = 0;

// //         repeat(50) begin

// //             opcode = $urandom_range(0,5);
// //             A = $random;    
// //             B = $random;
// //             cin = $random;
// //             serial_in = $random;
// //             direction = $random;
// //             red_op_A = $random;
// //             red_op_B = $random;
          

// //             case (opcode)
// //                 'b000: if (red_op_A) out_exp = &A;
// //                        else if ((red_op_A==0)&&(red_op_B==1)) out_exp = &B;
// //                        else out_exp = A&B;

// //                 'b001: if (red_op_A) out_exp = ^A;
// //                        else if ((red_op_A==0)&&(red_op_B==1)) out_exp = ^B;
// //                        else out_exp = A^B;

// //                 'b010: out_exp = A+B+cin;

// //                 'b011: out_exp = A*B;

// //                 'b100: if (direction) out_exp = {out[4:0],serial_in};
// //                        else out_exp = {serial_in,out[5:1]};

// //                 'b101: if (direction) out_exp = {out[4:0],out[5]};
// //                        else out_exp = {out[0],out[5:1]};
                
// //             endcase
// //             @(negedge clk)
// //             if (out != out_exp)begin
// //                 $display ("Failed");
// //                 $stop;
// //             end 
// //         end
// //         $stop;

// //     end

// // endmodule




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
//         if ((out == 0) && (leds == 0)) $display("Passed for rst test");
//         else $display("Failed for rst test");
//         rst = 0;

//         // Bypass Test
//         bypass_A = 1;
//         bypass_B = 1;
//         A = 3'b111;
//         B = 3'b110;
//         cin = $random % 2;  // Ensure cin is 0 or 1
//         serial_in = $random % 2;
//         direction = $random % 2;
//         red_op_A = $random % 2;
//         red_op_B = $random % 2;
//         opcode = 3'b010;
//         @(negedge clk)
//         if (out == 6'b000111) $display("Passed for bypass test");
//         else $display("Failed for bypass test");
//         bypass_A = 0;
//         bypass_B = 0;

//         // Randomized Test for OpCodes
//         repeat(50) begin
//             opcode = $urandom_range(0, 5);
//             A = $urandom_range(0, 7);  // Ensure A fits in 3 bits
//             B = $urandom_range(0, 7);  // Ensure B fits in 3 bits
//             cin = $random % 2;
//             serial_in = $random % 2;
//             direction = $random % 2;
//             red_op_A = $random % 2;
//             red_op_B = $random % 2;
            
//             // Expected Output Calculation
//             case (opcode)
//                 3'b000: if (red_op_A) out_exp = {3'b0, &A};  // Reduction
//                         else if ((red_op_A == 0) && (red_op_B == 1)) out_exp = {3'b0, &B};
//                         else out_exp = {3'b0, A & B};

//                 3'b001: if (red_op_A) out_exp = {3'b0, ^A};  // Reduction
//                         else if ((red_op_A == 0) && (red_op_B == 1)) out_exp = {3'b0, ^B};
//                         else out_exp = {3'b0, A ^ B};

//                 3'b010: out_exp = {3'b0, A + B + cin};

//                 3'b011: out_exp = {3'b0, A * B};

//                 3'b100: if (direction) out_exp = {out[4:0], serial_in};
//                         else out_exp = {serial_in, out[5:1]};

//                 3'b101: if (direction) out_exp = {out[4:0], out[5]};
//                         else out_exp = {out[0], out[5:1]};
                
//                 default: out_exp = 6'bxxxxxx;  // Add cases for invalid opcodes
//             endcase

//             @(negedge clk)
//             if (out != out_exp) begin
//                 $display("Failed for opcode %b: expected %b, got %b", opcode, out_exp, out);
//                 $stop;
//             end 
//         end
//         $display("All tests passed!");
//         $stop;
//     end

// endmodule


module Q1_tb ();
    reg clk, rst;
    reg [2:0] A, B, opcode;
    reg cin, serial_in, direction, red_op_A, red_op_B, bypass_A, bypass_B;
    wire [5:0] out;
    reg [5:0] out_exp;
    wire [15:0] leds;

    ALSU #(.INPUT_PRIORITY("A"), .FULL_ADDER("ON")) ALSU_DUT(
        .A(A), .B(B), .opcode(opcode),
        .cin(cin), .serial_in(serial_in), .direction(direction), .red_op_A(red_op_A), .red_op_B(red_op_B),
        .bypass_B(bypass_B), .bypass_A(bypass_A),
        .clk(clk), .rst(rst),
        .out(out), .leds(leds)
    );

    initial begin
        clk = 0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        // Reset Test
        A = 1;
        B = 1;
        opcode = 0;
        rst = 1;
        @(negedge clk)
        if ((out == 0) && (leds == 0)) $display("Passed for rst test");
        else $display("Failed for rst test");
        rst = 0;

        // Specific test for SHIFT operation
        // Left Shift
        opcode = 3'b100;
        direction = 1;
        out_exp = 6'b000111; // Assume initial value before shift
        serial_in = 0; // Example serial in value
        out_exp = {out_exp[4:0], serial_in};  // Expected output after shift
        @(negedge clk)
        if (out == out_exp) $display("Passed for LEFT shift test");
        else $display("Failed for LEFT shift test: expected %b, got %b", out_exp, out);

        // Right Shift
        opcode = 3'b100;
        direction = 0;
        out_exp = 6'b000111; // Assume initial value before shift
        serial_in = 1; // Example serial in value
        out_exp = {serial_in, out_exp[5:1]};  // Expected output after shift
        @(negedge clk)
        if (out == out_exp) $display("Passed for RIGHT shift test");
        else $display("Failed for RIGHT shift test: expected %b, got %b", out_exp, out);

        // Bypass Test
        bypass_A = 1;
        bypass_B = 1;
        A = 3'b111;
        B = 3'b110;
        cin = $random % 2;  // Ensure cin is 0 or 1
        serial_in = $random % 2;
        direction = $random % 2;
        red_op_A = $random % 2;
        red_op_B = $random % 2;
        opcode = 3'b010;
        @(negedge clk)
        if (out == 6'b000111) $display("Passed for bypass test");
        else $display("Failed for bypass test");
        bypass_A = 0;
        bypass_B = 0;

        // Randomized Test for OpCodes
        repeat(50) begin
            opcode = $urandom_range(0, 5);
            A = $urandom_range(0, 7);  // Ensure A fits in 3 bits
            B = $urandom_range(0, 7);  // Ensure B fits in 3 bits
            cin = $random % 2;
            serial_in = $random % 2;
            direction = $random % 2;
            red_op_A = $random % 2;
            red_op_B = $random % 2;
            
            // Expected Output Calculation
            case (opcode)
                3'b000: if (red_op_A) out_exp = {3'b0, &A};  // Reduction
                        else if ((red_op_A == 0) && (red_op_B == 1)) out_exp = {3'b0, &B};
                        else out_exp = {3'b0, A & B};

                3'b001: if (red_op_A) out_exp = {3'b0, ^A};  // Reduction
                        else if ((red_op_A == 0) && (red_op_B == 1)) out_exp = {3'b0, ^B};
                        else out_exp = {3'b0, A ^ B};

                3'b010: out_exp = {3'b0, A + B + cin};

                3'b011: out_exp = {3'b0, A * B};

                3'b100: if (direction) out_exp = {out[4:0], serial_in};  // Left shift
                        else out_exp = {serial_in, out[5:1]};  // Right shift

                3'b101: if (direction) out_exp = {out[4:0], out[5]};  // Left rotate
                        else out_exp = {out[0], out[5:1]};  // Right rotate
                
                default: out_exp = 6'bxxxxxx;  // Add cases for invalid opcodes
            endcase

            @(negedge clk)
            if (out != out_exp) begin
                $display("Failed for opcode %b: expected %b, got %b", opcode, out_exp, out);
                $stop;
            end 
        end
        $display("All tests passed!");
        $stop;
    end

endmodule
