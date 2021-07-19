library ieee;
use ieee.std_logic_1164.all;

package Gates is
  component INVERTER is
   port (A: in std_logic; Y: out std_logic);
  end component INVERTER;

  component AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component AND_2;

  component AND_3 is
   port (A, B, C: in std_logic; Y: out std_logic);
  end component AND_3;

  component AND_4 is
   port (A, B, C, D: in std_logic; Y: out std_logic);
  end component AND_4;

  component NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NAND_2;

  component OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component OR_2;

  component OR_3 is
   port (A, B, C: in std_logic; Y: out std_logic);
  end component OR_3;

  component OR_4 is
   port (A, B, C, D: in std_logic; Y: out std_logic);
  end component OR_4;

  component NOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NOR_2;

  component XOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XOR_2;

  component XNOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component XNOR_2;

  component HALF_ADDER is
   port (A, B: in std_logic; S, C: out std_logic);
  end component HALF_ADDER;

  component FULL_ADDER is
   port (A, B, Cin: in std_logic; S, Cout: out std_logic);
  end component FULL_ADDER;

  component FULL_ADDER_2Bit is
  port(A, B: in  std_logic_vector(1 downto 0);
       Cin: in std_logic;
       S:  out std_logic_vector(2 downto 0));
  end component FULL_ADDER_2Bit;

  component FULL_ADDER_3Bit is
  port(A, B: in  std_logic_vector(2 downto 0);
       Cin: in std_logic;
       S:  out std_logic_vector(3 downto 0));
  end component FULL_ADDER_3Bit;

  component MUX_4by1  is
  port(En:in  std_logic;
       I: in  std_logic_vector(3 downto 0);
       S: in  std_logic_vector(1 downto 0);
       Y: out std_logic);
  end component MUX_4by1;

  component MUX_8by1  is
    port(En:in  std_logic;
         I: in  std_logic_vector(7 downto 0);
         S: in  std_logic_vector(2 downto 0);
         Y: out std_logic);
  end component MUX_8by1;

  component PrimeCheckerWithMux is
  port(A: in  std_logic_vector(3 downto 0);
       Y: out std_logic);
  end component PrimeCheckerWithMux;

end package Gates;


library ieee;
use ieee.std_logic_1164.all;
entity INVERTER is
   port (A: in std_logic; Y: out std_logic);
end entity INVERTER;

architecture Equations of INVERTER is
begin
   Y <= not A;
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity AND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity AND_2;

architecture Equations of AND_2 is
begin
   Y <= A and B;
end Equations;

  
library ieee;
use ieee.std_logic_1164.all;
entity AND_3 is
   port (A, B, C: in std_logic; Y: out std_logic);
end entity AND_3;

architecture Equations of AND_3 is
begin
   Y <= A and B and C;
end Equations;


library ieee;
use ieee.std_logic_1164.all;
entity AND_4 is
   port (A, B, C, D: in std_logic; Y: out std_logic);
end entity AND_4;

architecture Equations of AND_4 is
begin
   Y <= A and B and C and D;
end Equations;


library ieee;
use ieee.std_logic_1164.all;
entity NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NAND_2;

architecture Equations of NAND_2 is
begin
   Y <= not (A and B);
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity OR_2;

architecture Equations of OR_2 is
begin
   Y <= A or B;
end Equations;

  
library ieee;
use ieee.std_logic_1164.all;
entity OR_3 is
   port (A, B, C: in std_logic; Y: out std_logic);
end entity OR_3;

architecture Equations of OR_3 is
begin
   Y <= A or B or C;
end Equations;


library ieee;
use ieee.std_logic_1164.all;
entity OR_4 is
   port (A, B, C, D: in std_logic; Y: out std_logic);
end entity OR_4;

architecture Equations of OR_4 is
begin
   Y <= A or B or C or D;
end Equations;


library ieee;
use ieee.std_logic_1164.all;
entity NOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity NOR_2;

architecture Equations of NOR_2 is
begin
   Y <= not (A or B);
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity XOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XOR_2;

architecture Equations of XOR_2 is
begin
   Y <= A xor B;
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity XNOR_2 is
   port (A, B: in std_logic; Y: out std_logic);
end entity XNOR_2;

architecture Equations of XNOR_2 is
begin
   Y <= not (A xor B);
end Equations;
  

library ieee;
use ieee.std_logic_1164.all;
entity HALF_ADDER is
   port (A, B: in std_logic; S, C: out std_logic);
end entity HALF_ADDER;

architecture Equations of HALF_ADDER is
begin
   S <= (A xor B);
   C <= (A and B);
end Equations;
 

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity FULL_ADDER is
   port (A, B, Cin: in std_logic; S, Cout: out std_logic);
end entity FULL_ADDER;

architecture Equations of FULL_ADDER is
  signal tC, tS, U, V: std_logic;
begin

  HA1: HALF_ADDER
    port map (A => A, B => B, S => tS, C => tC);

  HA2: HALF_ADDER
    port map (A => tS, B => Cin, S => S, C => V);      -- Final Sum S

  O1: OR_2
    port map (A => V, B => tC, Y => Cout);             -- Final Carry Cout

end Equations;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity FULL_ADDER_2Bit  is
  port(A, B: in  std_logic_vector(1 downto 0);
       Cin: in std_logic;
       S:  out std_logic_vector(2 downto 0));
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

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity FULL_ADDER_3Bit  is
  port(A, B: in  std_logic_vector(2 downto 0);
       Cin: in std_logic;
       S:  out std_logic_vector(3 downto 0));
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