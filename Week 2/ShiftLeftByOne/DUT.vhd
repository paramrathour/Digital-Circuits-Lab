-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the Left Shifter 1-bit.

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity DUT is
   port(input_vector: in std_logic_vector(8 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: ShiftLeftByOne 
			port map (
					                             -- order of inputs S X(7)X(6)X(5)X(4)X(3)X(2)X(1)X(0)
          S    => input_vector(8),
          X(7) => input_vector(7),
          X(6) => input_vector(6),
          X(5) => input_vector(5),
          X(4) => input_vector(4),
          X(3) => input_vector(3),
          X(2) => input_vector(2),
          X(1) => input_vector(1),
          X(0) => input_vector(0),
                                       -- order of output Y(7)Y(6)Y(5)Y(4)Y(3)Y(2)Y(1)Y(0)
          Y(7) => output_vector(7),
          Y(6) => output_vector(6),
          Y(5) => output_vector(5),
          Y(4) => output_vector(4),
          Y(3) => output_vector(3),
          Y(2) => output_vector(2),
          Y(1) => output_vector(1),
          Y(0) => output_vector(0));

end DutWrap;