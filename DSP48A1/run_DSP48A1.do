vlib work
vlog DSP48A1.v DSP48A1_tb.v
vsim -voptargs=+acc work.DSP48A1_tb

add wave -position insertpoint  \
sim:/DSP48A1_tb/clk

add wave -position insertpoint  \
sim:/DSP48A1_tb/A \
sim:/DSP48A1_tb/B \
sim:/DSP48A1_tb/D \
sim:/DSP48A1_tb/C \
sim:/DSP48A1_tb/PCIN \
sim:/DSP48A1_tb/OPMODE \
sim:/DSP48A1_tb/clk \
sim:/DSP48A1_tb/CARRYIN \
sim:/DSP48A1_tb/BCIN \
sim:/DSP48A1_tb/RSTA \
sim:/DSP48A1_tb/RSTB \
sim:/DSP48A1_tb/RSTC \
sim:/DSP48A1_tb/RSTD \
sim:/DSP48A1_tb/RSTP \
sim:/DSP48A1_tb/RSTM \
sim:/DSP48A1_tb/RSTCARRYIN \
sim:/DSP48A1_tb/RSTOPMODE \
sim:/DSP48A1_tb/CEA \
sim:/DSP48A1_tb/CEB \
sim:/DSP48A1_tb/CEC \
sim:/DSP48A1_tb/CED \
sim:/DSP48A1_tb/CEP \
sim:/DSP48A1_tb/CEM \
sim:/DSP48A1_tb/CECARRYIN \
sim:/DSP48A1_tb/CEOPMODE \
sim:/DSP48A1_tb/BCOUT \
sim:/DSP48A1_tb/PCOUT \
sim:/DSP48A1_tb/P \
sim:/DSP48A1_tb/M \
sim:/DSP48A1_tb/CARRYOUT

add wave -position insertpoint sim:/DSP48A1_tb/DUT/postStage/*
add wave -position insertpoint sim:/DSP48A1_tb/DUT/B1_REG/mux_out
run -all
#quit -sim