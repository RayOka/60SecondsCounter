library ieee;
use ieee.std_logic_1164.all;
use ieee. std_logic_unsigned.all;

entity CLKDOWN is
	port (
		CLK : in std_logic;
		RSTN : in std_logic;
		STARTN : in std_logic;
		STOPN : in std_logic;
		ENABLE : out std_logic
	);
end CLKDOWN;
		
architecture RTL of CLKDOWN is
	signal COUNT : std_logic_vector(25 downto 0);
	signal STATUS: std_logic;
	constant MAXCOUNT : std_logic_vector(25 downto 0)
--				         := "10111110101111000010000000";
							:= "00000000000000000000000010";
	constant ZEROCOUNT : std_logic_vector(25 downto 0)
				          :="00000000000000000000000000";
							 
begin

	process (CLK, RSTN, STARTN, STOPN) begin
		if (RSTN = '0') then
			COUNT <= MAXCOUNT;
			ENABLE <= '0';
		elsif (CLK'event and CLK = '1') then
			if (STARTN = '0') then
				STATUS <= '1';
			elsif (STOPN = '0') then
				STATUS <= '0';
				ENABLE <= '0';
			end if;
			if (STATUS = '1') then
				if (ZEROCOUNT = COUNT) then
					COUNT <= MAXCOUNT;
					ENABLE <= '1';
				else
					COUNT <= COUNT - 1;
					ENABLE <= '0';
				end if;
			end if;
		end if;
	end process;
end RTL;
					