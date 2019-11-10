library ieee;
use ieee.std_logic_1164.all;

entity TBkadai2 is
end TBkadai2;

architecture TESTBENCH of TBkadai2 is
	component kadai2 port (
		CLK, RSTN, STARN, STOPN : in std_logic; 
		LEDH, LEDL : out std_logic_vector(6 downto 0) );
	end component;
	
	signal TB_CLK, TB_RSTN, TB_STARN, TB_STOPN : std_logic;
	signal TB_LEDH, TB_LEDL : std_logic_vector(6 downto 0);
	constant CLK_CYCLE : time := 100 ns;
	
begin
	U1 : kadai2 port map (
		CLK => TB_CLK,
		RSTN => TB_RSTN,
		STARN => TB_STARN,
		STOPN => TB_STOPN,
		LEDH => TB_LEDH,
		LEDL => TB_LEDL );
	
	process begin
		TB_CLK <= '0'; wait for 50 ns;
		TB_CLK <= '1'; wait for 50 ns;
	end process;
	
	process begin
		TB_RSTN <= '0'; wait for 80 ns;
		TB_RSTN <= '1'; wait;
	end process;
	
	process begin
		TB_STARN <= '1'; TB_STOPN<='1'; wait for 250 ns;
		TB_STARN <= '0'; TB_STOPN<='1'; wait for 500 ns;
		TB_STARN <= '1'; TB_STOPN<='1'; wait for 1000 ns;
		TB_STARN <= '1'; TB_STOPN<='0'; wait for 500 ns;
		TB_STARN <= '0'; TB_STOPN<='1'; wait for 500 ns;
		TB_STARN <= '1'; TB_STOPN<='1'; wait;
	end process;
	
--	process begin
--		TB_CLK <= '0'; wait for CLK_CYCLE/2;
--		TB_CLK <= '1'; wait for CLK_CYCLE/2;
--	end process;
--	
--	process begin
--		TB_RSTN <= '0'; wait for CLK_CYCLE/4;
--		TB_RSTN <= '1'; wait;
--	end process;
--	
--	process begin
--		TB_STARN <= '1'; TB_STOPN<='1'; wait for CLK_CYCLE/2;
--												  wait for CLK_CYCLE*5;
--		TB_STARN <= '0'; TB_STOPN<='1'; wait for CLK_CYCLE*5;
--		TB_STARN <= '1'; TB_STOPN<='1'; wait for CLK_CYCLE*10;
--		TB_STARN <= '1'; TB_STOPN<='0'; wait for CLK_CYCLE*5;
--		TB_STARN <= '1'; TB_STOPN<='1'; wait;
--	end process;
end TESTBENCH;
	
configuration CFG_TBGATE of TBkadai2 is
	for TESTBENCH
		for U1: kadai2
		end for;
	end for;
end;
	
		