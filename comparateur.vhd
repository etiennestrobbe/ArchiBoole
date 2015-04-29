library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparateur is
	port(	data_in : in std_logic_vector(15 downto 0);
			flagGT : out std_logic;
			flagEQ : out std_logic);
end comparateur;

architecture comparateur_a of comparateur is

begin
	flagGT <= '1' when (to_integer(signed(data_in)) > 0) else '0';
	flagEQ <= '1' when (to_integer(signed(data_in)) = 0) else '0';
end comparateur_a;
			
	