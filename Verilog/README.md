# Verilog

This repository contains Verilog language and their accompanying documentation, based on the course **CSE460: VLSI Design**. Each topic introduces key concepts in digital circuit design and provides both simulation code and notes to understand and implement the systems.
Each topic in the repository includes:
- ✅ A `.asm` file – Complete working code examples (EMU8086-compatible)
- 📄 A `.md` file – Clear written explanation of the topic, with examples and comments
- 📁 A dedicated folder named **Assembly Concepts** – Contains **PDF versions** of all `.md` explanation files for easy offline access or printing

---

## Topics Covered

### ✅ 1: Introduction to Verilog
**Objective**: Understand the basics of Verilog syntax and circuit modeling.  
**Topics**:
- Verilog module structure
- Data types (`wire`, `reg`)
- Vector declarations and continuous assignments
- Behavioral vs Structural modeling

### ✅ 2: Blocking vs Non-Blocking Assignments
**Objective**: Differentiate between blocking (`=`) and non-blocking (`<=`) assignments.  
**Topics**:
- Procedural blocks (`always @(*)`, `always @(posedge clk)`)
- Conditional logic with `if-else` and `case`
- MUX and encoder implementations

### ✅ 3: Finite State Machines (FSMs)
**Objective**: Design and simulate Moore and Mealy state machines.  
**Topics**:
- Synchronous sequential circuit design
- FSM state diagrams and state tables
- Real-world examples like sequence detectors
- Verilog FSM implementation

### ✅ 4: Vending Machine (Real-Life FSM Application)
**Objective**: Model real-life vending machines using FSMs.  
**Topics**:
- FSM design for 10 Tk, 15 Tk, and 20 Tk products
- Handling state transitions and output logic
- Modeling user inputs and change dispensing

## 🛠 Tools Used

- Intel Quartus Prime
- ModelSim / QuestaSim
- Verilog HDL

---
