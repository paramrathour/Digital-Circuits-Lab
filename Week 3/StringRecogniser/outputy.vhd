library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity outputy is
port(q0, q1, q2, notq0, notq1, notq2, inp, notinp:  in std_logic;
	 y: 		   									out std_logic);
end entity outputy;

architecture struct of outputy is
	signal Cy : std_logic_vector(2 downto 1);

begin

	AO1: AND_4 port map (A => q2, B => q1, C => notq0, D => inp, Y => Cy(1)); -- Cy(1) = q2 ∙ q1 ∙ notq0 ∙ inp
	AO2: AND_4 port map (A => q2, B => notq1, C => q0, D => notinp, Y => Cy(2)); -- Cy(2) = q2 ∙ notq1 ∙ q0 ∙ notinp
	
	Oy: OR_2 port map (A => Cy(1), B => Cy(2), Y => y); -- Y = Cy(1) + Cy(2)

end struct;