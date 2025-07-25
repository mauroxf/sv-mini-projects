## REPORT

This mini project implements a simple **4-bit binary counter** in SystemVerilog. The counter increments its value on each rising edge of the clock when enabled. When the `reset` signal is high, the counter value is cleared to zero.

## Design Overview

- **Counter Width**: 4 bits  
- **Inputs**:
  - `clk`: Clock signal
  - `reset`: Active-high synchronous reset
  - `enable`: Enables counting when high  
- **Output**:
  - `count[3:0]`: 4-bit binary counter output
- On rising clock edge:
  - If `reset` is high, `count` is set to `4'b0000`
  - Else if `enable` is high, `count` increments by 1


## Simulation Details

The design was simulated using **Siemens Questa** via **EDA Playground**. The testbench provides a clock, toggles `reset` and `enable`, and runs through a full cycle of the counter behavior.

### Waveform Output

The waveform confirms proper counter operation:
- Synchronous reset
- Counting begins only when `enable` is high
- Output `count[3:0]` increments every clock cycle

![Waveform Screenshot](../results/counter_waveform.png)

## Summary

This project demonstrates:

- Use of `always_ff` block in SystemVerilog
- 4-bit synchronous counter design with `reset` and `enable`
- Basic waveform simulation and analysis using `Questa` on EDA Playground
