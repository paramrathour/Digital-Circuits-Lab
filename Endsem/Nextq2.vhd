library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Nextq2 is
port(q0, q1, q2, notq0, notq1, notq2, ud, notud, resetn:  in std_logic;
	resetState: in std_logic_vector(2 downto 0);
	 q2next: 		   								out std_logic);
end entity Nextq2;

architecture struct of Nextq2 is
	signal q2nextTemp : std_logic;
	signal muxInput2 : std_logic_vector(1 downto 0);
begin

	q2nextTemp <= (notq2 and notq1 and notq0) or (notq2 and notq1 and notud) or (notq2 and notq0 and notud) or (q2 and notq0 and ud) or (q2 and q0 and notud);

	muxInput2 <= resetState(2) & q2nextTemp;
	mux2: MUX_2by1 port map (En => '1', I => muxInput2, S => resetn, Y => q2next);
end struct;