vlib work
vlog Q1.v Q1_tb.v
vsim -voptargs=+acc work.Q1_tb
add wave *
run -all
#quit -sim