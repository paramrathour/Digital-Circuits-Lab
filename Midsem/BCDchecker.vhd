library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity BCDchecker is
	port(A: in  std_logic_vector(3 downto 0);
		 S:	out std_logic);
end entity BCDchecker;

architecture Struct of BCDchecker is
	signal C: std_logic_vector(2 downto 1);
begin

	-- Output bit function is = A(2)∙ NotA(2)∙ A(0) + NotA(3)∙ A(2) ∙ A(0) + NotA(2) ∙ A(1)∙ A(0) + NotA(3) ∙ NotA(2) ∙ A(1)
	A1: AND_2 port map (A => A(3), B => A(1), Y => C(1)); -- C(1) = A(3)∙ A(1)
	A2: AND_2 port map (A => A(3), B => A(2), Y => C(2)); -- C(2) = A(3)∙ A(2)

	O2: OR_2 port map (A => C(1), B => C(2), Y => S); -- S = C(1) + C(2)

end Struct;