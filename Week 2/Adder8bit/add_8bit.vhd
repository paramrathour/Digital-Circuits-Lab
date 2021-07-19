library ieee;
use ieee.std_logic_1164.all;
entity add_8bit is
	port (
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		sum: out std_logic_vector(7 downto 0);
		carry_out : out std_logic
		) ;
end add_8bit;

architecture Beh of add_8bit is
	begin
		add : process(A,B)
		variable sum_var : std_logic_vector(7 downto 0):= (others=>'0');
		variable carry_prop : std_logic_vector(8 downto 0):= (others=>'0');					-- Stores carry needed to propogate
		begin
			for i in 0 to 7 loop
				sum_var(i) := A(i) xor B(i) xor carry_prop(i);								-- Generate i th bit from LSB
				carry_prop(i+1) := (A(i) and B(i)) or (carry_prop(i) and (A(i) xor B(i)));	-- Generate i+1 th carry from LSB
			end loop;
			sum <= sum_var;																	-- Result
			carry_out <= carry_prop(8);														-- Output carry
end process ; -- add
end Beh ; -- Beh