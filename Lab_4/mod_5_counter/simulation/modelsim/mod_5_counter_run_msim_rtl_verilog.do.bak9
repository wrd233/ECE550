transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Lab_4/mod_5_counter {//Mac/Home/Desktop/ECE550/Lab_4/mod_5_counter/mod_5_counter.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Lab_4/mod_5_counter {//Mac/Home/Desktop/ECE550/Lab_4/mod_5_counter/register.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Lab_4/mod_5_counter {//Mac/Home/Desktop/ECE550/Lab_4/mod_5_counter/mux_8.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Lab_4/mod_5_counter {//Mac/Home/Desktop/ECE550/Lab_4/mod_5_counter/d_latch.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Lab_4/mod_5_counter {//Mac/Home/Desktop/ECE550/Lab_4/mod_5_counter/d_flip_flop.v}

vlog -vlog01compat -work work +incdir+/Desktop/ECE550/Lab_4/mod_5_counter {/Desktop/ECE550/Lab_4/mod_5_counter/mod_5_counter_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  mod_5_counter_tb

add wave *
view structure
view signals
run -all
