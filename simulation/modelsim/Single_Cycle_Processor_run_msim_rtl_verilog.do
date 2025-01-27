transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Faculdade/2024-1/LAOC/Processor\ 16\ bits/CPU_v0.3 {C:/Faculdade/2024-1/LAOC/Processor 16 bits/CPU_v0.3/typedefs.sv}
vlog -sv -work work +incdir+C:/Faculdade/2024-1/LAOC/Processor\ 16\ bits/CPU_v0.3 {C:/Faculdade/2024-1/LAOC/Processor 16 bits/CPU_v0.3/RegFile.sv}
vlog -sv -work work +incdir+C:/Faculdade/2024-1/LAOC/Processor\ 16\ bits/CPU_v0.3 {C:/Faculdade/2024-1/LAOC/Processor 16 bits/CPU_v0.3/Reg.sv}
vlog -sv -work work +incdir+C:/Faculdade/2024-1/LAOC/Processor\ 16\ bits/CPU_v0.3 {C:/Faculdade/2024-1/LAOC/Processor 16 bits/CPU_v0.3/Mux2x1.sv}
vlog -sv -work work +incdir+C:/Faculdade/2024-1/LAOC/Processor\ 16\ bits/CPU_v0.3 {C:/Faculdade/2024-1/LAOC/Processor 16 bits/CPU_v0.3/Mem.sv}
vlog -sv -work work +incdir+C:/Faculdade/2024-1/LAOC/Processor\ 16\ bits/CPU_v0.3 {C:/Faculdade/2024-1/LAOC/Processor 16 bits/CPU_v0.3/Data_Mem.sv}
vlog -sv -work work +incdir+C:/Faculdade/2024-1/LAOC/Processor\ 16\ bits/CPU_v0.3 {C:/Faculdade/2024-1/LAOC/Processor 16 bits/CPU_v0.3/SingleCycle_Top.sv}
vlog -sv -work work +incdir+C:/Faculdade/2024-1/LAOC/Processor\ 16\ bits/CPU_v0.3 {C:/Faculdade/2024-1/LAOC/Processor 16 bits/CPU_v0.3/Controller.sv}
vlog -sv -work work +incdir+C:/Faculdade/2024-1/LAOC/Processor\ 16\ bits/CPU_v0.3 {C:/Faculdade/2024-1/LAOC/Processor 16 bits/CPU_v0.3/ALU.sv}

vlog -sv -work work +incdir+C:/Faculdade/2024-1/LAOC/Processor\ 16\ bits/CPU_v0.3 {C:/Faculdade/2024-1/LAOC/Processor 16 bits/CPU_v0.3/SingleCycle_Top_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  SingleCycle_Top_tb

add wave *
view structure
view signals
run -all
