SetActiveLib -work
comp -include "$dsn\src\Control_Unit.vhd" 
comp -include "$dsn\src\TestBench\control_unit_TB.vhd" 
asim +access +r TESTBENCH_FOR_control_unit 
wave 
wave -noreg CLK
wave -noreg ZR3
wave -noreg RESET
wave -noreg ZR2
wave -noreg ZR1
wave -noreg ZR0
wave -noreg ROUTIR
wave -noreg INC
wave -noreg CMD
wave -noreg BUS_Sel
wave -noreg S01
wave -noreg S00
wave -noreg S11
wave -noreg S10
wave -noreg LDIR
wave -noreg LDPC
wave -noreg RST
wave -noreg LD3
wave -noreg LD2
wave -noreg LD1
wave -noreg LD0
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\control_unit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_control_unit 
