package ALUTypes;

// Define 32-bit unsigned word for RV32I operands and results
typedef UInt#(32) Word;

// Enum for ALU operations (covering RV32I ALU instructions)
typedef enum {
    ADD,   // Addition (ADD, ADDI)
    SUB,   // Subtraction (SUB; ADDI with negative immediate)
    AND,   // Bitwise AND (AND, ANDI)
    OR,    // Bitwise OR (OR, ORI)
    XOR,   // Bitwise XOR (XOR, XORI)
    SLL,   // Shift Left Logical (SLL, SLLI)
    SRL,   // Shift Right Logical (SRL, SRLI)
    SRA,   // Shift Right Arithmetic (SRA, SRAI)
    SLT,   // Set Less Than (signed, SLT, SLTI)
    SLTU   // Set Less Than (unsigned, SLTU, SLTIU)
} ALUOp deriving (Bits, Eq);

endpackage
