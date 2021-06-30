-------------------------------------------------------------------------------
--
-- Title       : Program_Counter
-- Design      : Processor
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : Program_Counter.vhd
-- Generated   : Fri Jul 17 18:05:43 2020
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
--{entity {Program_Counter} architecture {Program_Counter}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity Program_Counter is
	 port(
		 LD : in STD_LOGIC;
		 INC : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 CLR : in STD_LOGIC;
		 RIN : in STD_LOGIC_VECTOR(5 downto 0);
		 ROUT : out STD_LOGIC_VECTOR(5 downto 0)
	     );
end Program_Counter;

--}} End of automatically maintained section

architecture Program_Counter of Program_Counter is 
signal tempOut : STD_logic_vector(5 downto 0) := "000000";
begin	

	process(CLK, CLR)
	begin				  
		if (CLR = '1') then
			tempOut <= "000000";   
		end if;
		if (rising_edge(CLK)) then
			if (LD = '1') then	 
				tempOut <= RIN;
			end if;			
			if (INC = '1') then
				tempOut <= std_logic_vector(to_unsigned(to_integer(unsigned( tempOut )) + 1, 6));
			end if;
		end if;
	end process;   
	
	ROUT <= tempOut;

	 -- enter your statements here --

end Program_Counter;
