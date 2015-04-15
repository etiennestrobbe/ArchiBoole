library IEEE;
use IEEE.std_logic_1164.all;

entity mux4n is
	generic(N: natural := 16);
	port( data_in0, data_in1, data_in2, data_in3: in std_logic_vector(N-1 downto 0);
			sel: in std_logic_vector(1 downto 0);
			data_out: out std_logic_vector(N-1 downto 0));
end mux4n;

architecture mux4n_a of mux4n is
begin
	with SEL select
	data_out <= data_in0 when "00",
					data_in1 when "01",
					data_in2 when "10",
					data_in3 when "11";
end mux4n_a;
