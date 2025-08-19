package TbLogicalUnit;

import ALUTypes::*;
import LogicalUnit::*;

// Testbench module
module mkTb(Empty);
    // Instantiate LogicalUnit
    LogicalUnitIfc logicalUnit <- mkLogicalUnit;

    // Rule to run tests
    rule test_logical;
        // Test case 1: Normal AND (5 & 3 = 1)
        let result1 <- logicalUnit.doOp(AND, 5, 3);
        $display("AND 5 & 3 = %0d (expected 1)", result1);

        // Test case 2: Normal OR (5 | 3 = 7)
        let result2 <- logicalUnit.doOp(OR, 5, 3);
        $display("OR 5 | 3 = %0d (expected 7)", result2);

        // Test case 3: Normal XOR (5 ^ 3 = 6)
        let result3 <- logicalUnit.doOp(XOR, 5, 3);
        $display("XOR 5 ^ 3 = %0d (expected 6)", result3);

        // Test case 4: Edge case AND (0xFFFFFFFF & 0xFFFFFFFF = 0xFFFFFFFF)
        let maxWord = 'hFFFFFFFF;
        let result4 <- logicalUnit.doOp(AND, maxWord, maxWord);
        $display("AND 0xFFFFFFFF & 0xFFFFFFFF = %0h (expected 0xFFFFFFFF)", result4);

        // Test case 5: Edge case OR (0 | 0 = 0)
        let result5 <- logicalUnit.doOp(OR, 0, 0);
        $display("OR 0 | 0 = %0d (expected 0)", result5);

        // Test case 6: Edge case XOR (0xFFFF0000 ^ 0x0000FFFF = 0xFFFFFFFF)
        let result6 <- logicalUnit.doOp(XOR, 'hFFFF0000, 'h0000FFFF);
        $display("XOR 0xFFFF0000 ^ 0x0000FFFF = %0h (expected 0xFFFFFFFF)", result6);

        // Test case 7: Invalid op (e.g., ADD, expect 0)
        let result7 <- logicalUnit.doOp(ADD, 5, 3);
        $display("Invalid op ADD 5, 3 = %0d (expected 0)", result7);

        // Terminate simulation
        $finish(0);
    endrule
endmodule

endpackage
