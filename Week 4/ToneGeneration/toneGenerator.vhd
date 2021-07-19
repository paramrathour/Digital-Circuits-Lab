library ieee;
use ieee.std_logic_1164.all;

entity toneGenerator is
	port (toneOut : out std_logic;  --this pin will give your notes output
	clk : in std_logic;
	LED : out std_logic_vector(7 downto 0);
	switch : in std_logic_vector(7 downto 0));
end entity toneGenerator;
 --------------------------- Architechture ----------------------------------
architecture behaviour of toneGenerator is
begin
	process(clk, switch)
						-- variables for count and output
	variable count_sa, count_re, count_ga, count_ma, count_pa, count_dha, count_ni, count_saa  : integer range 0 to 1E8 := 1;
	variable sa, re, ga, ma, pa, dha, ni, saa : std_logic := '1';
	begin
		if (clk = '1' and clk' event) then
			if (switch(0) = '1') then		-- Sa
				if (count_sa = 104167) then -- 240Hz
					count_sa := 1;
					sa := not sa;
				else
					count_sa := count_sa + 1;
				end if;
				toneOut <= sa;
				LED <= (0 => '1', others => '0');

			elsif (switch(1) = '1') then   -- Re
				if (count_re = 92593) then -- 270Hz
					count_re := 1;
					re := not re;
				else
					count_re := count_re + 1;
				end if;
				toneOut <= re;
				LED <= (1 => '1', others => '0');

			elsif (switch(2) = '1') then   -- Ga
				if (count_ga = 83333) then -- 300Hz
					count_ga := 1;
					ga := not ga;
				else
					count_ga := count_ga + 1;
				end if;
				toneOut <= ga;
				LED <= (2 => '1', others => '0');

			elsif (switch(3) = '1') then   -- Ma
				if (count_ma = 78125) then -- 320Hz
					count_ma := 1;
					ma := not ma;
				else
					count_ma := count_ma + 1;
				end if;
				toneOut <= ma;
				LED <= (3 => '1', others => '0');

			elsif (switch(4) = '1') then   -- Pa
				if (count_pa = 69444) then -- 360Hz
					count_pa := 1;
					pa := not pa;
				else
					count_pa := count_pa + 1;
				end if;
				toneOut <= pa;
				LED <= (4 => '1', others => '0');

			elsif (switch(5) = '1') then    -- Dha
				if (count_dha = 62500) then -- 400Hz
					count_dha := 1;
					dha := not dha;
				else
					count_dha := count_dha + 1;
				end if;
				toneOut <= dha;
				LED <= (5 => '1', others => '0');

			elsif (switch(6) = '1') then   -- Ni
				if (count_ni = 55556) then -- 450Hz
					count_ni := 1;
					ni := not ni;
				else
					count_ni := count_ni + 1;
				end if;
				toneOut <= ni;
				LED <= (6 => '1', others => '0');
			
			elsif (switch(7) = '1') then    -- Saa
				if (count_saa = 52083) then -- 480Hz
					count_saa := 1;
					saa := not saa;
				else
					count_saa := count_saa + 1;
				end if;
				toneOut <= saa;
				LED <= (7 => '1', others => '0');
			else							-- when no switch is pressed
				toneOut <= '0'; 			-- output 0 
				LED <= (others => '0');		-- all LED's are off 
			end if;
		end if;
	end process;
end behaviour;