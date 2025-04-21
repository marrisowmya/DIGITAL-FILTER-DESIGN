`timescale 1ns/1ps

module fir_filter_tb;

    parameter N = 4;
    parameter DATA_WIDTH = 8;

    reg clk, rst;
    reg signed [DATA_WIDTH-1:0] x_in;
    wire signed [2*DATA_WIDTH-1:0] y_out;

    // Instantiate the FIR filter
    fir_filter #(N, DATA_WIDTH) uut (
        .clk(clk),
        .rst(rst),
        .x_in(x_in),
        .y_out(y_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        x_in = 0;

        #10 rst = 0; // Deassert reset

        // Testcase 1: Constant input
        x_in = 8'd10;
        repeat (5) @(posedge clk);

        // Testcase 2: Increasing ramp
        x_in = 8'd0;
        repeat (5) begin
            @(posedge clk);
            x_in = x_in + 1;
        end

        // Testcase 3: Alternating pattern
        repeat (5) begin
            @(posedge clk);
            x_in = (x_in == 8'd20) ? -8'd20 : 8'd20;
        end

        // Testcase 4: Random values
        repeat (10) begin
            @(posedge clk);
            x_in = $random % 128;
        end

        // Testcase 5: Zero input (check if filter settles)
        x_in = 0;
        repeat (5) @(posedge clk);

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | x_in=%d | y_out=%d", $time, x_in, y_out);
    end

endmodule

