library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity PrimeCheckerWithMux is
	port(A: in  std_logic_vector(3 downto 0);
		 Y:	out std_logic);
end entity PrimeCheckerWithMux;

architecture Struct of PrimeCheckerWithMux is
	signal I: std_logic_vector(7 downto 0);
begin
	I <= '0' & '1' & A(0) & A(0) & '0' & A(0) & A(0) & '0';
	MuX8by1_instance: MuX_8by1 port map (En => '1', I => I, S => A(3 downto 1), Y => Y);

end Struct; 