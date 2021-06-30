-------------------------------------------------------------------------------
--
-- Title       : Normal_Register
-- Design      : Processor
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : Normal_Register.vhd
-- Generated   : Fri Jul 17 18:03:33 2020
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
--{entity {Normal_Register} architecture {Normal_Register}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Normal_Register is
	 port(
		 LD : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 RIN : in STD_LOGIC_VECTOR(5 downto 0);
		 ZR : out STD_LOGIC;
		 ROUT : out STD_LOGIC_VECTOR(5 downto 0)
	     );
end Normal_Register;

--}} End of automatically maintained section

architecture Normal_Register of Normal_Register is 
signal tempOut : STD_logic_vector(5 downto 0) := "000000";
begin
	process(CLK)
	begin
		if (rising_edge(CLK)) then
			if (LD = '1') then	 
				tempOut <= RIN;
			end if;
		end if;
	end process;

ZR <= '1' when tempOut = "000000" else '0';
ROUT <= tempOut;				

end Normal_Register;
