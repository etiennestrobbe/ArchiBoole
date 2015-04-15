library IEEE;
use IEEE.std_logic_1164.all;

entity bintohexa is
	port(	E : in std_logic_vector(3 downto 0);
			HEX : out std_logic_vector (0 to 6));
end bintohexa;

architecture bintohexaa of bintohexa is

begin
	with E select
	HEX <= "0000001" when x"0",
			 "1001111" when x"1",
			 "0010010" when x"2",
			 "0000110" when x"3",
			 "1001100" when x"4",
			 "0100100" when x"5",
			 "0100000" when x"6",
			 "0001111" when x"7",
			 "0000000" when x"8",
			 "0001100" when x"9",
			 "0001000" when x"a",
			 "1100000" when x"b",
			 "1110010" when x"c",
			 "1000010" when x"d",
			 "0110000" when x"e",
			 "0111000" when x"f";
end bintohexaa;
			
	