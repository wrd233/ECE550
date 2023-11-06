transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/inst_decoder.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/dffe_ref.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/imem.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/dmem.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/RCA_32bit.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/skeleton_test.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/skeleton.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/register.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/regfile.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/processor.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/frequency_divider_by2.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/alu.v}

vlog -vlog01compat -work work +incdir+/Desktop/ECE550/Proj_3/Project_Files {/Desktop/ECE550/Proj_3/Project_Files/skeleton_test_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  skeleton_test_tb

add wave *
view structure
view signals
run -all
