transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/skeleton.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/regfile.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/processor.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/imem.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/ECE550/Proj_3/Project_Files {//Mac/Home/Desktop/ECE550/Proj_3/Project_Files/dmem.v}

