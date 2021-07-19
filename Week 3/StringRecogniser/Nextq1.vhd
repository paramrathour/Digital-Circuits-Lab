library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity Nextq1 is
port(q0, q1, q2, notq0, notq1, notq2, inp, notinp:  in std_logic;
	 q1next: 		   								out std_logic);
end entity Nextq1;

architecture struct of Nextq1 is

begin

	q1next <= notinp;
	
end struct;