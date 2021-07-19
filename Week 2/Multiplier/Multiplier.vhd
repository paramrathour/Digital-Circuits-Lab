library ieee;
use ieee.std_logic_1164.all;

entity multiplier is
	generic(
		N : integer:=4; -- operand width
		NN : integer:=8 -- result width
		);
	port (
		A: in std_logic_vector(N-1 downto 0);
		B: in std_logic_vector(N-1 downto 0);
		M: out std_logic_vector((NN)-1 downto 0)
		) ;
end multiplier;

architecture beh of multiplier is

	-- Unbounded 1D X 1D array declaration
	type pp_type is array (natural range<>) of std_logic_vector(NN-1 downto 0);

	-- Adder function adds two 8-bit number.
	-- Usage: var := adder(X,Y) where var is a variable and X,Y are two 8-bit inputs to be added
	function adder(A: in std_logic_vector; B: in std_logic_vector)
		return std_logic_vector is
																	-- Variable declaration
		variable sum : std_logic_vector(NN downto 0):= (others=>'0');
		variable carry : std_logic_vector(NN downto 0):= (others=>'0');
		begin
																	-- Describing behaviour of adder
		for i in 0 to NN-1 loop
			sum(i) := A(i) xor B(i) xor carry(i);
			carry(i+1) := (A(i) and B(i)) or (carry(i) and (A(i) xor B(i)));
		end loop;
		sum(NN):=carry(NN);
		return sum;
	end adder;
	begin
		multiplier : process(A, B)
		-- Declaration of 1D X 1D array to store partial products
		variable pp : pp_type(0 to 3) := (others => (others =>'0'));

		-- Declaration of summation of partial product will give multiplication result which is stored in variable, result.
		variable result : std_logic_vector(NN downto 0):= (others=>'0'); -- Stores the final result (temp1 + temp2)

		-- Temporary array is required to avoid combinaitonal loop while adding partial product
		variable temp1 : std_logic_vector(NN downto 0):= (others=>'0'); -- Stores the result of pp0 + pp1
		variable temp2 : std_logic_vector(NN downto 0):= (others=>'0'); -- Stores the result of pp2 + pp3

		begin
																	-- Calculation of partial product
		for i in 0 to N-1 loop
			for j in i to i+N-1 loop
				pp(i)(j) := A(j-i) and B(i);						-- pp(i)(j) is A(j-i)B(i)
			end loop;
		end loop;
																	-- Summation of partial product
		temp1 := adder(pp(0),pp(1));								-- temp1 = pp0 + pp1
		temp2 := adder(pp(2),pp(3));								-- temp2 = pp2 + pp3
																	-- temp1,2 are 9 bit, only 8 LSB's are required (MSB is 0 (carry))
		result := adder(temp1(NN-1 downto 0),temp2(NN-1 downto 0)); -- result = temp1 + temp2 
		M <= result(NN-1 downto 0); 								-- Assignment of final result (again only 8 LSB's used)
	end process ; 													-- Multiplier
end beh ; 															-- Beh