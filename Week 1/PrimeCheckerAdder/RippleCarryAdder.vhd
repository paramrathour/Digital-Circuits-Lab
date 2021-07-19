library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity RippleCarryAdder  is
  port(A, B: in  std_logic_vector(3 downto 0);
       Cin: in std_logic;
       S:	 out std_logic_vector(3 downto 0);
   	   Cout: out std_logic);
end entity RippleCarryAdder;

architecture Struct of RippleCarryAdder is
  signal BMod: std_logic_vector(3 downto 0);
  signal C: std_logic_vector(2 downto 0);
  signal Co: std_logic;
begin

	-- XOR to invert B
  XOR1: XOR_2 port map (A => B(0), B => Cin, Y => Bmod(0));

  XOR2: XOR_2 port map (A => B(1), B => Cin, Y => Bmod(1));

  XOR3: XOR_2 port map (A => B(2), B => Cin, Y => Bmod(2));

  XOR4: XOR_2 port map (A => B(3), B => Cin, Y => Bmod(3));

  FA1: FULL_ADDER port map (A => A(0), B => BMod(0), Cin => Cin,  S => S(0), Cout => C(0));

  FA2: FULL_ADDER port map (A => A(1), B => BMod(1), Cin => C(0), S => S(1), Cout => C(1));
	 
  FA3: FULL_ADDER port map (A => A(2), B => BMod(2), Cin => C(1), S => S(2), Cout => C(2));

  FA4: FULL_ADDER port map (A => A(3), B => BMod(3), Cin => C(2), S => S(3), Cout => Co);

  FinalCarry: XOR_2 port map (A => Co, B => Cin, Y => Cout);

end Struct; 