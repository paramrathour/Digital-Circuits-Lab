library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity AND4bit is
	port(A,B: in  std_logic_vector(3 downto 0);
		 S:	out std_logic_vector(5 downto 0));
end entity AND4bit;

architecture Struct of AND4bit is
begin

	A1: AND_2 port map (A => A(0), B => B(0), Y => S(0)); -- S(0) = A(0)∙ B(0)
	A2: AND_2 port map (A => A(1), B => B(1), Y => S(1)); -- S(1) = A(1)∙ B(1)
	A3: AND_2 port map (A => A(2), B => B(2), Y => S(2)); -- S(2) = A(2)∙ B(2)
	A4: AND_2 port map (A => A(3), B => B(3), Y => S(3)); -- S(3) = A(3)∙ B(3)
	
	S(4) <= '0';
	S(5) <= '0';

end Struct;