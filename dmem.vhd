library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all ;

ENTITY dmem IS
port (
	adr : in Std_logic_vector(7 downto 0);
	r_w : Std_logic ;
	data_in : in Std_logic_vector(15 downto 0);
	data_out : out Std_logic_vector(15 downto 0)
);
END dmem;

ARCHITECTURE dmem_arc OF dmem IS
	TYPE liste_data IS array (0 to 63) of Std_logic_vector(15 downto 0);
BEGIN -- dmem_arc
	process(adr,r_w,data_in)
		VARIABLE mem_data : liste_data := ("0000000000000000",
		others => "0000000000000000");
		VARIABLE int_adr : integer;
	begin
		int_adr := Conv_Integer(adr);
		if (int_adr <= 63) then -- car le tableau déclaré a une dimension de 64
			IF (r_w = '1') THEN
				data_out <= mem_data(int_adr);
			elsif r_w ='0' then
				mem_data(int_adr) := data_in ;
				data_out <= mem_data(int_adr);
			END IF;
		end if;
	end process;
END dmem_arc;