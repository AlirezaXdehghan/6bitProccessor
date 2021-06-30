SetActiveLib -work
comp -include "$dsn\src\Normal_Register.vhd" 
comp -include "$dsn\src\TestBench\normal_register_TB.vhd" 
asim +access +r TESTBENCH_FOR_normal_register 
wave 
wave -noreg LD
wave -noreg CLK
wave -noreg RIN
wave -noreg ZR
wave -noreg ROUT
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\normal_register_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_normal_register 
