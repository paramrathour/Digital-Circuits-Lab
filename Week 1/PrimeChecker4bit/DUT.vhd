-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the Ripple Carry Adder.

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity DUT is
   port(input_vector: in std_logic_vector(3 downto 0);
       	output_vector: out std_logic_vector(0 downto 0));
end entity;

architecture DutWrap of DUT is
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: PrimeChecker 
			port map (
					                             -- order of inputs EnS(1)S(2)I(1)I(2)I(3)I(4)
          A(3) => input_vector(3),
          A(2) => input_vector(2),
          A(1) => input_vector(1),
          A(0) => input_vector(0),
                                       -- order of output Y
          Y    => output_vector(0));

end DutWrap;