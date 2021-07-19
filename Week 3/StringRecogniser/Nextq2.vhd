library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Nextq2 is
port(q0, q1, q2, notq0, notq1, notq2, inp, notinp:  in std_logic;
	 q2next: 		   								out std_logic);
end entity Nextq2;

architecture struct of Nextq2 is
	signal C2 : std_logic_vector(2 downto 1);

begin

	Aq21: AND_2 port map (A => q1, B => inp, Y => C2(1)); -- C2(1) = q1 ∙ inp
	Aq22: AND_3 port map (A => q2, B => notq1, C => notinp, Y => C2(2)); -- C2(2) = q2 ∙ notq1 ∙ notinp
	
	O2: OR_2 port map (A => C2(1), B => C2(2), Y => q2next); -- Y = C2(1) + C2(2)

end struct;