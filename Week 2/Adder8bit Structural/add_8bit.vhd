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
		variable carry_prop : std_logic_vector(8 downto 0):= (others=>'0');
		begin
			ADD_BLOCK:
			for i in 0 to 7 generate
				FA: FULL_ADDER port map (A(i), B(i), carry_prop(i), sum_var(i), carry_prop(i+1));
			end generate ADD_BLOCK;
			sum <= sum_var;
			carry_out <= carry_prop(8);
end process ; -- add
end Beh ; -- Beh