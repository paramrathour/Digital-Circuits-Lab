library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity seqDetector is
port(resetn, inp, clock : in std_logic;
		y : out std_logic);
end entity seqDetector;

architecture struct of seqDetector is

	signal q0, q1, q2, q0next, q1next, q2next, notq0, notq1, notq2, notinp : std_logic;

begin

	NotOfq0:  INVERTER port map (A => q0,  Y => notq0);  -- notq0  = NOT q0
	NotOfq1:  INVERTER port map (A => q1,  Y => notq1);  -- notq1  = NOT q1
	NotOfq2:  INVERTER port map (A => q2,  Y => notq2);  -- notq2  = NOT q2
	NotOfinp: INVERTER port map (A => inp, Y => notinp); -- notinp = NOT inp

	------------------ Combinational block L1 is the input to the FF0 ----------------

	L1: Nextq0 port map (q0, q1, q2, notq0, notq1, notq2, inp, notinp, q0next);

	-----------------------------	D Flip Flop 0	----------------------------------
	
	FF0: dFlipFlop port map (resetn => resetn, inp => q0next, clock => clock, y => q0);
	
	------------------ Combinational block L2 is the input to the FF1 ----------------
	
	L2: Nextq1 port map (q0, q1, q2, notq0, notq1, notq2, inp, notinp, q1next);
	
	-----------------------------	D Flip Flop 1	----------------------------------
	
	FF1: dFlipFlop port map (resetn => resetn, inp => q1next, clock => clock, y => q1);
	
	------------------ Combinational block L3 is the input to the FF2 ----------------
	
	L3: Nextq2 port map (q0, q1, q2, notq0, notq1, notq2, inp, notinp, q2next);
	
	-----------------------------	D Flip Flop 2	----------------------------------
	
	FF2: dFlipFlop port map (resetn => resetn, inp => q2next, clock => clock, y => q2);

	------------------ Combinational block L0 is the output of system ----------------

	L0: outputy port map (q0, q1, q2, notq0, notq1, notq2, inp, notinp, y);
	
end struct;