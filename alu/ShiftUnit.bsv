package ShiftUnit;

import ALUTypes::*;

// Interface for ShiftUnit
interface ShiftUnitIfc;
    method ActionValue#(Word) doOp(ALUOp op, Word a, Word b);
endinterface

// Module implementing SLL, SRL, SRA
module mkShiftUnit(ShiftUnitIfc);
method ActionValue#(Word) doOp(ALUOp op, Word a, Word b);
    Word result = 0;
    Bit#(5) shamt = truncate(pack(b)); // mask shift amt
    case (op)
        SLL: result = a << shamt;
        SRL: result = a >> shamt;
        SRA: begin
            Int#(32) signed_a = unpack(pack(a));
            result = unpack(pack(signed_a >> shamt));
        end
        default: result = 0;
    endcase
    return result;
endmethod

endmodule

endpackage

