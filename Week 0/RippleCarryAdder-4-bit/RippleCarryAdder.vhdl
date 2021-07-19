library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity RippleCarryAdder  is
  port(A, B: in  std_logic_vector(3 downto 0);
       S:	 out std_logic_vector(3 downto 0);
   	   Cout: out std_logic);
end entity RippleCarryAdder;

architecture Struct of RippleCarryAdder is
  signal C: std_logic_vector(2 downto 0);
begin

  FA1: FULL_ADDER port map (A => A(0), B => B(0), Cin => '0',  S => S(0), Cout => C(0));

  FA2: FULL_ADDER port map (A => A(1), B => B(1), Cin => C(0), S => S(1), Cout => C(1));
	 
  FA3: FULL_ADDER port map (A => A(2), B => B(2), Cin => C(1), S => S(2), Cout => C(2));

  FA4: FULL_ADDER port map (A => A(3), B => B(3), Cin => C(2), S => S(3), Cout => Cout);

end Struct; 