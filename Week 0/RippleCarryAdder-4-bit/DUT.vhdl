-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the Ripple Carry Adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(7 downto 0);
       	output_vector: out std_logic_vector(4 downto 0));
end entity;

architecture DutWrap of DUT is
   component RippleCarryAdder is
   port(A, B: in  std_logic_vector(3 downto 0);
        S:  out std_logic_vector(3 downto 0);
        Cout: out std_logic);
   end component RippleCarryAdder;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: RippleCarryAdder 
			port map (
					                             -- order of inputs A3A2A1A0 B3B2B1B0
          A(3)  => input_vector(7),
          A(2)  => input_vector(6),
          A(1)  => input_vector(5),
          A(0)  => input_vector(4),
          B(3)  => input_vector(3),
          B(2)  => input_vector(2),
          B(1)  => input_vector(1),
					B(0)  => input_vector(0),

                                        -- order of outputs Cout S3S2S1S0
          S(3)  => output_vector(3),
          S(2)  => output_vector(2),
          S(1)  => output_vector(1),
          S(0)  => output_vector(0),
          Cout=> output_vector(4));

end DutWrap;