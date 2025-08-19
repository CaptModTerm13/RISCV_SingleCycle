package ALU;

import ALUTypes::*;
import ArithmeticUnit::*;
import LogicalUnit::*;
import ShiftUnit::*;
import CompareUnit::*;

// Interface for ALU
interface ALUIfc;
    method ActionValue#(Word) execute(ALUOp op, Word a, Word b);
endinterface

// Module integrating all ALU operations
module mkALU(ALUIfc);
    // Instantiate subunits
    ArithmeticUnitIfc arithUnit <- mkArithmeticUnit;
    LogicalUnitIfc logicalUnit <- mkLogicalUnit;
    ShiftUnitIfc shiftUnit <- mkShiftUnit;
    CompareUnitIfc compareUnit <- mkCompareUnit;

    method ActionValue#(Word) execute(ALUOp op, Word a, Word b);
        Word result = 0;
        case (op)
            ADD, SUB: result <- arithUnit.doOp(op, a, b);
            AND, OR, XOR: result <- logicalUnit.doOp(op, a, b);
            SLL, SRL, SRA: result <- shiftUnit.doOp(op, a, b);
            SLT, SLTU: result <- compareUnit.doOp(op, a, b);
            default: begin
                $display("Error: Invalid ALUOp %0s", op);
                result = 0;
            end
        endcase
        return result;
    endmethod
endmodule

endpackage
