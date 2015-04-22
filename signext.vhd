library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity signext is
	generic(N: natural := 16);
	port( data_in: in std_logic_vector(7 downto 0);
			data_out: out std_logic_vector(15 downto 0));
end signext;

architecture signexta of signext is
begin
	data_out <= std_logic_vector(to_signed(to_integer(signed(data_in)),16));
end signexta;
