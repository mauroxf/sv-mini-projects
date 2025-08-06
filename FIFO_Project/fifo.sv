`timescale 1ns/1ps

module fifo_tb;

  // Parameters
  localparam DATA_WIDTH = 8;
  localparam DEPTH = 16;

  // DUT signals
  logic clk;
  logic rst_n;
  logic wr_en;
  logic rd_en;
  logic [DATA_WIDTH-1:0] wr_data;
  logic [DATA_WIDTH-1:0] rd_data;
  logic full;
  logic empty;

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
    // Init
    clk = 0;
    rst_n = 0;
    wr_en = 0;
    rd_en = 0;
    wr_data = 0;

    // Reset
    #12;
    rst_n = 1;

    // Write 5 values
    for (int i = 0; i < 5; i++) begin
      @(posedge clk);
      wr_en = 1;
      wr_data = i * 10; // write 0, 10, 20, 30, 40
    end

    @(posedge clk);
    wr_en = 0;

    // Wait a couple cycles
    repeat (2) @(posedge clk);

    // Read back 5 values
    for (int i = 0; i < 5; i++) begin
      @(posedge clk);
      rd_en = 1;
      #1 $display("Read data: %0d", rd_data);
    end

    @(posedge clk);
    rd_en = 0;
    
    $dumpfile("fifo_wave.vcd");
    $dumpvars(0, fifo_tb);

    // Done
    #10;
    $finish;
  end

endmodule
