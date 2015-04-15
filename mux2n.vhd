library IEEE;
use IEEE.std_logic_1164.all;

entity mux2n is
	generic(N: natural := 16);
	port( data_in0, data_in1: in std_logic_vector(N-1 downto 0);
			data_out: out std_logic_vector(N-1 downto 0);
						sel: in std_logic);
end mux2n;

architecture mux2na of mux2n is
begin
	with SEL select
	data_out <= data_in0 when '0',
					data_in1 when '1';
end mux2na;
