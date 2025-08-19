package CompareUnit;

import ALUTypes::*;

// Interface for CompareUnit
interface CompareUnitIfc;
    method ActionValue#(Word) doOp(ALUOp op, Word a, Word b);
endinterface

// Module implementing SLT, SLTU
module mkCompareUnit(CompareUnitIfc);
    method ActionValue#(Word) doOp(ALUOp op, Word a, Word b);
        Word result = 0;
        case (op)
            SLT: begin
                // Signed comparison
                Int#(32) signed_a = unpack(pack(a)); // Convert Word to Bit#(32) to Int#(32)
                Int#(32) signed_b = unpack(pack(b)); // Convert Word to Bit#(32) to Int#(32)
                result = (signed_a < signed_b) ? 1 : 0;
            end
            SLTU: begin
                // Unsigned comparison
                result = (a < b) ? 1 : 0;
            end
            default: result = 0; // Invalid ops return 0
        endcase
        return result;
    endmethod
endmodule

endpackage
