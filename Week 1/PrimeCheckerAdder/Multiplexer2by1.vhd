library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MUX_2by1  is
	port(En:in  std_logic;
		 I1,I2: in  std_logic;
		 S: in  std_logic;
		 Y:	out std_logic);
end entity MUX_2by1;

architecture Struct of MUX_2by1 is
	signal C: std_logic_vector(2 downto 1);
	signal NotS: std_logic;
begin

	Not1: INVERTER port map (A => S, Y => NotS); -- NotS = NOT S

	A1: AND_3 port map (A => NotS, B => I1, C => En, Y => C(1)); -- C(1) = NotS∙ I1∙ En
	A2: AND_3 port map (A => S, B => I2, C => En, Y => C(2)); -- C(2) = S∙ I2∙ En

	O4: OR_2 port map (A => C(1), B => C(2), Y => Y); -- Y = C(1) + C(2)

end Struct; 