-------------------------------------------------------------------------------
--
-- Title       : Instruction_Register
-- Design      : Processor
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : Instruction_Register.vhd
-- Generated   : Fri Jul 17 18:04:41 2020
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
--{entity {Instruction_Register} architecture {Instruction_Register}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Instruction_Register is
	 port(
		 LD : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RIN : in STD_LOGIC_VECTOR(5 downto 0);
		 ROUT : out STD_LOGIC_VECTOR(5 downto 0)
	     );
end Instruction_Register;

--}} End of automatically maintained section

architecture Instruction_Register of Instruction_Register is 
signal tempOut : STD_logic_vector(5 downto 0);
begin												  
	process(CLK)
	begin
		if (rising_edge(CLK)) then
			if (LD = '1') then	 
				tempOut <= RIN;
			end if;
		end if;
	end process;

ROUT <= tempOut;

	 -- enter your statements here --

end Instruction_Register;
