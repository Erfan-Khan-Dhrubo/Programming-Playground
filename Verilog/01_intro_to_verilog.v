module intro_to_verilog(  // Start of module declaration
    A, B, Cin,                     // Input ports: two 4-bit numbers and a carry-in
    Sum, Cout,                    // Output ports: 4-bit sum and 1-bit carry-out
    AndOut, OrOut, LogicOut,      // Output ports for bitwise and logical operations
    CompareOut, ShiftLeft, ShiftRight, ConditionalOut // Output ports for comparison, shift, conditional
);

// ------------------------------------------------------
// PORT DECLARATIONS
// ------------------------------------------------------

input [3:0] A, B;        // Declare A and B as 4-bit input vectors (MSB to LSB: A[3:0])
input Cin;               // Scalar input for initial carry-in

output [3:0] Sum;        // 4-bit output vector to store the sum
output Cout;             // Scalar output for final carry-out

output AndOut;           // Output for bitwise AND between A[0] and B[0]
output OrOut;            // Output for bitwise OR between A[1] and B[1]
output LogicOut;         // Output for logical AND between A[2] and B[2]
output CompareOut;       // Output that is high if A equals B (relational operator)

output [3:0] ShiftLeft;  // Output vector showing A shifted left by 1 bit
output [3:0] ShiftRight; // Output vector showing A shifted right by 1 bit

output [3:0] ConditionalOut; // Output vector: A if A > B, otherwise B

// ------------------------------------------------------
// INTERNAL NETS (WIRES) FOR RIPPLE CARRY LOGIC
// ------------------------------------------------------

wire C1, C2, C3;  // Intermediate carry wires between full-adder stages

// ------------------------------------------------------
// CONTINUOUS ASSIGNMENTS FOR DEMO OPERATORS
// ------------------------------------------------------

// Bitwise AND between first bit of A and B
assign AndOut = A[0] & B[0];  

// Bitwise OR between second bit of A and B
assign OrOut = A[1] | B[1];   

// Logical AND: result is 1 if both A[2] and B[2] are non-zero
assign LogicOut = A[2] && B[2];   

// Relational operator: outputs 1 if A equals B
assign CompareOut = (A == B);     

// Logical shift left: equivalent to multiplying A by 2
assign ShiftLeft = A << 1;        

// Logical shift right: equivalent to dividing A by 2
assign ShiftRight = A >> 1;       

// Conditional operator: if A > B, assign A to ConditionalOut; else assign B
assign ConditionalOut = (A > B) ? A : B; 

// ------------------------------------------------------
// 4-BIT RIPPLE CARRY ADDER IMPLEMENTATION
// Each stage uses 1-bit full adder logic
// ------------------------------------------------------

// 1st bit sum and carry
assign Sum[0] = A[0] ^ B[0] ^ Cin;                        // XOR for sum
assign C1     = (A[0] & B[0]) | (Cin & (A[0] ^ B[0]));    // Carry generation

// 2nd bit sum and carry
assign Sum[1] = A[1] ^ B[1] ^ C1;
assign C2     = (A[1] & B[1]) | (C1 & (A[1] ^ B[1]));

// 3rd bit sum and carry
assign Sum[2] = A[2] ^ B[2] ^ C2;
assign C3     = (A[2] & B[2]) | (C2 & (A[2] ^ B[2]));

// 4th bit sum and final carry out
assign Sum[3] = A[3] ^ B[3] ^ C3;
assign Cout   = (A[3] & B[3]) | (C3 & (A[3] ^ B[3]));

// ------------------------------------------------------
// REGISTERS (EXAMPLE DECLARATIONS)
// ------------------------------------------------------

// A 1-bit register (not used in logic, just declared as an example)
reg dummyReg;              // A register stores a value and is updated using procedural blocks

// A 4-bit vector register (also for syntax demonstration)
reg [3:0] dummyVector;     // Vector version of register (like wire, but holds state in sequential logic)



endmodule  

