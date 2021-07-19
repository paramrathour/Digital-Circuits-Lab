library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Nextq0 is
port(q0, q1, q2, notq0, notq1, notq2, ud, notud, resetn:  in std_logic;
	resetState: in std_logic_vector(2 downto 0);
	 q0next: 		   								out std_logic);
end entity Nextq0;

architecture struct of Nextq0 is
	signal q0nextTemp : std_logic;
	signal muxInput0: std_logic_vector(1 downto 0);
begin
	q0nextTemp <= (notq2 and notq0 and notud) or (q1 and notq0) or (q2 and notq0 and ud) or (notq2 and notq1 and q0 and ud) or (notq2 and q1 and notud);

	muxInput0 <= resetState(0) & q0nextTemp;
	mux0: MUX_2by1 port map (En => '1', I => muxInput0, S => resetn, Y => q0next);


end struct;