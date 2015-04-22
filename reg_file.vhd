library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity reg_file is
	port(	reg_src1 : in std_logic_vector(3 downto 0); --lecture 1
			reg_src2 : in std_logic_vector(3 downto 0); --lecture 2
			reg_dst : in std_logic_vector(3 downto 0);  --dest
			en_wr : in std_logic;	--autorisation ecriture
			clk: in std_logic;
			data_in : in std_logic_vector(15 downto 0); --in
			data_out1 : out std_logic_vector(15 downto 0); --out 1
			data_out2: out std_logic_vector(15 downto 0)); --out 2
end reg_file;

architecture reg_file_a of reg_file is
begin
	process(en_wr, reg_src1, reg_src2)
		type reg_array is array (15 downto 0) of std_logic_vector(15 downto 0);
		variable regs : reg_array;
	begin
		if(rising_edge(clk) and en_wr = '1') then -- clock: ecriture
			regs(to_integer(unsigned(reg_dst))) := data_in;	-- registre dest
		end if;
		data_out1 <= regs(to_integer(unsigned(reg_src1)));
		data_out2 <= regs(to_integer(unsigned(reg_src2)));
	end process;
end reg_file_a;
			
	