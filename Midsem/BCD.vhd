library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity BCDadjust is
	port(A: in  std_logic_vector(3 downto 0);
		 S:	buffer std_logic_vector(5 downto 0));
end entity BCDadjust;

architecture Struct of BCDadjust is
	signal check: std_logic;
	signal C: std_logic_vector(3 downto 0);
	signal adjust: std_logic_vector(5 downto 0);
begin

	CheckBCD: BCDChecker port map (A => A, S => check);

	C <= check & check & check & check;
	ANDall4bits: AND4bit port map (A => "0110", B => C, S => adjust); -- adjust = 0110 ∙ (check bit)

	Addition: RippleCarryAdder port map (A => A, B => adjust(3 downto 0), Cin => '0', S => S(3 downto 0), Cout=> S(4));
	S(5) <= '0';

end Struct;