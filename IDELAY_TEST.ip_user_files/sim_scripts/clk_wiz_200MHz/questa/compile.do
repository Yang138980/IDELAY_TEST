vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 "+incdir+../../../ipstatic" \
"../../../../IDELAY_TEST.srcs/sources_1/ip/clk_wiz_200MHz/clk_wiz_200MHz_clk_wiz.v" \
"../../../../IDELAY_TEST.srcs/sources_1/ip/clk_wiz_200MHz/clk_wiz_200MHz.v" \


vlog -work xil_defaultlib \
"glbl.v"

