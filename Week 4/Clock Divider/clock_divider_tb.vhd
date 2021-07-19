LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity clock_divider_tb is
end entity clock_divider_tb;

architecture bhv of clock_divider_tb is
component clock_divider is
port (clk_out : out std_logic;
		clk_50, resetn : in std_logic);
end component clock_divider;

signal resetn : std_logic := '0';
signal clk_50, clk_out : std_logic := '1';
constant clk_period : time := 20 ns;
begin
	
	dut_instance: clock_divider port map(clk_out, clk_50, resetn);
	clk_50 <= not clk_50 after clk_period/2 ;
	resetn <= '0', '1' after 1200 ms;
end bhv;
	

