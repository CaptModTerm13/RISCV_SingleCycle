package ArithmeticUnit;

import ALUTypes::*;

// Interface for ArithmeticUnit
interface ArithmeticUnitIfc;
    method ActionValue#(Word) doOp(ALUOp op, Word a, Word b);
endinterface

// Module implementing ADD and SUB
module mkArithmeticUnit(ArithmeticUnitIfc);
    method ActionValue#(Word) doOp(ALUOp op, Word a, Word b);
        Word result = 0;
        case (op)
            ADD: result = a + b;
            SUB: result = a - b;
            default: result = 0; // Invalid ops return 0
        endcase
        return result;
    endmethod
endmodule

endpackage
