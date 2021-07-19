library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Eq is
	port(A,B: in  std_logic_vector(3 downto 0);
		 S:	out std_logic_vector(5 downto 0));
end entity Eq;

architecture Struct of Eq is
	signal check: std_logic;
	signal C: std_logic_vector(3 downto 0);
	signal NotA: std_logic_vector(3 downto 0);
begin

	CheckEqual: EqualChecker port map (A => A, B => B, S => check);

	C <= check & check & check & check;
	
	ANDall4bits: AND4bit port map (A => A, B => C, S => S); -- S(i) = A(i)∙ B(i)

end Struct;