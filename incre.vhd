library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity incre is
	port(	ADRIN : in std_logic_vector (7 downto 0);
			ADROUT : out std_logic_vector (7 downto 0));
end incre;

architecture increa of incre is
	begin
		ADROUT <= std_logic_vector(to_unsigned(to_integer(unsigned(ADRIN)) + 1, 8));	
end increa;