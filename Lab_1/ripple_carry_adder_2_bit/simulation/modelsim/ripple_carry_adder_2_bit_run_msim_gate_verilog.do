transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {ripple_carry_adder_2_bit_7_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+/Desktop/ECE550/Lab_1/ripple_carry_adder_2_bit {/Desktop/ECE550/Lab_1/ripple_carry_adder_2_bit/ripple_carry_adder_2_bit_tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  ripple_carry_adder_2_bit_tb

add wave *
view structure
view signals
run -all
