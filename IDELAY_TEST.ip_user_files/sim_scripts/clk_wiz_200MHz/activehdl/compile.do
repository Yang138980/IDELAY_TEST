vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../IDELAY_TEST.srcs/sources_1/ip/clk_wiz_200MHz/clk_wiz_200MHz_clk_wiz.v" \
"../../../../IDELAY_TEST.srcs/sources_1/ip/clk_wiz_200MHz/clk_wiz_200MHz.v" \


vlog -work xil_defaultlib \
"glbl.v"

