library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity control_unit_tb is
end control_unit_tb;

architecture TB_ARCHITECTURE of control_unit_tb is
	-- Component declaration of the tested unit
	component control_unit
	port(
		CLK : in STD_LOGIC;
		ZR3 : in STD_LOGIC;
		RESET : in STD_LOGIC;
		ZR2 : in STD_LOGIC;
		ZR1 : in STD_LOGIC;
		ZR0 : in STD_LOGIC;
		ROUTIR : in STD_LOGIC_VECTOR(5 downto 0);
		INC : out STD_LOGIC;
		CMD : out STD_LOGIC;
		BUS_Sel : out STD_LOGIC;
		S01 : out STD_LOGIC;
		S00 : out STD_LOGIC;
		S11 : out STD_LOGIC;
		S10 : out STD_LOGIC;
		LDIR : out STD_LOGIC;
		LDPC : out STD_LOGIC;
		RST : out STD_LOGIC;
		LD3 : out STD_LOGIC;
		LD2 : out STD_LOGIC;
		LD1 : out STD_LOGIC;
		LD0 : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal CLK : STD_LOGIC;
	signal ZR3 : STD_LOGIC;
	signal RESET : STD_LOGIC;
	signal ZR2 : STD_LOGIC;
	signal ZR1 : STD_LOGIC;
	signal ZR0 : STD_LOGIC;
	signal ROUTIR : STD_LOGIC_VECTOR(5 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal INC : STD_LOGIC;
	signal CMD : STD_LOGIC;
	signal BUS_Sel : STD_LOGIC;
	signal S01 : STD_LOGIC;
	signal S00 : STD_LOGIC;
	signal S11 : STD_LOGIC;
	signal S10 : STD_LOGIC;
	signal LDIR : STD_LOGIC;
	signal LDPC : STD_LOGIC;
	signal RST : STD_LOGIC;
	signal LD3 : STD_LOGIC;
	signal LD2 : STD_LOGIC;
	signal LD1 : STD_LOGIC;
	signal LD0 : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : control_unit
		port map (
			CLK => CLK,
			ZR3 => ZR3,
			RESET => RESET,
			ZR2 => ZR2,
			ZR1 => ZR1,
			ZR0 => ZR0,
			ROUTIR => ROUTIR,
			INC => INC,
			CMD => CMD,
			BUS_Sel => BUS_Sel,
			S01 => S01,
			S00 => S00,
			S11 => S11,
			S10 => S10,
			LDIR => LDIR,
			LDPC => LDPC,
			RST => RST,
			LD3 => LD3,
			LD2 => LD2,
			LD1 => LD1,
			LD0 => LD0
		);

process
   begin
		CLK <= '0';
		wait for 2ns;
		CLK <= '1';
		wait for 2ns;
   end process;
 
 RST<= '1' after 1 ns, '0' after 2 ns;
 ROUTIR <= "000011", "000100" after 30 ns, "010001" after 60 ns;
 --ZR0 <= not(ZR0) after 20 ns;
 --ZR1 <= not(ZR1) after 30 ns;
 --ZR2 <= not(ZR2) after 35 ns;
 --ZR3 <= not(ZR3) after 15 ns;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_control_unit of control_unit_tb is
	for TB_ARCHITECTURE
		for UUT : control_unit
			use entity work.control_unit(control_unit);
		end for;
	end for;
end TESTBENCH_FOR_control_unit;

