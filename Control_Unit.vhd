-------------------------------------------------------------------------------
--
-- Title       : Control_Unit
-- Design      : Processor
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : Control_Unit.vhd
-- Generated   : Fri Jul 17 17:35:39 2020
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
--{entity {Control_Unit} architecture {Control_Unit}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Control_Unit is
	 port(
		 CLK : in STD_LOGIC;
		 ZR3 : in STD_LOGIC;
		 RESET : in STD_LOGIC:='0';
		 ZR2 : in STD_LOGIC;
		 ZR1 : in STD_LOGIC;
		 ZR0 : in STD_LOGIC;
		 ROUTIR : in STD_LOGIC_VECTOR(5 downto 0);
		 INC : out STD_LOGIC  :='0';
		 CMD : out STD_LOGIC;
		 BUS_Sel : out STD_LOGIC := '0';
		 S01 : out STD_LOGIC;
		 S00 : out STD_LOGIC;	
		 S11 : out STD_LOGIC;
		 S10 : out STD_LOGIC;
		 LDIR : out STD_LOGIC :='0';
		 LDPC : out STD_LOGIC :='0'; 
		 RST : out STD_LOGIC :='0';
		 LD3 : out STD_LOGIC :='0';
		 LD2 : out STD_LOGIC :='0';
		 LD1 : out STD_LOGIC :='0';
		 LD0 : out STD_LOGIC :='0'
	     );
end Control_Unit;

--}} End of automatically maintained section

architecture Control_Unit of Control_Unit is
TYPE My_FSM is (S0,S1,S2, S3, S4, S5, S6, S7, HLT,SZarb);	
Signal State: My_FSM :=S0;
Signal NS: My_FSM :=S0;
begin			
	
	process(CLK,RESET)
	begin
	   if(RESET = '1') then
			State <= S0;
			Bus_Sel <= '0';
			LDIR <='0';
			INC <= '0';
			LD0 <= '0'; LD1 <= '0'; LD2 <= '0'; LD3 <= '0';
	   elsif(rising_edge(clk)) then	 
		   State<=NS;  
		   end if;
		RST <= '0';
		Bus_Sel <= '0';
		LDIR <='0';
		LDPC <='0';
		INC <= '0';
		LD0 <= '0'; LD1 <= '0'; LD2 <= '0'; LD3 <= '0';
		   
		   Case State is 	   
			   When S0 =>	
			   		RST<='1';
			   		NS<=S1;	
					  			   
			   When S1 =>	
			   LDIR<='1'; 
			   -- INC<='1';
					NS<=HLT;		

			   When HLT =>	 	 
					INC<='1';
			   		if(ROUTIR = "000000") then
						   NS <= S2;
					elsif(ROUTIR = "000011") then
						NS <= SZarb;
					else
						if(ROUTIR(5 downto 4) = "00")then
							NS <= S3;
						elsif(ROUTIR(5 downto 4) = "01")then
							NS <= S4;
						elsif(ROUTIR(5 downto 4) = "10")then
							NS <= S5;
						elsif(ROUTIR(5 downto 4) = "11")then
							if (ROUTIR(3 downto 2) = "00") then
								if(ZR0 = '0') then
									NS <= S7;
								else
									NS <= S6;  
								end if;
							elsif (ROUTIR(3 downto 2) = "01") then 
								if(ZR1 = '0') then
									NS <= S7;
								else
									NS <= S6;  
								end if;
							elsif (ROUTIR(3 downto 2) = "10") then 
								if(ZR2 = '0') then
									NS <= S7;
								else
									NS <= S6;  
								end if;		
							elsif (ROUTIR(3 downto 2) = "11") then 
								if(ZR3 = '0') then
									NS <= S7;
								else
									NS <= S6;  
								end if;
							end if;
						end if;			
					end if;	
					   
			   When S2 =>	
			   		NS<=S2;	
					   
					   
			   When S3 =>
					if(ROUTIR(3 downto 2) = "00")then
						LD0 <= '1';
					elsif(ROUTIR(3 downto 2) = "01")then
						LD1 <= '1';
					elsif(ROUTIR(3 downto 2) = "10")then
						LD2 <= '1';
					else
						LD3 <= '1';
					end if;
					NS <= S1;
					INC<='1';
					   
			   When S4 =>	
					S10 <= ROUTIR(0);
					S11 <= ROUTIR(1);			   
			   		S00 <= ROUTIR(2);
					S01 <= ROUTIR(3);
					if(ROUTIR(3 downto 2) = "00")then
						LD0 <= '1';
					elsif(ROUTIR(3 downto 2) = "01")then
						LD1 <= '1';
					elsif(ROUTIR(3 downto 2) = "10")then
						LD2 <= '1';
					elsif(ROUTIR(3 downto 2) = "11")then
						LD3 <= '1';
					end if;
					CMD <= '0';
					Bus_Sel <= '1';
					NS <= S1;	
					   
					   
			   When S5 =>	
					S10 <= ROUTIR(0);
					S11 <= ROUTIR(1);			   
			   		S00 <= ROUTIR(2);
					S01 <= ROUTIR(3);
					if(ROUTIR(3 downto 2) = "00")then
						LD0 <= '1';
					elsif(ROUTIR(3 downto 2) = "01")then
						LD1 <= '1';
					elsif(ROUTIR(3 downto 2) = "10")then
						LD2 <= '1';
					elsif(ROUTIR(3 downto 2) = "11")then
						LD3 <= '1';
					end if;
					CMD <= '1';
					Bus_Sel <= '1';
					NS <= S1;	
					
			   When S7 =>	
					LDPC <= '1';
					NS <= S1;						
					
					
			   When S6 =>	
					INC <= '1';
					NS <= S1;
				
				When SZarb =>
					S10 <= '1';
					S11 <= '0';			   
			   		S00 <= '0';
					S01 <= '0';
					LD0 <= '1';
					CMD <= 'Z';
					Bus_Sel <= '1';
					NS <= S1;	
		   		  
	end case;
	 end process; 
end Control_Unit;
