-------------------------------------------------------------------------------
--
-- Title       : Memory
-- Design      : Processor
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : Memory.vhd
-- Generated   : Fri Jul 17 23:28:33 2020
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
--{entity {Memory} architecture {Memory}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.numeric_std.all;

entity Memory is
	 port(
		 Address : in STD_LOGIC_VECTOR(5 downto 0);
		 Data : out STD_LOGIC_VECTOR(5 downto 0)
	     );
end Memory;

--}} End of automatically maintained section

architecture Memory of Memory is  
TYPE ROM is array ( 63 downto 0) of std_logic_vector(5 downto 0);										  
	Signal mem : ROM;
	begin

mem(0) <= "000010" ;
mem(1) <= "000111" ;
mem(2) <= "000100" ;
mem(3) <= "001000" ;
mem(4) <= "001000" ;
mem(5) <= "000001" ;
mem(6) <= "001100" ;
mem(7) <= "000000" ;
mem(8) <= "110000" ;
mem(9) <= "001011" ;
mem(10) <= "000000" ;
mem(11) <= "100010" ;
mem(12) <= "011101" ;
mem(13) <= "110000" ;
mem(14) <= "001011" ;
		
		Data <= mem(to_integer(unsigned(Address)));
 		
end Memory;
