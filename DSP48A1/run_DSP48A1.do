vlib work
vlog DSP48A1.v DSP48A1_tb.v
vsim -voptargs=+acc work.DSP48A1_tb

add wave -position insertpoint  \
sim:/DSP48A1_tb/clk

add wave -position insertpoint  \
sim:/DSP48A1_tb/A \
sim:/DSP48A1_tb/B \
sim:/DSP48A1_tb/D 

add wave -position insertpoint sim:/DSP48A1_tb/DUT/D_REG/mux_out
add wave -position insertpoint sim:/DSP48A1_tb/DUT/B0_REG/mux_out
add wave -position insertpoint sim:/DSP48A1_tb/DUT/preStage/preStage_out

add wave -position insertpoint sim:/DSP48A1_tb/DUT/B1_REG/*
add wave -position insertpoint sim:/DSP48A1_tb/DUT/A1_REG/*
add wave -position insertpoint sim:/DSP48A1_tb/DUT/A0_REG/mux_out
add wave -position insertpoint sim:/DSP48A1_tb/DUT/M_REG/*
add wave -position insertpoint  \
sim:/DSP48A1_tb/M

run -all
#quit -sim