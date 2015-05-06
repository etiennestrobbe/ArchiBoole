library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pc is
	port( addr_in: in std_logic_vector (7 downto 0);
			addr_out: out std_logic_vector (7 downto 0);
			clk, reset: in std_logic);
end pc;

architecture pc_a of pc is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			 if reset = '1' then
				addr_out <= x"00";
			else
				addr_out <= addr_in;
			end if;
		end if;
	end process;
end pc_a;
