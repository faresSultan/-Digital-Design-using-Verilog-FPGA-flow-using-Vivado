vlib work
vlog Q2.v Q1_tb.v
vsim -voptargs=+acc work.Q2_tb
add wave *
run -all
#quit -sim