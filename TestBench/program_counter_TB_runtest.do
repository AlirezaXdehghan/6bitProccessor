SetActiveLib -work
comp -include "$dsn\src\Program_Counter.vhd" 
comp -include "$dsn\src\TestBench\program_counter_TB.vhd" 
asim +access +r TESTBENCH_FOR_program_counter 
wave 
wave -noreg LD
wave -noreg INC
wave -noreg CLK
wave -noreg CLR
wave -noreg RIN
wave -noreg ROUT
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\program_counter_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_program_counter 
