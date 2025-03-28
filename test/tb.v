`default_nettype none 
`timescale 1ns / 1ps

/* This testbench instantiates the LFSR module and sets up the signals
   for testing with cocotb (Python test scripts).
*/

module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave or surfer.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst;
  wire [31:0] out;  // Adjust the width as needed for your LFSR module (e.g., 32-bit)

  // Instantiate the LFSR module:
  lfsr #(
    .WIDTH(32)  // Set the LFSR width, change this as necessary for different sizes
  ) uut (
    .clk(clk),
    .rst(rst),
    .out(out)
  );

  // Generate clock signal
  always begin
    #10 clk = ~clk;  // 50 MHz clock (10ns period)
  end

  // Initial reset and test stimulus
  initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    
    // Reset the LFSR
    #5 rst = 1;
    #10 rst = 0;

    // Wait for some clock cycles
    #100;

    // Add more testing here (e.g., checking output, monitoring behavior)

    // End simulation
    $stop();
  end

endmodule
