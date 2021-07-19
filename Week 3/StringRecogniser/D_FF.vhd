-----------------------------D Flip Flop-------------------------
library ieee;
use ieee.std_logic_1164.all;

entity dFlipFlop is
port(resetn, inp, clock : in std_logic;
		y : out std_logic);
end entity dFlipFlop;

architecture struct of dFlipFlop is
begin

	process(clock)
	begin
		if (clock = '1' and clock' event) 
		then
			if resetn = '1' 
			then
				y <= '0';
			else
				y <= inp;
			end if;
		end if;
	end process;

end struct;