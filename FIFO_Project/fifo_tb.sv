`timescale 1ns/1ps

module fifo_tb;

  // Local parameters
  localparam DATA_WIDTH = 8;
  localparam DEPTH = 16;
  localparam ADDR_WIDTH = $clog2(DEPTH);

  // DUT signals
  logic clk, rst_n, wr_en, rd_en;
  logic [DATA_WIDTH-1:0] wr_data;
  logic [DATA_WIDTH-1:0] rd_data;
  logic full, empty;

  // Instantiate FIFO
  fifo #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH)
  ) dut (
    .clk(clk),
    .rst_n(rst_n),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .wr_data(wr_data),
    .rd_data(rd_data),
    .full(full),
    .empty(empty)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Stimulus
  initial begin

    $dumpfile("fifo_wave.vcd");
    $dumpvars(0, fifo_tb);

    // Initialize zeros
    clk = 0;
    rst_n = 0;
    wr_en = 0;
    rd_en = 0;
    wr_data = 0;

    // Reset
    @(posedge clk); 
    rst_n = 1;

    // WRITE 4 values: 11, 22, 33, 44
    repeat (4) begin
      wr_en = 1;
      wr_data = wr_data + 8'd11;
      @(posedge clk);
    end
    wr_en = 0;

    // Wait 2 cycles for accuracy 
    @(posedge clk); @(posedge clk);

    // READ 4 values
    repeat (4) begin
      rd_en = 1;
      @(posedge clk);
    end
    rd_en = 0;

    // Finish
    #20;
    $finish;
  end

  // Output for debug/verification
  always_ff @(posedge clk) begin
  if (wr_en && !full) begin
    $display("Time %0t: Wrote data = %0d", $time, wr_data);
  end
  if (rd_en && !empty) begin
    $display("Time %0t: Read data = %0d", $time, rd_data);
  end
  end
  

endmodule
