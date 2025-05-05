module Q6_tb();

reg [3:0] A, B;
reg [1:0] opcode;
reg en;
wire a, b, c, d, e, f, g;
wire [6:0] segment_out;

ALU_with_7segment_decoder uut (.A(A),.B(B), .opcode(opcode),.en(en),.a(a),.b(b),.c(c),.d(d),.e(e), .f(f), .g(g));


assign segment_out = {a, b, c, d, e, f, g};

initial begin
    
    en = 1;
    opcode = 2'b00;
    // Test vector 0
    A = 4'h0; B = 4'h0;
    #10;
    if (segment_out !== 7'b1111110) $display("Test failed for alu_out = 0");
    
    // Test vector 1
    A = 4'h1; B = 4'h0;
    #10;
    if (segment_out !== 7'b0110000) $display("Test failed for alu_out = 1");
    
    // Test vector 2
    A = 4'h2; B = 4'h0;
    #10;
    if (segment_out !== 7'b1101101) $display("Test failed for alu_out = 2");
    
    // Test vector 3
    A = 4'h3; B = 4'h0;
    #10;
    if (segment_out !== 7'b1111001) $display("Test failed for alu_out = 3");
    
    // Test vector 4
    A = 4'h4; B = 4'h0;
    #10;
    if (segment_out !== 7'b0110011) $display("Test failed for alu_out = 4");
    
    // Test vector 5
    A = 4'h5; B = 4'h0;
    #10;
    if (segment_out !== 7'b1011011) $display("Test failed for alu_out = 5");
    
    // Test vector 6
    A = 4'h6; B = 4'h0;
    #10;
    if (segment_out !== 7'b1011111) $display("Test failed for alu_out = 6");
    
    // Test vector 7
    A = 4'h7; B = 4'h0;
    #10;
    if (segment_out !== 7'b1110000) $display("Test failed for alu_out = 7");
    
    // Test vector 8
    A = 4'h8; B = 4'h0;
    #10;
    if (segment_out !== 7'b1111111) $display("Test failed for alu_out = 8");
    
    // Test vector 9
    A = 4'h9; B = 4'h0;
    #10;
    if (segment_out !== 7'b1111011) $display("Test failed for alu_out = 9");
    
    // Test vector A
    A = 4'hA; B = 4'h0;
    #10;
    if (segment_out !== 7'b1110111) $display("Test failed for alu_out = A");
    
    // Test vector B
    A = 4'hB; B = 4'h0;
    #10;
    if (segment_out !== 7'b0011111) $display("Test failed for alu_out = B");
    
    // Test vector C
    A = 4'hC; B = 4'h0;
    #10;
    if (segment_out !== 7'b1001110) $display("Test failed for alu_out = C");
    
    // Test vector D
    A = 4'hD; B = 4'h0;
    #10;
    if (segment_out !== 7'b0111101) $display("Test failed for alu_out = D");
    
    // Test vector E
    A = 4'hE; B = 4'h0;
    #10;
    if (segment_out !== 7'b1001111) $display("Test failed for alu_out = E");
    
    // Test vector F
    A = 4'hF; B = 4'h0;
    #10;
    if (segment_out !== 7'b1000111) $display("Test failed for alu_out = F");
    
    // Test with en = 0
    en = 0;
    #10;
    if (segment_out !== 7'b0000000) $display("Test failed for en = 0");

    $display("All tests completed");
    $stop;
end

endmodule
