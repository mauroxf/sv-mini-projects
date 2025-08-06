## Problem Statement

Design and simulate a parameterized First-In-First-Out (FIFO) buffer in SystemVerilog with the following features:

- Data is written into the FIFO on the rising edge of the clock (`clk`) when `wr_en` is high and the buffer is **not full**.
- Data is read from the FIFO on the rising edge of the clock when `rd_en` is high and the buffer is **not empty**.
- The FIFO uses an internal memory array and circular pointers (`wr_ptr`, `rd_ptr`) to manage storage.
- The `full` and `empty` flags are generated based on a counter tracking the number of stored elements.
- The FIFO is fully synchronous and includes parameterizable data width and depth.



### Truth Table

| wr_en | rd_en | full | empty | Behavior                |
|-------|-------|------|-------|--------------------------|
| 1     | 0     | 0    | X     | Write to FIFO            |
| 0     | 1     | X    | 0     | Read from FIFO           |
| 1     | 1     | 0    | 0     | Simultaneous Read/Write  |
| 0     | 0     | X    | X     | Hold                     |
| 1     | X     | 1    | X     | No Write (Full)          |
| X     | 1     | X    | 1     | No Read (Empty)          |


### Inputs

- `clk` (`1-bit`): Clock signal.
- `rst_n` (`1-bit`): Active-low synchronous reset.
- `wr_en` (`1-bit`): Write enable.
- `rd_en` (`1-bit`): Read enable.
- `wr_data` (`DATA_WIDTH-bit`): Input data to write.


### Outputs

- `rd_data` (`DATA_WIDTH-bit`): Output data being read.
- `full` (`1-bit`): Indicates buffer is full.
- `empty` (`1-bit`): Indicates buffer is empty.

---

## Bash Commands

To compile and run with Icarus Verilog:

```bash
iverilog -o fifo_tb fifo.sv fifo_tb.sv
vvp fifo_tb
````
*OR*

Use EDA Playground (Questa) and EPWave for waveform viewing
