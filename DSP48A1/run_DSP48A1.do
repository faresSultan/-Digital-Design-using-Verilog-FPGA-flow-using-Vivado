vlib work
vlog DSP48A1.v DSP48A1_tb.v
vsim -voptargs=+acc work.DSP48A1_tb

add wave -position insertpoint  \
sim:/DSP48A1_tb/clk
add wave -position insertpoint  \
sim:/DSP48A1_tb/B \
sim:/DSP48A1_tb/D
add wave -position insertpoint  \
sim:/DSP48A1_tb/OPMODE
add wave -position insertpoint  \
sim:/DSP48A1_tb/RSTB \
sim:/DSP48A1_tb/RSTD \
sim:/DSP48A1_tb/CEB \
sim:/DSP48A1_tb/CED
add wave -position insertpoint  \
sim:/DSP48A1_tb/CEOPMODE
add wave -position insertpoint sim:/DSP48A1_tb/DUT_preAdder/preStage/*
run -all
#quit -sim