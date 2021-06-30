library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity alu_tb is
end alu_tb;

architecture TB_ARCHITECTURE of alu_tb is
	-- Component declaration of the tested unit
	component alu
	port(
		CMD : in STD_LOGIC;
		IN1 : in STD_LOGIC_VECTOR(5 downto 0);
		IN2 : in STD_LOGIC_VECTOR(5 downto 0);
		Result : out STD_LOGIC_VECTOR(5 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CMD : STD_LOGIC;
	signal IN1 : STD_LOGIC_VECTOR(5 downto 0);
	signal IN2 : STD_LOGIC_VECTOR(5 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal Result : STD_LOGIC_VECTOR(5 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu
		port map (
			CMD => CMD,
			IN1 => IN1,
			IN2 => IN2,
			Result => Result
		);

	CMD <= '0' , '1' after 20 ns;
	IN1 <= "000111", "000101" after 10 ns,  "010100" after 20 ns, "100001" after 30 ns, "100100" after 40 ns;
	IN2 <=  "000110", "000101" after 15 ns,  "000100" after 25 ns, "001001" after 35 ns, "000101" after 45 ns;
 

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu of alu_tb is
	for TB_ARCHITECTURE
		for UUT : alu
			use entity work.alu(alu);
		end for;
	end for;
end TESTBENCH_FOR_alu;

