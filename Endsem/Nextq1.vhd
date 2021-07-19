library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Nextq1 is
port(q0, q1, q2, notq0, notq1, notq2, ud, notud, resetn:  in std_logic;
	resetState: in std_logic_vector(2 downto 0);
	 q1next: 		   								out std_logic);
end entity Nextq1;

architecture struct of Nextq1 is
	signal q1nextTemp : std_logic;
	signal muxInput1 : std_logic_vector(1 downto 0);
begin

	q1nextTemp <= (notq2 and notq1 and q0) or (q1 and q0 and ud) or (q1 and notq0 and notud) or (notq1 and q0 and notud) or (q2 and notq1 and notq0 and ud);
	
	muxInput1 <= resetState(1) & q1nextTemp;
	mux1: MUX_2by1 port map (En => '1', I => muxInput1, S => resetn, Y => q1next);

end struct;