library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity COUNT6 is
	port (
		CLK : in std_logic;
		RSTN : in std_logic;
		ENABLE : in std_logic;
		CIN : in std_logic_vector(3 downto 0);
		COUNT : out std_logic_vector(3 downto 0) );
end COUNT6;
	
architecture RTL of COUNT6 is
	signal COUNT_IN : std_logic_vector(3 downto 0);
begin
	COUNT <= COUNT_IN;
	process (CLK, RSTN, ENABLE) begin
		if (RSTN = '0') then
			COUNT_IN <= "0000";
		elsif (CLK'event and CLK = '1') then
			if (ENABLE = '1' and CIN = "1001") then
				if (COUNT_IN = "0101") then
					COUNT_IN <= "0000";
				else
					COUNT_IN <= COUNT_IN + 1;
				end if;
			end if;
		end if;
	end process;
end RTL;