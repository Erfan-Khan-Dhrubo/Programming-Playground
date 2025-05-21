# 8086 Assembly Language

This repository contains all the concepts, code files, and explanations I’ve learned throughout the **Spring 2025 8086 Assembly course**.
Each topic in the repository includes:
- ✅ A `.asm` file – Complete working code examples (EMU8086-compatible)
- 📄 A `.md` file – Clear written explanation of the topic, with examples and comments
- 📁 A dedicated folder named **Assembly Concepts** – Contains **PDF versions** of all `.md` explanation files for easy offline access or printing

---

## 📘 Topics Covered

### ✅ 1. Introduction to Assembly & EMU8086 (intro_to_assembly)
- Program structure (`.MODEL`, `.DATA`, `.CODE`)
- Using `INT 21h` for basic I/O
- Displaying strings and characters
- Exiting to DOS using `MOV AX, 4C00h`

### ✅ 2. Basic I/O, Arithmetic & Flags (input_output_and_char_processing)
- Input using `INT 21h`, AH = 01h
- ASCII to numeric conversion
- 8-bit and 16-bit addition, subtraction, multiplication, division
- Working with flags (`ZF`, `CF`, `SF`, `OF`)

### ✅ 3. Flow Control & Branching (if_else_case_control)
- `JMP`, `JE`, `JG`, `JL`, `JGE`, `JLE`
- `IF`, `IF-ELSE`, `CASE` structures
- Decision-making with `CMP` and flags

### ✅ 4. Looping Structures (assembly_looping)
- Explicit loops (`JMP` + `CMP`)
- Implicit loops using `LOOP` and `CX`
- `REPEAT-UNTIL` logic (`JNE`)
- Nested loops and summation logic
- Even/odd detection with `DIV`

### ✅ 5. Arrays & Addressing Modes (array_operations)
- Declaring arrays with `DB`, `DW`, `DUP`
- Accessing arrays using:
  - Direct, indexed (`[SI]`), based (`[BX]`), based-indexed (`[BX+SI]`)
- Array operations: input, sum, reverse, copy
- Conditional logic: max, min, even, odd

### ✅ 6. Macros and Procedures (macros_procedures)
- Creating and using macros with/without parameters
- Nesting macros
- Procedures for string output, logic reuse, and control flow
- Passing values via registers

### ✅ 7. Stack Operations (stack_operations)
- `PUSH`, `POP`, `PUSHF`, `POPF`
- Using the stack to:
  - Swap values
  - Reverse strings
  - Sum numbers
  - Check for palindrome
- Stack in procedure logic

---
