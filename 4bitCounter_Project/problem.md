## Problem Statement

Design and simulate a 4-bit synchronous up-counter in SystemVerilog with the following features:
- The counter increments on the **rising edge** of the clock (`clk`) when **`enable` is high**.
- The counter **resets to zero** when `reset` is asserted (active-high).
- Counter stops counting if `enable` is low.

This module demonstrates basic sequential logic using `always_ff` and provides waveform output for educational use.

### Truth Table 

| `reset` | `enable` | `clk ↑` | `count` Behavior  |
|---------|----------|---------|--------------------|
| 1       | X        | ↑       | `0000` (Reset)     |
| 0       | 0        | ↑       | Hold               |
| 0       | 1        | ↑       | `count + 1`        |

### Inputs

- `clk` (`1-bit`): Clock signal.
- `reset` (`1-bit`): Active-high synchronous reset.
- `enable` (`1-bit`): Counter enable signal.

### Output

- `count` (`4-bit`): Current counter value.

------

## Bash Commands

To compile and run with Icarus Verilog:

```bash
iverilog -o counter_tb counter_4b.sv counter_4btb.sv
vvp counter_tb
````
*OR*

Use EDA Playground (Questa) and EPWave for waveform viewing
