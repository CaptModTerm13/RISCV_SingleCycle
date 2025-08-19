package LogicalUnit;

import ALUTypes::*;

// Interface for LogicalUnit
interface LogicalUnitIfc;
    method ActionValue#(Word) doOp(ALUOp op, Word a, Word b);
endinterface

// Module implementing AND, OR, XOR
module mkLogicalUnit(LogicalUnitIfc);
    method ActionValue#(Word) doOp(ALUOp op, Word a, Word b);
        Word result = 0;
        case (op)
            AND: result = a & b;
            OR:  result = a | b;
            XOR: result = a ^ b;
            default: result = 0; // Invalid ops return 0
        endcase
        return result;
    endmethod
endmodule

endpackage
