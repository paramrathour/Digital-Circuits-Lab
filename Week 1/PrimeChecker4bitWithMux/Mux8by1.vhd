library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MUX_8by1  is
	port(En:in  std_logic;
			 I: in  std_logic_vector(7 downto 0);
			 S: in  std_logic_vector(2 downto 0);
			 Y:	out std_logic);
end entity MUX_8by1;

architecture Struct of MUX_8by1 is
	signal C: std_logic_vector(2 downto 1);
	signal InputToMuxc: std_logic_vector(3 downto 0);
	signal ControlToMuxc: std_logic_vector(1 downto 0);
begin

	MuX4by1a: MuX_4by1 port map (En => En, I => I(3 downto 0), S => S(1 downto 0), Y=> C(1));

	MuX4by1b: MuX_4by1 port map (En => En, I => I(7 downto 4), S => S(1 downto 0), Y=> C(2));

	InputToMuxc <= C(2) & "00" & C(1);
	ControlToMuxc <= S(2) & S(2);
	MuX4by1c: MuX_4by1 port map (En => En, I => InputToMuxc, S => ControlToMuxc, Y=> Y);

end Struct; 