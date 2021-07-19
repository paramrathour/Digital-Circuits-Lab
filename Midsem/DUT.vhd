-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the Midsem Question

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(5 downto 0));
end entity;

architecture DutWrap of DUT is
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: MUX 
			port map (
					                             -- order of inputs A(3)A(2)A(1)A(0)B(3)B(2)B(1)B(0)
          A(3) => input_vector(7),
          A(2) => input_vector(6),
          A(1) => input_vector(5),
          A(0) => input_vector(4),
          B(3) => input_vector(3),
          B(2) => input_vector(2),
          B(1) => input_vector(1),
          B(0) => input_vector(0),
                                       -- order of output S(5)S(4)S(3)S(2)S(1)S(0)
          S(5) => output_vector(5),
          S(4) => output_vector(4),
          S(3) => output_vector(3),
          S(2) => output_vector(2),
          S(1) => output_vector(1),
          S(0) => output_vector(0));

end DutWrap;