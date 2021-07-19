library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MUX is
	port(A,B: in  std_logic_vector(3 downto 0);
		 S:	out std_logic_vector(5 downto 0));
end entity MUX;

architecture Struct of MUX is
	signal control: std_logic_vector(1 downto 0);
	signal I0,I1,I2,I3: std_logic_vector(5 downto 0);
	signal C0,C1,C2,C3,C4,C5: std_logic_vector(3 downto 0);

begin

	BCD: BCDadjust port map (A => A, S => I0);
	Multiplyby2: MUL port map (A => A, S => I1);
	ANDall4bits: AND4bit port map (A => A, B => B, S => I2);
	Equal: Eq port map (A => A, B => B, S => I3);
	
	control <= B(3) & B(2);
	C0 <= I3(0) & I2(0) & I1(0) & I0(0);
	Mux1: MUX_4by1 port map (En => '1', I => C0, S => control, Y => S(0));
	C1 <= I3(1) & I2(1) & I1(1) & I0(1);
	Mux2: MUX_4by1 port map (En => '1', I => C1, S => control, Y => S(1));
	C2 <= I3(2) & I2(2) & I1(2) & I0(2);
	Mux3: MUX_4by1 port map (En => '1', I => C2, S => control, Y => S(2));
	C3 <= I3(3) & I2(3) & I1(3) & I0(3);
	Mux4: MUX_4by1 port map (En => '1', I => C3, S => control, Y => S(3));
	C4 <= I3(4) & I2(4) & I1(4) & I0(4);
	Mux5: MUX_4by1 port map (En => '1', I => C4, S => control, Y => S(4));
	C5 <= I3(5) & I2(5) & I1(5) & I0(5);
	Mux6: MUX_4by1 port map (En => '1', I => C5, S => control, Y => S(5));


end Struct;