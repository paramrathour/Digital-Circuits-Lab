library ieee;
use ieee.std_logic_1164.all;
use work.Gates.all;

entity DUT is
   port(input_vector: in std_logic_vector(2 downto 0);
       	output_vector: out std_logic_vector(2 downto 0));
end entity;

architecture DutWrap of DUT is

begin
   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   dut_instance: seq 
	port map (
		ud      => input_vector(2),
		resetn  => input_vector(1),
		clock   => input_vector(0),
		outp(2) => output_vector(2),
		outp(1) => output_vector(1),
		outp(0) => output_vector(0));
end DutWrap;