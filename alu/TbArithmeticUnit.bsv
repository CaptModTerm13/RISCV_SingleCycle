package TbArithmeticUnit;

import ALUTypes::*;
import ArithmeticUnit::*;

// Testbench module
module mkTb(Empty);
    // Instantiate ArithmeticUnit
    ArithmeticUnitIfc arithUnit <- mkArithmeticUnit;

    // Rule to run tests
    rule test_arith;
        // Test case 1: Normal ADD (5 + 3 = 8)
        let result1 <- arithUnit.doOp(ADD, 5, 3);
        $display("ADD 5 + 3 = %0d (expected 8)", result1);

        // Test case 2: Normal SUB (5 - 3 = 2)
        let result2 <- arithUnit.doOp(SUB, 5, 3);
        $display("SUB 5 - 3 = %0d (expected 2)", result2);

        // Test case 3: Max value ADD (0xFFFFFFFF + 1 = 0, overflow)
        let maxWord = 'hFFFFFFFF; // Max UInt#(32)
        let result3 <- arithUnit.doOp(ADD, maxWord, 1);
        $display("ADD 0xFFFFFFFF + 1 = %0h (expected 0)", result3);

        // Test case 4: Zero case SUB (0 - 0 = 0)
        let result4 <- arithUnit.doOp(SUB, 0, 0);
        $display("SUB 0 - 0 = %0d (expected 0)", result4);

        // Test case 5: Invalid op (e.g., AND, expect 0)
        let result5 <- arithUnit.doOp(AND, 5, 3);
        $display("Invalid op AND 5, 3 = %0d (expected 0)", result5);

        // Terminate simulation
        $finish(0);
    endrule
endmodule

endpackage
