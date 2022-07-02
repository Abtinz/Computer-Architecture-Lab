library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_std.all; --for integer numbers
use ieee.std_logic_unsigned.all;

entity ROM16x8 is
port(
			CLK: in std_logic;
			readable: in std_logic;
			address: in std_logic_vector(3 downto 0);
			ROM_OutPut: out std_logic_vector(7 downto 0));
			
end ROM16x8;
architecture Behavioral of ROM16x8 is
			type memory is Array(0 to 15) of std_logic_vector(7 downto 0);
			signal rom: memory:=("00000000",
										"00000001", 
										"00000010", 
										"00000011",
										"00000100",
										"00000101",
										"00000110",
										"00000111",
										"00001000",
										"00001001",
										"00001010",
										"00001011",
										"00001100",
										"00001101",
										"00001110",
										"00001111"
										);	
			signal index_of_location: integer range 0 to 15;
begin
			CMB: process(CLK)
			begin
					index_of_location <= to_integer(unsigned(address)); --convert binary address to integer index
					if(CLK'event and CLK = '1') then
					    if (readable = '1') then
					ROM_OutPut <= rom(index_of_location);
					end if;
					end if;
end process;
end Behavioral;