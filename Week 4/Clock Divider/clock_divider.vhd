LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- clk_50 is 50 MHz input on board clock
--	We are generating 1 Hz clock

entity clock_divider is
port (clk_out : out std_logic;
		clk_50, resetn : in std_logic);
end entity clock_divider;

architecture bhv of clock_divider is
begin
	process(clk_50, resetn)
	
	-- timecounter will count no. of cycles for which output clock is either High or low
	variable timecounter : integer range 0 to 1E8 := 1;
	variable clk_c : std_logic := '1';
	begin
		if (clk_50 = '1' and clk_50' event) then
			if (resetn = '0') then
				if timecounter = 25E6 then -- The cycles in which clk is 1 or 0
					timecounter := 1;			-- When it reaches max count i.e. 25x10^6 (half a second) it will be 0 again 
					clk_c := not clk_c;		-- this variable will toggle
				else
					timecounter := timecounter + 1;	-- Counter will be incremented till it reaches max count
					
				end if;
			elsif resetn = '1' then
				timecounter := 1;
				clk_c := '0';
			end if;
		end if;
		clk_out <= clk_c;
	end process;
end bhv;