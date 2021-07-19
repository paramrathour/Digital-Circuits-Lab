library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity FULL_ADDER_3Bit  is
  port(A, B: in  std_logic_vector(2 downto 0);
       Cin: in std_logic;
       S:	 out std_logic_vector(3 downto 0));
end entity FULL_ADDER_3Bit;

architecture Struct of FULL_ADDER_3Bit is
  signal C: std_logic_vector(1 downto 0);
begin
                                                                            -- A2A1A0 + B2B1B0 = S3S2S1S0
  FA1: FULL_ADDER 
    port map (A => A(0), B => B(0), Cin => Cin,  S => S(0), Cout => C(0));  -- A0 + B0 = C0S0

  FA2: FULL_ADDER
	  port map (A => A(1), B => B(1), Cin => C(0),  S => S(1), Cout => C(1)); -- A1 + B1 + C0 = C1S1
	 
  FA3: FULL_ADDER
    port map (A => A(2), B => B(2), Cin => C(1),  S => S(2), Cout => S(3)); -- A2 + B2 + C1 = S2S3

end Struct; 