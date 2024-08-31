`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/31 14:06:50
// Design Name: 
// Module Name: tb_idelay_fixed
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


module tb_idelay_fixed();

reg             clk         ;
reg             rst_n       ;
reg             data_in     ;
wire            data_out    ;
wire    [4:0]   CNTVALUEOUT ;

wire        clk_200MHz  ;
wire        locked      ;

wire        RDY         ;

initial begin
    clk     <=      1'b0;
    rst_n   <=      1'b0;
    #60
    rst_n   <=      1'b1;
end

always  #5  clk     <=      ~clk    ;

always@(posedge clk or negedge locked)
    if(locked == 1'b0)
        data_in <=  1'b0;
    else
        data_in <=  {$random} % 2;

clk_wiz_200MHz u_clk_wiz_200MHz
(
    .clk_out1(clk_200MHz),      // output clk_out1
    .locked  (locked),          // output locked
    .clk_in1 (clk)              // input clk_in1
); 

IDELAYCTRL IDELAYCTRL_inst (
      .RDY(RDY),       // 1-bit output: Ready output
      .REFCLK(clk), // 1-bit input: Reference clock input
      .RST(~locked)        // 1-bit input: Active high reset input
   );

   IDELAYE2 #(
      .CINVCTRL_SEL("FALSE"),          // Enable dynamic clock inversion (FALSE, TRUE)
      .DELAY_SRC("DATAIN"),           // Delay input (IDATAIN, DATAIN)
      .HIGH_PERFORMANCE_MODE("FALSE"), // Reduced jitter ("TRUE"), Reduced power ("FALSE")
      .IDELAY_TYPE("FIXED"),           // FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
      .IDELAY_VALUE(1),                // Input delay tap setting (0-31)
      .PIPE_SEL("FALSE"),              // Select pipelined mode, FALSE, TRUE
      .REFCLK_FREQUENCY(300.0),        // IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
      .SIGNAL_PATTERN("DATA")          // DATA, CLOCK input signal
   )
   IDELAYE2_inst (
      .CNTVALUEOUT(CNTVALUEOUT), // 5-bit output: Counter value output
      .DATAOUT(data_out),         // 1-bit output: Delayed data output
      .C(1'b0),                     // 1-bit input: Clock input
      .CE(1'b0),                   // 1-bit input: Active high enable increment/decrement input
      .CINVCTRL(1'b0),       // 1-bit input: Dynamic clock inversion input
      .CNTVALUEIN(5'd0),   // 5-bit input: Counter value input
      .DATAIN(data_in),           // 1-bit input: Internal delay data input
      .IDATAIN(1'b0),         // 1-bit input: Data input from the I/O
      .INC(1'b0),                 // 1-bit input: Increment / Decrement tap delay input
      .LD(1'b0),                   // 1-bit input: Load IDELAY_VALUE input
      .LDPIPEEN(1'b0),       // 1-bit input: Enable PIPELINE register to load data input
      .REGRST(~locked)            // 1-bit input: Active-high reset tap-delay input
   );

endmodule
