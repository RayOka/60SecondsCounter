library ieee;
use ieee.std_logic_1164.all;

entity LEDDEC is
	port (
		DATA : in std_logic_vector(3 downto 0);
		LEDOUT : out std_logic_vector(6 downto 0)
	);
end LEDDEC;

architecture RTL of LEDDEC is
begin
	process (DATA) begin
		case DATA is
			when "0000" => LEDOUT <= "1000000";
			when "0001" => LEDOUT <= "1111001";
			when "0010" => LEDOUT <= "0100100";
			when "0011" => LEDOUT <= "0110000";
			when "0100" => LEDOUT <= "0011001";
			when "0101" => LEDOUT <= "0010010";
			when "0110" => LEDOUT <= "0000010";
			when "0111" => LEDOUT <= "1110000";
			when "1000" => LEDOUT <= "0000000";
			when "1001" => LEDOUT <= "0010000";
			when others => LEDOUT <= "0110110";
		end case;
	end process;
end RTL;
		