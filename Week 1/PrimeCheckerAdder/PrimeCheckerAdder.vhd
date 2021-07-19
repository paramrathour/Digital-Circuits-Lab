library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity PrimeCheckerAdder is
	port(A: in  std_logic_vector(3 downto 0);
		 B: in  std_logic_vector(3 downto 0);
		 O: out std_logic_vector(3 downto 0);
		 Cout, PrimeA, PrimeB: buffer std_logic);
end entity PrimeCheckerAdder;

architecture Struct of PrimeCheckerAdder is
	signal Cin, Co, En: std_logic;
	signal AopB: std_logic_vector(3 downto 0);
begin

	CheckA: PrimeChecker port map (A => A, Y => PrimeA); -- NotA(0) = NOT A(0)
	CheckB: PrimeChecker port map (A => B, Y => PrimeB); -- NotA(0) = NOT A(0)

	Carry: AND_2 port map (A => PrimeA, B => PrimeB, Y => Cin);

	-- This adder does both addition and subtraction based on carry
	Addition: RippleCarryAdder port map (A => A, B=> B, Cin=> Cin, S=> AopB, Cout=> Co);

	-- Below part is if both numbers are not prime then make all outputs 0
	Enable: OR_2 port map (A => PrimeA, B => PrimeB, Y => En);
	FinalOutput: MUX_2by1_4bit port map (En => '1', S => En, Cin => Co, I => "00000", J => AopB, Cout => Cout, Y => O);

end Struct; 