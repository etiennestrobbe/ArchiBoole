library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all ;
entity imem is
	port (
	iadr : in Std_logic_vector(7 downto 0);
	instr : out Std_logic_vector(15 downto 0)
	);
	end imem ;
ARCHITECTURE imem_arc OF imem IS
	TYPE liste_instr IS ARRAY (0 to 31) OF Std_logic_vector(15 downto 0);
	BEGIN -- imem_arc
		process(iadr)
			VARIABLE int_iadr : natural;
			VARIABLE mem_instr : liste_instr := (
				"0000000000001011", -- nop
				"0000000101011001", -- ldi r5,#1
				"0000001000001001", -- ldi r0,#2
				"0000010000011001", -- ldi r1,#4
				"0000000000001011", -- nop
				"0000000000001011", -- nop
				"0101000000000001", -- sub r0,r0,r5
				"0001000100001010", -- st r1,r1
				"0001010100010000", -- add r1,r5,r1
				"0001000000001101", -- out r1
				"0000000000001011", -- nop
				"0000111000000110", -- beq r0,14
				"0011000010000011", -- mul r3,r1,r0
				"0000010000000101", -- jmp 4
				"0000000000001011", -- nop
				"0000000100000101", -- jmp 1
				"0000000000001011", -- nop
				others => "0000000000001011" -- nop
				);
			begin
				int_iadr := Conv_Integer(iadr);
				if (int_iadr < 32 ) then
					instr <= mem_instr(int_iadr);
				end if ;
		end process;
END imem_arc;