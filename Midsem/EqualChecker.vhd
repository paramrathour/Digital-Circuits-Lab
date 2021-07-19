library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity EqualChecker is
	port(A,B: in  std_logic_vector(3 downto 0);
		 S:	out std_logic);
end entity EqualChecker;

architecture Struct of EqualChecker is
	signal C: std_logic_vector(4 downto 1);
	signal NotS: std_logic;
begin

	A1: XOR_2 port map (A => A(0), B => B(0), Y => C(1)); -- C(0) = A(0) XOR B(0)
	A2: XOR_2 port map (A => A(1), B => B(1), Y => C(2)); -- C(1) = A(1) XOR B(1)
	A3: XOR_2 port map (A => A(2), B => B(2), Y => C(3)); -- C(2) = A(2) XOR B(2)
	A4: XOR_2 port map (A => A(3), B => B(3), Y => C(4)); -- C(3) = A(3) XOR B(3)

	O4: OR_4 port map (A => C(1), B => C(2), C => C(3), D => C(4), Y => NotS); -- NotS = C(1) + C(2) + C(3) + C(4)

	NotOfS: INVERTER port map (A => NotS, Y => S); -- NotS = NOT S

end Struct;