library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity seq is
port(ud, resetn, clock : in std_logic;
  	outp : out std_logic_vector(2 downto 0));
end entity seq;

architecture struct of seq is

	signal q0, q1, q2, q0next, q1next, q2next, notq0, notq1, notq2, notud : std_logic;
	signal q0nextTemp, q1nextTemp, q2nextTemp : std_logic;
	signal resetState : std_logic_vector(2 downto 0);
	signal muxInput0,muxInput1,muxInput2 : std_logic_vector(1 downto 0);

begin

	resetState <= "010";
	NotOfq0:  INVERTER port map (A => q0,  Y => notq0);  -- notq0  = NOT q0
	NotOfq1:  INVERTER port map (A => q1,  Y => notq1);  -- notq1  = NOT q1
	NotOfq2:  INVERTER port map (A => q2,  Y => notq2);  -- notq2  = NOT q2
	NotOfud: INVERTER port map (A => ud, Y => notud); -- notud = NOT ud

	------------------ Combinational block L1 is the input to the FF0 ----------------

	q0nextTemp <= (notq2 and notq0 and notud) or (q1 and notq0) or (q2 and notq0 and ud) or (notq2 and notq1 and q0 and ud) or (notq2 and q1 and notud);

	muxInput0 <= resetState(0) & q0nextTemp;
	mux0: MUX_2by1 port map (En => '1', I => muxInput0, S => resetn, Y => q0next);

	-----------------------------	D Flip Flop 0	----------------------------------
	
	FF0: dFlipFlop port map (resetn => resetn, inp => q0next, clock => clock, y => q0);
	
	------------------ Combinational block L2 is the input to the FF1 ----------------
	
	q1nextTemp <= (notq2 and notq1 and q0) or (q1 and q0 and ud) or (q1 and notq0 and notud) or (notq1 and q0 and notud) or (q2 and notq1 and notq0 and ud);
	
	muxInput1 <= resetState(1) & q1nextTemp;
	mux1: MUX_2by1 port map (En => '1', I => muxInput1, S => resetn, Y => q1next);
	
	-----------------------------	D Flip Flop 1	----------------------------------
	
	FF1: dFlipFlop port map (resetn => resetn, inp => q1next, clock => clock, y => q1);
	
	------------------ Combinational block L3 is the input to the FF2 ----------------
	
	q2nextTemp <= (notq2 and notq1 and notq0) or (notq2 and notq1 and notud) or (notq2 and notq0 and notud) or (q2 and notq0 and ud) or (q2 and q0 and notud);

	muxInput2 <= resetState(2) & q2nextTemp;
	mux2: MUX_2by1 port map (En => '1', I => muxInput2, S => resetn, Y => q2next);
	
	-----------------------------	D Flip Flop 2	----------------------------------
	
	FF2: dFlipFlop port map (resetn => resetn, inp => q2next, clock => clock, y => q2);

	------------------ Combinational block L0 is the output of system ----------------

	outp(0) <= q0next;
	outp(1) <= q1next;
	outp(2) <= q2next;
	
end struct;