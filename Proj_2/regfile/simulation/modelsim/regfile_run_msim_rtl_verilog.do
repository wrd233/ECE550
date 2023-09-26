transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_2/regfile {//Mac/Home/Desktop/ECE550/Proj_2/regfile/dec5to32.v}

vlog -vlog01compat -work work +incdir+/Desktop/ECE550/Proj_2/regfile {/Desktop/ECE550/Proj_2/regfile/dec5to32_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  dec5to32_tb

add wave *
view structure
view signals
run -all
