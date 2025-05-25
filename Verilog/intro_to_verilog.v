// --------------------------------------------------
// ONE MODULE VERSION
// Implements a 4-bit ripple carry adder
// and demonstrates operators, vectors, assign, etc.
// --------------------------------------------------
module intro_to_verilog(
    A, B, Cin,        // 4-bit inputs and carry-in
    Sum, Cout,        // 4-bit output sum and carry-out
    AndOut, OrOut, LogicOut, CompareOut // Additional outputs to demo operators
);

// --------------------------
// PORT DECLARATIONS
// --------------------------
input [3:0] A, B;       // 4-bit input vectors
input Cin;              // Carry input

output [3:0] Sum;       // 4-bit output sum
output Cout;            // Final carry-out

output AndOut;          // A[0] & B[0]
output OrOut;           // A[1] | B[1]
output LogicOut;        // A[2] && B[2]
output CompareOut;      // (A == B)

// --------------------------
// INTERNAL WIRES FOR CARRY
// --------------------------
wire C1, C2, C3; // Internal carries for ripple carry logic

// --------------------------
// OPERATOR DEMOS
// --------------------------
assign AndOut = A[0] & B[0];         // Bitwise AND
assign OrOut = A[1] | B[1];          // Bitwise OR
assign LogicOut = A[2] && B[2];      // Logical AND
assign CompareOut = (A == B);        // Relational comparison

// --------------------------
// 4-BIT RIPPLE CARRY ADDER
// All done inside this one module
// --------------------------
assign Sum[0] = A[0] ^ B[0] ^ Cin;
assign C1     = (A[0] & B[0]) | (Cin & (A[0] ^ B[0]));

assign Sum[1] = A[1] ^ B[1] ^ C1;
assign C2     = (A[1] & B[1]) | (C1 & (A[1] ^ B[1]));

assign Sum[2] = A[2] ^ B[2] ^ C2;
assign C3     = (A[2] & B[2]) | (C2 & (A[2] ^ B[2]));

assign Sum[3] = A[3] ^ B[3] ^ C3;
assign Cout   = (A[3] & B[3]) | (C3 & (A[3] ^ B[3]));

endmodule
