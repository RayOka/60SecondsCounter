library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity kadai2 is
	port (
		CLK : in std_logic;
		RSTN : in std_logic;
		STARN : in std_logic;
		STOPN : in std_logic;
		LEDH : out std_logic_vector(6 downto 0);
		LEDL : out std_logic_vector(6 downto 0)
	);
end kadai2;
	
architecture RTL of kadai2 is
	signal TENABLE : std_logic;
	signal COUNTH, COUNTL : std_logic_vector(3 downto 0);
	signal L, H : std_logic_vector(6 downto 0);
	
	component CLKDOWN port (
		CLK : in std_logic;
		RSTN : in std_logic;
		STARTN : in std_logic;
		STOPN : in std_logic;
		ENABLE : out std_logic );
	end component;
	
	component COUNT10 port (
		CLK : in std_logic;
		RSTN : in std_logic;
		ENABLE : in std_logic;
		COUNT : out std_logic_vector(3 downto 0) );
	end component;
	
	component COUNT6 port (
		CLK : in std_logic;
		RSTN : in std_logic;
		ENABLE : in std_logic;
		CIN : in std_logic_vector(3 downto 0);
		COUNT : out std_logic_vector(3 downto 0) );
	end component;
	
	component LEDDEC port (
		DATA : in std_logic_vector(3 downto 0);
		LEDOUT : out std_logic_vector(6 downto 0) );
	end component;
	
begin
	U1 : CLKDOWN port map (
		CLK => CLK, RSTN => RSTN, STARTN => STARN, STOPN => STOPN, ENABLE => TENABLE
	);
	
	U2 : COUNT10 port map (
		CLK => CLK, RSTN => RSTN, ENABLE => TENABLE, COUNT => COUNTH
	);
	
	U3 : COUNT6 port map (
		CLK => CLK, RSTN => RSTN, ENABLE => TENABLE, CIN => COUNTH, COUNT => COUNTL
	);
	
	U4 : LEDDEC port map (
		DATA => COUNTH, LEDOUT => L
	);
	
	U5 : LEDDEC port map (
		DATA => COUNTL, LEDOUT => H
	);
	
	LEDL <= L;
	LEDH <= H;
	
end RTL;
	