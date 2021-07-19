library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Nextq0 is
port(q0, q1, q2, notq0, notq1, notq2, inp, notinp:  in std_logic;
	 q0next: 		   								out std_logic);
end entity Nextq0;

architecture struct of Nextq0 is
	signal C0 : std_logic_vector(4 downto 1);

begin

	Aq01: AND_2 port map (A => q2, B => inp, Y => C0(1)); -- C0(1) = q2 ∙ inp
	Aq02: AND_2 port map (A => q0, B => inp, Y => C0(2)); -- C0(2) = q0 ∙ inp
	Aq03: AND_3 port map (A => notq2, B => notq1, C => inp, Y => C0(3)); -- C0(3) = notq2 ∙ notq1 ∙ inp
	Aq04: AND_3 port map (A => notq2, B => notq1, C => q0, Y => C0(4)); -- C0(4) = notq2 ∙ notq1 ∙ q0
	
	O0: OR_4 port map (A => C0(1), B => C0(2), C => C0(3), D => C0(4), Y => q0next); -- Y = C0(1) + C0(2) + C0(3) + C0(4)

end struct;