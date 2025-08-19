package TbShiftUnit;

import ALUTypes::*;
import ShiftUnit::*;

// Helper function to display signed value
function Int#(32) signed32(Word w);
    return unpack(pack(w));
endfunction


// Testbench module
module mkTb(Empty);
    // Instantiate ShiftUnit
    ShiftUnitIfc shiftUnit <- mkShiftUnit;

    // Rule to run tests
    rule test_shift;
        // Test case 1: Normal SLL (5 << 2 = 20)
        let result1 <- shiftUnit.doOp(SLL, 5, 2);
        $display("SLL 5 << 2 = %0d (expected 20)", result1);

        // Test case 2: Normal SRL (5 >> 1 = 2)
        let result2 <- shiftUnit.doOp(SRL, 5, 1);
        $display("SRL 5 >> 1 = %0d (expected 2)", result2);

        // Test case 3: Normal SRA (signed -8 >> 2 = -2)
        let result3 <- shiftUnit.doOp(SRA, 'hFFFFFFF8, 2); // -8 in hex
        $display("SRA -8 >> 2 = %0d (expected -2)", signed32(result3));

        // Test case 4: Edge case SLL (0x80000000 << 1 = 0)
        let result4 <- shiftUnit.doOp(SLL, 'h80000000, 1);
        $display("SLL 0x80000000 << 1 = %0h (expected 0)", result4);

        // Test case 5: Edge case SRL (0xFFFFFFFF >> 31 = 1)
        let result5 <- shiftUnit.doOp(SRL, 'hFFFFFFFF, 31);
        $display("SRL 0xFFFFFFFF >> 31 = %0d (expected 1)", result5);

        // Test case 6: Edge case SRA (0x80000000 >> 1 = 0xC0000000)
        let result6 <- shiftUnit.doOp(SRA, 'h80000000, 1);
        $display("SRA 0x80000000 >> 1 = %0h (expected 0xC0000000)", result6);

        // Test case 7: Invalid op (e.g., ADD, expect 0)
        let result7 <- shiftUnit.doOp(ADD, 5, 3);
        $display("Invalid op ADD 5, 3 = %0d (expected 0)", result7);

        // Terminate simulation
        $finish(0);
    endrule
endmodule

endpackage
