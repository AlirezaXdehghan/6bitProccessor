library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity instruction_register_tb is
end instruction_register_tb;

architecture TB_ARCHITECTURE of instruction_register_tb is
	-- Component declaration of the tested unit
	component instruction_register
	port(
		LD : in STD_LOGIC;
		CLK : in STD_LOGIC;
		RIN : in STD_LOGIC_VECTOR(5 downto 0);
		ROUT : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal LD : STD_LOGIC;
	signal CLK : STD_LOGIC;
	signal RIN : STD_LOGIC_VECTOR(5 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal ROUT : STD_LOGIC_VECTOR(5 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : instruction_register
		port map (
			LD => LD,
			CLK => CLK,
			RIN => RIN,
			ROUT => ROUT
		);

process
   begin
		CLK <= '0';
		wait for 5 ns;
		CLK <= '1';
		wait for 5 ns;
   end process;
 LD <= '1', '0' after 15ns, '1' after 35ns, '0' after 45 ns, '1' after 65 ns ;
 RIN <= "001100", "000000"after 25 ns, "110011" after 50 ns, "101010" after 75 ns ;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_instruction_register of instruction_register_tb is
	for TB_ARCHITECTURE
		for UUT : instruction_register
			use entity work.instruction_register(instruction_register);
		end for;
	end for;
end TESTBENCH_FOR_instruction_register;

