package TbALU;

import ALUTypes::*;
import ALU::*;

// Helper function to display signed value
function Int#(32) signed32(Word w) = unpack(pack(w));

// Testbench module
module mkTb(Empty);
    // Instantiate ALU
    ALUIfc alu <- mkALU;

    // Rule to run tests
    rule test_alu;
        // ArithmeticUnit tests
        let result1 <- alu.execute(ADD, 5, 3);
        $display("ADD 5 + 3 = %0d (expected 8)", result1);
        let result2 <- alu.execute(SUB, 5, 3);
        $display("SUB 5 - 3 = %0d (expected 2)", result2);
        let result3 <- alu.execute(ADD, 'hFFFFFFFF, 1);
        $display("ADD 0xFFFFFFFF + 1 = %0h (expected 0)", result3);

        // LogicalUnit tests
        let result4 <- alu.execute(AND, 5, 3);
        $display("AND 5 & 3 = %0d (expected 1)", result4);
        let result5 <- alu.execute(OR, 5, 3);
        $display("OR 5 | 3 = %0d (expected 7)", result5);
        let result6 <- alu.execute(XOR, 5, 3);
        $display("XOR 5 ^ 3 = %0d (expected 6)", result6);

        // ShiftUnit tests
        let result7 <- alu.execute(SLL, 5, 2);
        $display("SLL 5 << 2 = %0d (expected 20)", result7);
        let result8 <- alu.execute(SRL, 5, 1);
        $display("SRL 5 >> 1 = %0d (expected 2)", result8);
        let result9 <- alu.execute(SRA, 'hFFFFFFF8, 2); // -8
        $display("SRA -8 >> 2 = %0d (expected -2)", signed32(result9));

        // CompareUnit tests
        let result10 <- alu.execute(SLT, 5, 3);
        $display("SLT 5 < 3 = %0d (expected 0)", result10);
        let result11 <- alu.execute(SLT, 'hFFFFFFFF, 1); // -1
        $display("SLT -1 < 1 = %0d (expected 1)", result11);
        let result12 <- alu.execute(SLTU, 3, 5);
        $display("SLTU 3 < 5 = %0d (expected 1)", result12);

        // Invalid op test
        let result13 <- alu.execute(unpack(4'hA), 5, 3); // Invalid ALUOp (value 10)
        $display("Invalid op = %0d (expected 0)", result13);

        // Terminate simulation
        $finish(0);
    endrule
endmodule

endpackage
