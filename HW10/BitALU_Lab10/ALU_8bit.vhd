----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:09:12 05/19/2022 
-- Design Name: 
-- Module Name:    ALU_8bit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_8bit is
generic ( 
     constant N: natural := 1  -- number of shited or rotated bits
    );
  
    Port (
    A, B     : in  STD_LOGIC_VECTOR(7 downto 0);  -- 2 inputs 8-bit
    ALU_Sel  : in  STD_LOGIC_VECTOR(2 downto 0);  -- 1 input 4-bit for selecting function
    ALU_Out   : out  STD_LOGIC_VECTOR(7 downto 0); -- 1 output 8-bit 
    Carryout : out std_logic        -- Carryout flag
    );
end ALU_8bit;

architecture Behavioral of ALU_8bit is
component adder8 is
	port ( Cin	:	In	Std_logic;
		x,y	:	In	std_logic_vector (7 downto 0);
		r	:	Out	std_logic_vector (7 downto 0);	
		Cout	:	Out	Std_logic
);	
end component;

signal ALU_Result : std_logic_vector (7 downto 0);
signal tmp: std_logic_vector (8 downto 0);
signal additionab : std_logic_vector (7 downto 0);
signal additiona1 : std_logic_vector (7 downto 0);
signal ca,ca1 : std_logic;
 
begin
addition1: adder8  port map (Cin=>'1', x=>A, y=>B, r=>additionab, Cout=>ca);
addition2: adder8  port map (Cin=>'1', x=>A, y=>"00000001", r=>additiona1, Cout=>ca1);
   process(A,B,ALU_Sel)
 begin
  case(ALU_Sel) is
  when "000" => -- Addition
  ALU_Result <= additionab;
  when "001" => -- Logical or
   ALU_Result <= A or B;
  when "010" => -- Logical and 
   ALU_Result <= A and B;
  when "011" => -- Zero
   ALU_Result <= "00000000" ;
  when "100" => -- one bit addition
  ALU_Result <= additiona1;
  when "101" => -- Logical shift left
   ALU_Result <= std_logic_vector(unsigned(A) sll N);

  when others => ALU_Result <= A + B ; 
  end case;
 end process;
 ALU_Out <= ALU_Result; -- ALU out
 tmp <= ('0' & A) + ('0' & B);
 Carryout <= tmp(8) or (ca or ca1); -- Carryout flag
end Behavioral;

