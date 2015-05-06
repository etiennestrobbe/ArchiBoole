library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all ;

ENTITY delay IS
port (
	i : in std_logic;
	clk: in std_logic;
	o : out std_logic
);
END delay;

ARCHITECTURE delay_a OF delay IS
BEGIN -- delay_a
	o <= not(clk) or i;
END delay_a;