library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity FULL_ADDER_2Bit  is
  port(A, B: in  std_logic_vector(1 downto 0);
       Cin: in std_logic;
       S:	 out std_logic_vector(2 downto 0));
end entity FULL_ADDER_2Bit;

architecture Struct of FULL_ADDER_2Bit is
  signal C: std_logic;
begin
																		-- A1A0 + B1B0 = S2S1S0
  FA1: FULL_ADDER 
    port map (A => A(0), B => B(0), Cin => Cin,  S => S(0), Cout => C); -- A0 + B0 = CS0     

  FA2: FULL_ADDER
	port map (A => A(1), B => B(1), Cin => C,  S => S(1), Cout => S(2));-- A1 + B1 + C = S2S1
	 
end Struct; 