library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_signed.all;
use ieee.numeric_std.all;

ENTITY alu IS
PORT (
	op1,op2 : IN Std_logic_vector(15 downto 0);
	code_op : IN Std_logic_vector(2 downto 0);
	data_out : OUT Std_logic_vector(15 downto 0)
);
END alu ;

ARCHITECTURE alu_a OF alu IS
BEGIN
	process(op1, op2, code_op)
		variable w : std_logic_vector(31 downto 0);
	begin
		case code_op is
			when "000" => data_out <= op1 + op2;
			when "001" => data_out <= op1 - op2;
			when "010" => data_out <= not(op1);
			when "011" => w := op1 * op2;
							  data_out <= std_logic_vector(to_signed(to_integer(signed(w)), 16));
			when "100"|"101"|"110"|"111" => data_out <= x"0000";
		end case;
	end process;
END alu_a;