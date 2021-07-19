LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity music is
port (toneOut : out std_logic;
	clk_50, resetn : in std_logic;
	LED : out std_logic_vector(7 downto 0));
end entity music;

architecture fsm of music is

													-- Fill all the states
													-- Declare state types here
type state_type is (Silent,sa,re,ga,ma,ni);
													-- Declare all necessary signals here
signal y_present : state_type;
signal count : integer := 0;
signal noteInput : std_logic_vector(7 downto 0);
													-- Take the toneGenerator component
component toneGenerator is
	port (
	switch : in std_logic_vector(7 downto 0);
	clk : in std_logic;
	LED : out std_logic_vector(7 downto 0);
	toneOut : out std_logic);  						-- This pin will give your notes output
end component toneGenerator;

begin

	process(clk_50,resetn)							-- Fill sensitivity list
	variable y_next_var : state_type;
	variable n_count : integer := 0;
	variable timecounter : integer range 0 to 1E8 := 1;
	variable clock_music: std_logic := '0';
	
	begin
	
		y_next_var := y_present;
		n_count := count;

		case y_present is
			WHEN Silent => 							-- If the machine in Silent state
				if (resetn = '1') then
					y_next_var := Silent;
					noteInput <= "00000000";
				elsif (count = 0) then
					y_next_var := sa;
					noteInput <= "00000001";
					n_count  := count + 1;
				elsif (count = 33) then
						y_next_var := Silent;
						noteInput <= "00000000";
				else
					y_next_var := y_present;
				end if;

			WHEN sa =>								-- If the machine in Sa state
				if (resetn = '1') then
					y_next_var := Silent;
					noteInput <= "00000000";
				elsif ((count = 1) or (count = 5) or (count = 9)) then
					y_next_var := sa;
					noteInput <= "00000001";
					n_count  := count + 1;
				elsif ((count = 2) or (count = 6) or (count = 10)) then
					y_next_var := ga;
					noteInput <= "00000100";
					n_count  := count + 1;
				elsif ((count = 16) or (count = 31)) then
					y_next_var := ni;
					noteInput <= "01000000";
					n_count  := count + 1;
				else
					y_next_var := y_present;
					noteInput <= "00000001";
				end if;

			WHEN re =>								-- If the machine in Re state
				if (resetn = '1') then
					y_next_var := Silent;
					noteInput <= "00000000";
				elsif ((count = 19) or (count = 23) or (count = 27)) then
					y_next_var := re;
					noteInput <= "00000010";
					n_count  := count + 1;
				elsif ((count = 15) or (count = 30)) then
					y_next_var := sa;
					noteInput <= "00000001";
					n_count  := count + 1;
				elsif ((count = 20) or (count = 24)) then
					y_next_var := ni;
					noteInput <= "01000000";
					n_count  := count + 1;
				elsif (count = 28) then
					y_next_var := ga;						
					noteInput <= "00000100";
					n_count  := count + 1;
				else
					y_next_var := y_present;
					noteInput <= "00000010";
				end if;

			WHEN ga =>								-- If the machine in Ga state
				if (resetn = '1') then
					y_next_var := Silent;
					noteInput <= "00000000";
				elsif ((count = 3) or (count = 7) or (count = 11)) then
					y_next_var := ga;
					noteInput <= "00000100";
					n_count  := count + 1;
				elsif ((count = 4) or (count = 8)) then
					y_next_var := sa;
					noteInput <= "00000001";
					n_count  := count + 1;
				elsif ((count = 12)) then
					y_next_var := ma;						
					noteInput <= "00001000";
					n_count  := count + 1;
				elsif ((count = 14) or (count = 29)) then
					y_next_var := re;
					noteInput <= "00000010";	
					n_count  := count + 1;
				else
					y_next_var := y_present;
					noteInput <= "00000100";
				end if;

			WHEN ma =>								-- If the machine in Ma state
				if (resetn = '1') then
					y_next_var := Silent;
					noteInput <= "00000000";
				elsif (count = 13) then
					y_next_var := ga;
					noteInput <= "00000100";
					n_count  := count + 1;
				else
					y_next_var := y_present;
					noteInput <= "00001000";
				end if;

			WHEN ni =>								-- If the machine in Ni state
				if (resetn = '1') then
					y_next_var := Silent;
					noteInput <= "00000000";
				elsif ((count = 17) or (count = 21) or (count = 25)) then
					y_next_var := ni;
					noteInput <= "01000000";
					n_count  := count + 1;
				elsif ((count = 18) or (count = 22) or (count = 26)) then
					y_next_var := re;
					noteInput <= "00000010";
					n_count  := count + 1;
				elsif (count = 32) then
					y_next_var := Silent;						
					noteInput <= "00000000";
					n_count  := count + 1;
				else
					y_next_var := y_present;
					noteInput <= "01000000";
				end if;

			WHEN others =>
				y_next_var := Silent;
				noteInput <= "00000000";
				n_count  := 0;
				
		END CASE ;
	
													
		if (clk_50 = '1' and clk_50' event) then 	-- clk_50 is 0 to 1 (postive edge)
			if (resetn = '0') then					
				if timecounter = 6250000 then 		-- Generate 4Hz clock (0.25s time period) from 50MHz clock (clock_music)
					timecounter := 1;				-- When it reaches max count i.e. 6250000 (1/8 of a second) it will be 0 again 
					if (clock_music = '1') then
						y_present <= y_next_var;	-- State transition	
						count <= n_count;			-- Update count value
					end if;
					clock_music := not clock_music;	-- This variable will toggle clock_music
				else
					timecounter := timecounter + 1;	-- Counter will be incremented till it reaches max count
					
				end if;
			elsif (resetn = '1') then				-- If reset is 1 then output should be 0
				timecounter := 1;
				clock_music := '0';
				y_present <= Silent;
				count <= 0;	
			end if;
		end if;
		
	end process;
													-- Instantiate toneGenerator component
	comp: toneGenerator port map (switch => noteInput, clk => clk_50, LED => LED, toneOut => toneOut);
end fsm;