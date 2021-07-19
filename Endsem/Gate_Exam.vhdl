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

  component NAND_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component NAND_2;

  component OR_2 is
   port (A, B: in std_logic; Y: out std_logic);
  end component OR_2;

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

  component dFlipFlop is
	port(resetn, inp, clock : in std_logic;
			y : out std_logic);
   end component dFlipFlop;

   component seq is
  port(ud, resetn, clock : in std_logic;
      outp : out std_logic_vector(2 downto 0));
  end component seq;

  component MUX_2by1  is
    port(En:in  std_logic;
        I: in  std_logic_vector(1 downto 0);
        S: in  std_logic;
        Y:  out std_logic);
  end component MUX_2by1;

  component Nextq0 is
  port(q0, q1, q2, notq0, notq1, notq2, ud, notud, resetn:  in std_logic;
       resetState: in std_logic_vector(2 downto 0);
     q0next:                      out std_logic);
  end component Nextq0;

  component Nextq1 is
  port(q0, q1, q2, notq0, notq1, notq2, ud, notud, resetn:  in std_logic;
       resetState: in std_logic_vector(2 downto 0);
     q1next:                      out std_logic);
  end component Nextq1;

  component Nextq2 is
  port(q0, q1, q2, notq0, notq1, notq2, ud, notud, resetn:  in std_logic;
       resetState: in std_logic_vector(2 downto 0);
     q2next:                      out std_logic);
  end component Nextq2;
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

entity dFlipFlop is
port(resetn, inp, clock : in std_logic;
		y : out std_logic);
end entity dFlipFlop;

architecture struct of dFlipFlop is
begin

	process(clock)
	begin
		if (clock = '1' and clock' event) 
		then
			if resetn = '1' 
			then
				y <= '0';
			else
				y <= inp;
			end if;
		end if;
	end process;

end struct;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MUX_2by1  is
  port(En:in  std_logic;
      I: in  std_logic_vector(1 downto 0);
      S: in  std_logic;
      Y:  out std_logic);
end entity MUX_2by1;

architecture Struct of MUX_2by1 is
  signal C: std_logic_vector(2 downto 1);
  signal NotS: std_logic;
begin

  Not1: INVERTER port map (A => S, Y => NotS); -- NotS = NOT S

  A1: AND_3 port map (A => NotS, B => I(0), C => En, Y => C(1)); -- C(1) = NotS∙ I(0)∙ En
  A2: AND_3 port map (A => S, B => I(1), C => En, Y => C(2)); -- C(2) = S∙ I(1)∙ En

  O4: OR_2 port map (A => C(1), B => C(2), Y => Y); -- Y = C(1) + C(2)

end Struct; 