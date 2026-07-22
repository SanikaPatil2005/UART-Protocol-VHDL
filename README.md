# UART Communication Protocol in VHDL

A UART (Universal Asynchronous Receiver Transmitter) communication system designed in VHDL and implemented using Xilinx Vivado 2023.2. This project demonstrates asynchronous serial communication by transmitting and receiving 8-bit data using separate UART Transmitter and Receiver modules synchronized through a Baud Rate Generator.

---

## Project Overview

This project implements a complete UART communication system consisting of:

- UART Transmitter (TX)
- UART Receiver (RX)
- Baud Rate Generator
- Top-Level Integration
- Functional Testbench

The transmitter converts parallel input data into serial format, while the receiver reconstructs the serial data back into parallel form. Communication is synchronized using the generated baud clock.

---

## Features

- VHDL Implementation
- UART Transmitter
- UART Receiver
- Baud Rate Generator
- RTL Schematic
- Functional Simulation
- Synthesized Design
- Implemented Design
- FSM Based Design
- Modular Architecture

---

## Tools Used

| Tool | Version |
|------|---------|
| Xilinx Vivado | 2023.2 |
| Language | VHDL |
| FPGA Family | Artix-7 |
| Device | xc7a35tcpg236-1 |

---

## Project Structure

```
UART_Protocol_VHDL/
│
├── baud_generator.vhd
├── uart_tx.vhd
├── uart_rx.vhd
├── uart_top.vhd
├── uart_tb.vhd
│
├── Images/
│   ├── UART_Simulation_Waveform.png
│   ├── UART_Project_Hierarchy.png
│   ├── UART_RTL_Schematic.png
│   └── UART_Implemented_Design.png
│
├── Diagrams/
│   ├── UART_Block_Diagram.png
│   ├── UART_TX_FSM.png
│   └── UART_RX_FSM.png
│
└── README.md
```

---

## System Block Diagram

The UART communication system consists of:

- Baud Generator
- UART Transmitter
- UART Receiver
- Serial TX Line

---

## Finite State Machines

### UART Transmitter States

- IDLE
- START_BIT
- DATA_BITS
- STOP_BIT

### UART Receiver States

- IDLE
- DATA_BITS
- STOP_BIT

---

## Simulation Result

Simulation verifies successful UART data transmission and reception.

Example:

Input Data:

```
0xAA
```

Received Data:

```
0xAA
```

The simulation waveform confirms correct UART operation with successful data recovery at the receiver.

---

## Project Outputs

- Functional Simulation
- RTL Schematic
- Implemented Design
- Waveform Verification
- FSM Design
- Block Diagram

---

## Applications

- FPGA-Based Embedded Systems
- Serial Communication Interfaces
- Microcontroller Communication
- Industrial Automation
- IoT Devices
- Communication Protocol Learning

---

## Future Improvements

- Configurable Baud Rate
- Parity Bit Support
- Variable Data Length
- FIFO Buffer
- Interrupt Support
- Hardware Validation on FPGA Board

---

## Author

**Sanika Shriram Patil**

Electronics and Computer Engineering

Maharashtra Institute of Technology, Chhatrapati Sambhajinagar

---

## License

This project is developed for educational and learning purposes.
