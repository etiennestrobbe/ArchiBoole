library IEEE;
use IEEE.std_logic_1164.all;

entity out_reg is
	generic(N: natural := 16);
	port( data_in: in std_logic_vector (N-1 downto 0);
			data_out_valid : in std_logic;
			data_out: out std_logic_vector (N-1 downto 0);
			clk: in std_logic);
end out_reg;

architecture out_rega of out_reg is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			if(data_out_valid = '1') then
				data_out <= data_in;
			end if;
		end if;
	end process;
end out_rega;
