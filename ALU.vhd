-------------------------------------------------------------------------------
--
-- Title       : ALU
-- Design      : Processor
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : ALU.vhd
-- Generated   : Fri Jul 17 23:29:43 2020
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
--{entity {ALU} architecture {ALU}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity ALU is
	 port(
		 CMD : in STD_LOGIC;
		 IN1 : in STD_LOGIC_VECTOR(5 downto 0);
		 IN2 : in STD_LOGIC_VECTOR(5 downto 0);
		 Result : out STD_LOGIC_VECTOR(5 downto 0);
		 DIDOVERFLOW : out STD_LOGIC
	     );
end ALU;

--}} End of automatically maintained section

architecture ALU of ALU is
begin

process(CMD, IN1, IN2)
variable TMP : std_logic_vector(11 downto 0);
begin
	if( CMD = '0')then
		Result <= std_logic_vector(unsigned(IN1) + unsigned(IN2));
	elsif(CMD='1') then
		Result <= std_logic_vector(unsigned(IN1) - unsigned(IN2)); 
	else 
		TMP := std_logic_vector(unsigned(IN1) * unsigned(IN2));   
		if (TMP(11 downto 6) > "000000") then
			DIDOVERFLOW<='1';
		else
			DIDOVERFLOW<='0';
		end if;
		Result <= TMP(5 downto 0);
	end if;
end process;	
end ALU;
