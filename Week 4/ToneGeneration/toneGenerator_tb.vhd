LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity toneGenerator_tb is
end entity toneGenerator_tb;

architecture bhv of toneGenerator_tb is
component toneGenerator is
port (toneOut : out std_logic;
	clk : in std_logic;
	LED : out std_logic_vector(7 downto 0);
	switch : in std_logic_vector(7 downto 0));
end component;

signal toneOut : std_logic := '0';
signal  clk: std_logic := '0';
signal switch, LED : std_logic_vector(7 downto 0) := (others => '0');
constant clk_period : time := 20 ns;
begin
	
	dut_instance: toneGenerator port map(toneOut, clk, LED, switch);
	clk <= not clk after clk_period/2 ;
	stim_proc: process
	begin
		for i in 0 to 7 loop	--This loop will run by making only 1 switch on at a time
			switch <= (i => '1', others => '0');
			wait for 5 ms;
		end loop;
	end process;
end bhv;
	
-- Run the testbench for 40 ms
