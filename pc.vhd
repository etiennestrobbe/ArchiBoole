library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pc is
	generic(N: natural := 16);
	port( addr_in: in std_logic_vector (N-1 downto 0);
			addr_out: out std_logic_vector (N-1 downto 0);
			clk, en: in std_logic);
end pc;

architecture pc_a of pc is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			 if en = '1' then
				addr_out <= std_logic_vector(to_unsigned(0, N));
			else
				addr_out <= addr_in;
			end if;
		end if;
	end process;
end pc_a;
