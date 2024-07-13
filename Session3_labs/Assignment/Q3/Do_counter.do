vlib work
vlog Q3.v Q3_tb.v
vsim -voptargs=+acc work.Q3_tb
add wave *
run -all
#quit -sim