library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MUX_2by1_4bit  is
	port(En, Cin, S: in  std_logic;
		 I: in std_logic_vector(4 downto 0);
		 J: in std_logic_vector(3 downto 0);
		 Cout: out  std_logic;
		 Y:	out std_logic_vector(3 downto 0));
end entity MUX_2by1_4bit;

architecture Struct of MUX_2by1_4bit is
begin

	FinalOutput0:     MUX_2by1 port map (En => En, I1 => I(0), I2 => J(0), S => S, Y => Y(0));
	FinalOutput1:     MUX_2by1 port map (En => En, I1 => I(1), I2 => J(1), S => S, Y => Y(1));
	FinalOutput2:     MUX_2by1 port map (En => En, I1 => I(2), I2 => J(2), S => S, Y => Y(2));
	FinalOutput3:     MUX_2by1 port map (En => En, I1 => I(3), I2 => J(3), S => S, Y => Y(3));
	FinalOutputCarry: MUX_2by1 port map (En => En, I1 => I(4), I2 => Cin,  S => S, Y => Cout);

end Struct; 