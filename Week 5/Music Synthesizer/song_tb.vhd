library IEEE;
use IEEE.std_logic_1164.all;


entity song_tb is
end song_tb;


architecture testbench of song_tb is

signal	clk_50		: std_logic	:= '0';
signal	resetn 	: std_logic	:= '0';
signal	toneOut 	: std_logic	:= '0';
signal 	LED :std_logic_vector(7 downto 0) := (others => '0');

component music is
port (toneOut : out std_logic;
	clk_50, resetn : in std_logic;
	LED : out std_logic_vector(7 downto 0));
end component;

begin  -- testbench

-- instantiation of the device under test, mapping of signals
dut_instance: music port map ( toneOut, clk_50, resetn, LED);
 
-- generate a simulation clock  
clk_50 <= not clk_50 after 10 ns;

resetn <= '1', '0' after 30 ns;

end testbench;