library IEEE;
use IEEE.std_logic_1164.all;

entity regn is
	generic(N: natural := 16);
	port( data_in: in std_logic_vector (N-1 downto 0);
			data_out: out std_logic_vector (N-1 downto 0);
			clk: in std_logic);
end regn;

architecture regn_a of regn is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			 data_out <= data_in;
		end if;
	end process;
end regn_a;
