transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/mux32_8to1.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/alu_32_bit.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/alu.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/alu_1_bit.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/alu_1_bit_f.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/full_adder.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/and_gate.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/or_gate.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/not_gate.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/mux_4.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/mux_8.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/mux_2.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/alu_16_bit.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/overflow_check.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_1/alu {//Mac/Home/Desktop/ECE550/Proj_1/alu/alu_16_bit_f.v}

vlog -vlog01compat -work work +incdir+/Desktop/ECE550/Proj_1/alu {/Desktop/ECE550/Proj_1/alu/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
