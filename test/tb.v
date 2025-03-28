`default_nettype none 
`timescale 1ns / 1ps

/* This testbench instantiates the LFSR module and sets up the signals
   for testing with cocotb (Python test scripts). It also includes
   the gate-level test options for power and ground signals.
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

`ifdef GL_TEST
  // Gate-level test: Define power and ground signals
  wire VPWR = 1'b1;
  wire VGND = 1'b0;
`endif

  // Replace tt_um_factory_test with your module name:
  lfsr user_project (  // Instantiate your module name here (lfsr)
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
