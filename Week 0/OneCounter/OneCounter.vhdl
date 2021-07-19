library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity OneCounter  is
  port(A:  in  std_logic_vector(7 downto 0);
       S:	 out std_logic_vector(3 downto 0));
end entity OneCounter;

architecture Struct of OneCounter is
  signal B1,B2,B3,B4: std_logic_vector(1 downto 0);
  signal C1,C2      : std_logic_vector(2 downto 0);
begin
          -- Goal is to calculate A0 + A1 + A2 + A3 + A4 + A5 + A6 + A7 = S3S2S1S0
          -- Calculate B1,B2,B3,B4 2 bit vectors as pairwise sum of all Ai (use FULL_ADDER)
          -- Calculate C1,C2 3 bit vectors as pairwise sum of all Bi (use FULL_ADDER_2bit)
          -- Calculate S 4 bit result as C1 + C2 (use FULL_ADDER_3bit)
  FA1: FULL_ADDER                                                             
    port map (A => A(1), B => A(0), Cin => '0',  S => B1(0), Cout => B1(1)); -- A1 + A0 = B11B10 = B1

  FA2: FULL_ADDER
	  port map (A => A(3), B => A(2), Cin => '0',  S => B2(0), Cout => B2(1)); -- A3 + A2 = B21B20 = B2 
	 
  FA3: FULL_ADDER
    port map (A => A(5), B => A(4), Cin => '0',  S => B3(0), Cout => B3(1)); -- A5 + A4 = B31B30 = B3

  FA4: FULL_ADDER
    port map (A => A(7), B => A(6), Cin => '0',  S => B4(0), Cout => B4(1)); -- A7 + A6 = B41B40 = B4

  F2A1: FULL_ADDER_2Bit
    port map (A => B1, B => B2, Cin => '0',  S => C1);                       -- B1 + B2 = C1 

  F2A2: FULL_ADDER_2Bit
    port map (A => B3, B => B4, Cin => '0',  S => C2);                       -- B3 + B4 = C2
   
  F3A: FULL_ADDER_3Bit
    port map (A => C1, B => C2, Cin => '0',  S => S);                        -- C1 + C2 = S


end Struct; 