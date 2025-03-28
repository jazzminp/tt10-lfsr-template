<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The lfsr.v project implements a Linear Feedback Shift Register (LFSR), a hardware-based pseudo-random number generator. It uses a clock signal (clk) to shift a register value and a feedback polynomial to determine the new input bit at each clock cycle. The width of the register (WIDTH) determines the number of bits in the output sequence. The module also accepts a reset signal (rst), which sets the LFSR's state to zero when asserted. The result is a pseudo-random bit sequence output (out), useful in applications such as cryptography, testing, and simulations

## How to test

To test the lfsr.v module, create a Verilog testbench that provides a clock signal (clk) and a reset signal (rst). The testbench should initialize the signals, toggle the clock, and observe the output of the LFSR (out). Run the simulation for several clock cycles, verifying that the output follows the expected behavior of an LFSR by checking the randomness and correctness of the sequence. Use a Verilog simulator (e.g., ModelSim, VCS) to compile and simulate the design.

## External hardware

This project does not use any external hardware by default.
