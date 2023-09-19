transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Lab_3/multiplier_W_tree_5_bit {//Mac/Home/Desktop/ECE550/Lab_3/multiplier_W_tree_5_bit/multiplier_W_tree_5_bit.v}

vlog -vlog01compat -work work +incdir+/Desktop/ECE550/Lab_3/multiplier_W_tree_5_bit {/Desktop/ECE550/Lab_3/multiplier_W_tree_5_bit/multiplier_W_tree_5_bit_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  multiplier_W_tree_5_bit_tb

add wave *
view structure
view signals
run -all
