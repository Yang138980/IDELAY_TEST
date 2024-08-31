`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/30 14:51:45
// Design Name: 
// Module Name: IDELAY_TEST
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IDELAY_TEST
(
   input  wire       clk      ,
   input  wire       rst_n    ,
   input  wire       data_in  ,

   output wire       data_out
);
   
   wire     RDY   ;
    
   IDELAYCTRL IDELAYCTRL_inst (
      .RDY(RDY),       // 1-bit output: Ready output
      .REFCLK(clk), // 1-bit input: Reference clock input
      .RST(~rst_n)        // 1-bit input: Active high reset input
   );

   IDELAYE2 #(
      .CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion (FALSE, TRUE)
      .DELAY_SRC("IDATAIN"),           // Delay input (IDATAIN, DATAIN)
      .HIGH_PERFORMANCE_MODE("FALSE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
      .IDELAY_TYPE("FIXED"),           // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
      .IDELAY_VALUE(0),                // Input delay tap setting (0-31)
      .PIPE_SEL("FALSE"),              // Select pipelined mode, FALSE, TRUE
      .REFCLK_FREQUENCY(200.0),        // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
      .SIGNAL_PATTERN("DATA")          // DATA, CLOCK input signal
   )
   IDELAYE2_inst (
      .CNTVALUEOUT(CNTVALUEOUT), // 5-bit output: Counter value output
      .DATAOUT(data_out),         // 1-bit output: Delayed data output
      .C(clk),                     // 1-bit input: Clock input
      .CE(CE),                   // 1-bit input: Active high enable increment/decrement input
      .CINVCTRL(CINVCTRL),       // 1-bit input: Dynamic clock inversion input
      .CNTVALUEIN(CNTVALUEIN),   // 5-bit input: Counter value input
      .DATAIN(DATAIN),           // 1-bit input: Internal delay data input
      .IDATAIN(IDATAIN),         // 1-bit input: Data input from the I/O
      .INC(INC),                 // 1-bit input: Increment / Decrement tap delay input
      .LD(LD),                   // 1-bit input: Load IDELAY_VALUE input
      .LDPIPEEN(LDPIPEEN),       // 1-bit input: Enable PIPELINE register to load data input
      .REGRST(~rst_n)            // 1-bit input: Active-high reset tap-delay input
   );

   
endmodule
