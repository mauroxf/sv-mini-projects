`timescale 1ns/1ps

module counter_4btb;

    logic clk;
    logic reset;
    logic enable;
    logic [3:0] count;

    // Instantiate DUT
    counter_4b uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("counter.vcd");
        $dumpvars(0, counter_4btb);

        clk = 0;
        reset = 1; enable = 0; #10;

        reset = 0; enable = 1; #100;

        enable = 0; #20;

        reset = 1; #10;
        reset = 0; enable = 1; #40;

        $finish;
    end

endmodule
