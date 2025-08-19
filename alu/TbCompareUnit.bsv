package TbCompareUnit;

import ALUTypes::*;
import CompareUnit::*;

// Helper function to display signed value
function Int#(32) signed32(Word w) = unpack(pack(w)); // Fixed: Convert Word to Bit#(32) to Int#(32)

// Testbench module
module mkTb(Empty);
    // Instantiate CompareUnit
    CompareUnitIfc compareUnit <- mkCompareUnit;

    // Rule to run tests
    rule test_compare;
        // Test case 1: Normal SLT (5 < 3 = 0)
        let result1 <- compareUnit.doOp(SLT, 5, 3);
        $display("SLT 5 < 3 = %0d (expected 0)", result1);

        // Test case 2: Normal SLT (-1 < 1 = 1)
        let result2 <- compareUnit.doOp(SLT, 'hFFFFFFFF, 1); // -1 in hex
        $display("SLT -1 < 1 = %0d (expected 1)", result2);

        // Test case 3: Normal SLTU (5 < 3 = 0)
        let result3 <- compareUnit.doOp(SLTU, 5, 3);
        $display("SLTU 5 < 3 = %0d (expected 0)", result3);

        // Test case 4: Normal SLTU (3 < 5 = 1)
        let result4 <- compareUnit.doOp(SLTU, 3, 5);
        $display("SLTU 3 < 5 = %0d (expected 1)", result4);

        // Test case 5: Edge case SLT (0x80000000 < 0x7FFFFFFF = 1)
        let result5 <- compareUnit.doOp(SLT, 'h80000000, 'h7FFFFFFF);
        $display("SLT 0x80000000 < 0x7FFFFFFF = %0d (expected 1)", result5);

        // Test case 6: Edge case SLTU (0xFFFFFFFF < 1 = 0)
        let result6 <- compareUnit.doOp(SLTU, 'hFFFFFFFF, 1);
        $display("SLTU 0xFFFFFFFF < 1 = %0d (expected 0)", result6);

        // Test case 7: Invalid op (e.g., ADD, expect 0)
        let result7 <- compareUnit.doOp(ADD, 5, 3);
        $display("Invalid op ADD 5, 3 = %0d (expected 0)", result7);

        // Terminate simulation
        $finish(0);
    endrule
endmodule

endpackage
