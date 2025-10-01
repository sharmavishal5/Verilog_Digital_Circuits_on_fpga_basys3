# Verilog Digital Circuits on FPGA (Basys3)

A collection of Verilog implementations of fundamental digital circuits — targeted for the **Basys3 FPGA board**.  
This repository aims to help learners understand and experiment with digital logic by synthesizing and testing real hardware.

---

## 📂 Repository Structure
├── FPGA_Board_output/
│ └── Images/ # Screenshots / photographs from the FPGA board
├── design_code/ # Verilog modules & top‐level designs
├── testbench_code/ # Verilog testbenches for simulation
└── README.md # This file


- **design_code/**: Contains Verilog source files for adders, multiplexers, decoders, ALU, counters, RAM, shift registers, parity checkers, etc.  
- **testbench_code/**: Provides testbenches to simulate the module functionality before loading to hardware.  
- **FPGA_Board_output/Images**: Visuals showing the output of your circuits on Basys3 hardware (LEDs, displays, waveforms).

---

## 🚀 Features & Implemented Modules

Some of the key circuits included:

- Adders (half adder, full adder, ripple carry adder)  
- Multiplexer / Demultiplexer  
- Encoder / Decoder  
- Flip-flops (D, JK, T, SR)  
- Shift registers (left, right, etc.)  
- Up / Down counters  
- RAM modules  
- Arithmetic Logic Unit (ALU)  
- Parity checker / generator 

Each module is designed to be synthesizable on FPGA (Basys3) and is paired with testbenches for functional verification.

---

## 🛠 Getting Started

Here’s how you can use this repository locally:

### Prerequisites

- Vivado (or any FPGA toolchain supporting Basys3)  
- Basic understanding of Verilog HDL  
- A Basys3 FPGA board (if you want to test on real hardware)

### Simulation & Synthesis

1. Open Vivado (or your preferred tool) and create a new project targeting Basys3 (or your FPGA board).  
2. Add the relevant Verilog files from **design_code/** and testbench files from **testbench_code/**.  
3. Run simulation to validate behavior.  
4. Synthesize and implement the design.  
5. Generate bitstream and load it into the Basys3 board for hardware verification.  

### Example Workflow

1. Choose a module (e.g. `full_adder.v`) in **design_code/**.  
2. Open its testbench counterpart `tb_full_adder.v` in **testbench_code/**.  
3. Run the simulation and inspect waveforms to ensure correctness.  
4. Create a top module that wraps your design (if necessary), map FPGA pins (LEDs, switches), and program the board.  
5. Observe the module behavior via hardware (LED toggles, switches, etc.).

---

## 📝 Best Practices & Notes

- Always verify with testbench before synthesizing to hardware to catch logical errors early.  
- Use meaningful module names and consistent file naming conventions (e.g. `mux_4to1.v`, `sr_flipflop.v`).  
- Document ports and internal logic using comments to improve readability.  
- Be mindful of FPGA resource usage (LUTs, registers) when designing more complex modules.  
- When creating a top-level design, carefully map I/O pins to physical FPGA pins via an XDC constraints file.

---

Thanks for checking it out — happy coding & exploring digital logic on FPGA!



