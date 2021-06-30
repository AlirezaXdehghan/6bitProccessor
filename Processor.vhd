-------------------------------------------------------------------------------
--
-- Title       : Processor
-- Design      : Processor
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : Processor.vhd
-- Generated   : Sun Jul 19 17:12:08 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Processor} architecture {Processor}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Processor is	
	PORT( clk , RESET :in std_logic
	);
end Processor;

--}} End of automatically maintained section

architecture Processor of Processor is	
signal BUSIN, Rout0, Rout1, Rout2, Rout3, Address, ROUTIR, MData, IN1, IN2, ALURes: std_logic_vector(5 downto 0):="000000";
signal LD0, LD1, LD2, LD3, LDPC, INC, RST, LDIR, CMD, DIDOVERFLOW ,S00, S01, S10, S11, ZR0, ZR1, ZR2, ZR3, Bus_sel: std_logic:='0';
begin

	
	R0 : Entity work.Normal_Register(Normal_Register)
	  	 port map( RIN => BUSIN,
					  ROUT => Rout0,
					  CLK => CLK,
					  ZR => ZR0,
					  LD => LD0); 

	R1 : Entity work.Normal_Register(Normal_Register)
	  	 port map( RIN => BUSIN,
					  ROUT => Rout1,
					  CLK => CLK,
					  ZR => ZR1,
					  LD => LD1); 
					  
	R2 : Entity work.Normal_Register(Normal_Register)
	  	 port map( RIN => BUSIN,
					  ROUT => Rout2,
					  CLK => CLK,
 					  ZR => ZR2,
					  LD => LD2); 					  
					  
	R3 : Entity work.Normal_Register(Normal_Register)
	  	 port map( RIN => BUSIN,
					  ROUT => Rout3,
					  CLK => CLK,
					  ZR => ZR3,
					  LD => LD3); 	
					  
	PC : Entity work.Program_Counter(Program_Counter)
		  port map( RIN => BUSIN,
					ROUT => Address,
					CLK => CLK,
					LD => LDPC,
					INC => INC,
					CLR => RST);	

	IR : Entity work.Instruction_Register(Instruction_Register)
 		  port map( RIN => BUSIN,
					Rout => ROUTIR,
					LD => LDIR,
					CLK => CLK);   
					
	Memory : Entity work.Memory(Memory)
   	      port map( Address => Address,
						 Data => MData);

	ALU : Entity work.ALU(ALU)
		port map( IN1 => IN1,
					 IN2 => IN2,
					 CMD => CMD,
					 DIDOVERFLOW => DIDOVERFLOW,
					 Result => ALURes);		
		
	ControlUnit : Entity work.Control_Unit(Control_Unit)
					 PORT MAP( ZR0 => ZR0, 
								  ZR1 => ZR1,
								  ZR2 => ZR2,
								  ZR3 => ZR3,
								  clk => clk,
								  RESET => RESET,
								  ROUTIR => ROUTIR,
								  LD0 => LD0,
								  LD1 => LD1,
								  LD2 => LD2,
								  LD3 => LD3,
								  LDPC => LDPC,
								  LDIR => LDIR,
								  S00 => S00,
								  S01 => S01,
								  S10 => S10,
								  S11 => S11,
								  Bus_Sel => Bus_Sel,
								  CMD => CMD,
								  INC => INC,
								  RST => RST);
								  
	Bus_selection : process( Bus_Sel, AluRes, MData )
					 begin
						if(Bus_Sel = '1')then
							BUSIN <= AluRes;
						else
							BUSIN <= MData;
						end if;
					 end process;	
					 
	ALU_input : IN1 <= Rout0 when (S01 = '0' and S00 = '0') else
						 Rout1 when (S01 = '0' and S00 = '1') else
						 Rout2 when (S01 = '1' and S00 = '0') else
						 Rout3 ;
						 
				IN2 <= Rout0 when (S11 = '0' and S10 = '0') else
						 Rout1 when (S11 = '0' and S10 = '1') else
						 Rout2 when (S11 = '1' and S10 = '0') else
						 Rout3 ;
					  
end Processor;
