
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_std.all; --for integer numbers
use ieee.std_logic_unsigned.all;

entity RAM16x8 is
port(
			CLK: in std_logic;
			readable: in std_logic;
			Write_Allowed : in std_logic;
			address: in std_logic_vector(3 downto 0);
			new_Data: in std_logic_vector(8 downto 0);
			ROM_OutPut: out std_logic_vector(8 downto 0));
			
end RAM16x8;

architecture Behavioral of RAM16x8 is
type memory is Array(0 to 15) of std_logic_vector(8 downto 0);
        
		   --first write in ram
			signal rom: memory:=("000000000",
										"000000001", 
										"000000010", 
										"000000011",
										"000000100",
										"000000101",
										"000000110",
										"000000111",
										"000001000",
										"000001001",
										"000001010",
										"000001011",
										"000001100",
										"000001101",
										"000001110",
										"000001111"
										);	
			signal index_of_location: integer range 0 to 15;
begin
			CMB: process(CLK)
			begin
					index_of_location <= to_integer(unsigned(address)); --convert binary address to integer index
					if(CLK'event and CLK = '1') then
						if (Write_Allowed = '1') then
						   rom(index_of_location) <= new_Data;    
						 end if;
					    if (readable = '1') then
							ROM_OutPut <= rom(index_of_location);
					end if;  
					end if;
 end process;
end Behavioral;
