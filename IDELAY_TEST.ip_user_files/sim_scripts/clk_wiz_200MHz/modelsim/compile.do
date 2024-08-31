vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic" \
"../../../../IDELAY_TEST.srcs/sources_1/ip/clk_wiz_200MHz/clk_wiz_200MHz_clk_wiz.v" \
"../../../../IDELAY_TEST.srcs/sources_1/ip/clk_wiz_200MHz/clk_wiz_200MHz.v" \


vlog -work xil_defaultlib \
"glbl.v"

