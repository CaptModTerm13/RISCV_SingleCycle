package TbTypes;

// Import ALU types
import ALUTypes::*;

// Testbench module
module mkTb(Empty);
    // Rule to test types
    rule test_types;
        // Test Word type
        Word a = 5;
        Word b = 3;
        Word sum = a + b;
        $display("Word test: %0d + %0d = %0d", a, b, sum);

        // Test ALUOp enum
        ALUOp op1 = ADD;
        ALUOp op2 = SUB;
        $display("ALUOp test: op1 = %0s, op2 = %0s", op1, op2);
        $display("ADD binary: %0b", pack(ADD)); // Show binary representation
        $display("SUB binary: %0b", pack(SUB));

        // Terminate simulation
        $finish(0);
    endrule
endmodule

endpackage
