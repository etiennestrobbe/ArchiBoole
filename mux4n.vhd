library IEEE;
use IEEE.std_logic_1164.all;

-- 4 to 1 generic multiplexer
entity mux4n is
	generic(N: natural := 16); -- data width
	port( data_in0, data_in1, data_in2, data_in3: in std_logic_vector(N-1 downto 0); -- 4 input ports
			sel: in std_logic_vector(1 downto 0);	-- 2 bit selector (4 values for each input)
			data_out: out std_logic_vector(N-1 downto 0));	-- output
end mux4n;

architecture mux4n_a of mux4n is
begin
	with SEL select -- choose the relevant output
	data_out <= data_in0 when "00",
					data_in1 when "01",
					data_in2 when "10",
					data_in3 when "11";
end mux4n_a;