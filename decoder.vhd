library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity decoder is
	port( code_op: in std_logic_vector(3 downto 0);
			flagEQ: in std_logic;
			flagGT : in std_logic;
			Sel_addr_mux : out std_logic;
			code_alu : out std_logic_vector(2 downto 0);
			data_out_valid : out std_logic;
			rw : out std_logic;
			enw_reg_file : out std_logic;
			sel_alu_mux : out std_logic_vector(1 downto 0);
			sel_mem_mux : out std_logic;
			sel_mux_data : out std_logic;
			sel_mux_rs1 : out std_logic;
			data_in_ack : out std_logic;
			inc_decr : out std_logic);
end decoder;

architecture decodera of decoder is
begin
p1:process(code_op,flagEQ,flagGT)
	variable tmp : std_logic_vector(13 downto 0);
	begin		
		C1:case code_op is
			when "0000" => tmp := "10000110010110";
			when "0001" => tmp := "10010110010110";
			when "0010" => tmp := "10100110010110";
			when "0011" => tmp := "10110110010110";
			when "0100" => tmp := "00000000000000";
			when "0101" => tmp := "01000100010110";
			when "0110" => 
				if(flagEQ = '1') then tmp := "01000100010100";
				else tmp:= "11000100010100";
				end if;
			when "0111" => 
				if(flagGT = '1') then tmp := "01000100010100";
				else tmp := "11000100010100";
				end if;
			when "1000" => tmp := "11000111000110";
			when "1001" => tmp := "11000111010110";
			when "1010" => tmp := "11000000110110";
			when "1011" => tmp := "11000101010110";
			when "1100" => tmp := "11000110110110";
			when "1101" => tmp := "11001100110110";
			when "1110" => tmp := "11010110010110";
			when "1111" => tmp := "11000110111111";
		end case C1;
		sel_addr_mux <= tmp(13);
		code_alu <= tmp(12 downto 10);
		data_out_valid <= tmp(9);
		rw <= tmp(8);
		enw_reg_file <= tmp(7);
		sel_alu_mux <= tmp(6 downto 5);
		sel_mem_mux <= tmp(4);
		sel_mux_data <= tmp(3);
		inc_decr <= tmp(2);
		sel_mux_rs1 <= tmp(1);
		data_in_ack <= tmp(0);		
end process;
end decodera;
