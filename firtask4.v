// FIR Filter Design in Verilog

module fir_filter #(parameter N = 4, parameter DATA_WIDTH = 8) (
    input clk, rst,
    input signed [DATA_WIDTH-1:0] x_in,
    output reg signed [2*DATA_WIDTH-1:0] y_out
);

    // Coefficients for FIR filter (example values)
    parameter signed [DATA_WIDTH-1:0] h [0:N-1] = '{8'd1, 8'd2, 8'd3, 8'd4};

    // Shift register for input samples
    reg signed [DATA_WIDTH-1:0] x_reg [0:N-1];

    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < N; i = i + 1)
                x_reg[i] <= 0;
            y_out <= 0;
        end else begin
            // Shift input samples
            for (i = N-1; i > 0; i = i - 1)
                x_reg[i] <= x_reg[i-1];
            x_reg[0] <= x_in;

            // Compute output using convolution sum
            y_out <= 0;
            for (i = 0; i < N; i = i + 1)
                y_out <= y_out + x_reg[i] * h[i];
        end
    end

endmodule
