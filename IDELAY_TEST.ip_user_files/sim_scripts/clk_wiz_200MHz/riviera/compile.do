vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic" \
"../../../../IDELAY_TEST.srcs/sources_1/ip/clk_wiz_200MHz/clk_wiz_200MHz_clk_wiz.v" \
"../../../../IDELAY_TEST.srcs/sources_1/ip/clk_wiz_200MHz/clk_wiz_200MHz.v" \


vlog -work xil_defaultlib \
"glbl.v"

