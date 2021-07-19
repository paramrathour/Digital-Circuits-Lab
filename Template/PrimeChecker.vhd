library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity PrimeChecker is
	port(A: in  std_logic_vector(3 downto 0);
		 Y:	out std_logic);
end entity PrimeChecker;

architecture Struct of PrimeChecker is
	signal C: std_logic_vector(4 downto 1);
	signal NotA: std_logic_vector(3 downto 0);
begin

	Not1: INVERTER port map (A => A(0), Y => NotA(0)); -- NotA(0) = NOT A(0)
	Not2: INVERTER port map (A => A(1), Y => NotA(1)); -- NotA(1) = NOT A(1)
	Not3: INVERTER port map (A => A(2), Y => NotA(2)); -- NotA(2) = NOT A(2)
	Not4: INVERTER port map (A => A(3), Y => NotA(3)); -- NotA(3) = NOT A(3)

	-- Output bit function is = A(2)∙ NotA(2)∙ A(0) + NotA(3)∙ A(2) ∙ A(0) + NotA(2) ∙ A(1)∙ A(0) + NotA(3) ∙ NotA(2) ∙ A(1)
	A1: AND_3 port map (A => A(2), B => NotA(1), C => A(0), Y => C(1)); -- C(1) = A(2)∙ NotA(2)∙ A(0)
	A2: AND_3 port map (A => NotA(3), B => A(2),    C => A(0), Y => C(2)); -- C(2) = NotA(3)∙ A(2)   ∙ A(0)
	A3: AND_3 port map (A => NotA(2),    B => A(1), C => A(0), Y => C(3)); -- C(3) = NotA(2)   ∙ A(1)∙ A(0)
	A4: AND_3 port map (A => NotA(3),    B => NotA(2),    C => A(1), Y => C(4)); -- C(4) = NotA(3)   ∙ NotA(2)   ∙ A(1)

	O4: OR_4 port map (A => C(1), B => C(2), C => C(3), D => C(4), Y => Y); -- Y = C(1) + C(2) + C(3) + C(4)

end Struct;