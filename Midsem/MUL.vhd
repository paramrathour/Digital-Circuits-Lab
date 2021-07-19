library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MUL is
	port(A: in  std_logic_vector(3 downto 0);
		 S:	out std_logic_vector(5 downto 0));
end entity MUL;

architecture Struct of MUL is
begin

	Addition: RippleCarryAdder port map (A => A, B => A, Cin => '0', S => S(3 downto 0), Cout => S(4));
	S(5) <= '0';

end Struct;