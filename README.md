# Microprocessor Design

This repository contains the **Verilog** implementation of a simple microprocessor, built and tested using **Vivado**. The project includes modules for an **ALU**, **register file**, and a top-level control unit. 

---

## Features

- **4-Bit Register File:**
  - Four general-purpose registers (`register1`, `register2`, `register3`, `register4`) for storing operands.
  - Read and write operations controlled by `read_sel` and `write_sel` signals.
  - Reset functionality to initialize registers to default values.

- **Arithmetic Logic Unit (ALU):**
  - Performs 12 basic operations, including arithmetic, logic, and bit shifts.
  - Supports addition, subtraction, multiplication, division, AND, OR, XOR, XNOR, and NOT.

- **Control Signals:**
  - `write_enable`: Controls write-back to the register file.
  - `zero_flag` and `carry_flag`: Indicate zero results and carry conditions.

- **Timing Constraints:**
  - Proper constraints have been applied to ensure robust synthesis and timing closure.
  - Constraints defined in `microprocessor_constraints.xdc` file, included in the repository.


---

## Modules Overview

### 1. Microprocessor (`microprocessor.v`)
The top-level module that integrates:
- **Register File:** For data storage and operand retrieval.
- **ALU:** For performing arithmetic and logic operations.

### 2. Register File (`register_file.v`)
- Contains four 4-bit registers with default values assigned.
- Supports:
  - **Read:** Two operands can be selected using `read_sel1` and `read_sel2`.
  - **Write:** Data can be written to a specific register using `write_sel`.

### 3. ALU (`alu.v`)
- Performs arithmetic and logic operations based on a 4-bit opcode (`alu_op`):
  | `alu_op` | Operation        | Description                   |
  |----------|------------------|-------------------------------|
  | `0000`   | Add              | `operand1 + operand2`         |
  | `0001`   | Subtract         | `operand1 - operand2`         |
  | `0010`   | Multiply         | `operand1 * operand2`         |
  | `0011`   | Divide           | `operand1 / operand2`         |
  | `0100`   | AND              | `operand1 & operand2`         |
  | `0101`   | OR               | `operand1 | operand2`         |
  | `0110`   | XOR              | `operand1 ^ operand2`         |
  | `0111`   | XNOR             | `~(operand1 ^ operand2)`      |
  | `1000`   | NOT              | `~operand1`                   |
  | `1001`   | Right Shift      | `operand1 >> 1`               |
  | `1010`   | Left Shift       | `operand1 << 1`               |

---

## Simulation and Verification

### Testbench
A testbench (`microprocessor_tb.v`) is provided to verify functionality. It:
- Stimulates the microprocessor with various inputs.
- Verifies:
  - Correct ALU operations.
  - Proper register read and write-back behavior.
  - Flag conditions (zero and carry).

---

## Synthesis and STA

- **Synthesis:**  
  - The design was synthesized in Vivado to generate a gate-level netlist.
  - Output netlist file: `microprocessor_design`.

- **Reports:**
  - **Timing Report:** Pre-layout timing results are stored in `microprocessor_timing_report.txt`.
  - **Resource Utilization Report:** FPGA resource usage is documented in `microprocessor_utilization_report.txt`.

- **Constraints:**
  - Timing and design constraints are defined in `microprocessor_constraints.xdc`:
    - Clock period.
    - Input/output delays.
    - Reset setup requirements.

- **Pre-Layout STA:**  
  - Timing analysis confirmed no setup or hold violations.
  - Results verified for a clock period of `5.8 ns`.

---
