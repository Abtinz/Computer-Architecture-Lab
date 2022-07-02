library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

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

architecture structural of ALU_8bit is
component adder8 is
	port ( Cin	:	In	Std_logic; x,y	:	In	std_logic_vector (7 downto 0); r	:	Out	std_logic_vector (7 downto 0);	Cout	:	Out	Std_logic );	
end component;

signal ALU_Result : std_logic_vector (7 downto 0);
signal additionab : std_logic_vector (7 downto 0);
signal additiona1 : std_logic_vector (7 downto 0);
signal ca,ca1 : std_logic;
signal carryout_sig : std_logic:='0';
 
begin
addition1: adder8  port map (Cin=>'0', x=>A, y=>B, r=>additionab, Cout=>ca);
addition2: adder8  port map (Cin=>'0', x=>A, y=>"00000001", r=>additiona1, Cout=>ca1);
   process(A,B,ALU_Sel) is
 begin
  case(ALU_Sel) is
  when "000" =>
  ALU_Result <= additionab;
  carryout_sig <=ca;
  when "111" => -- Addition
  ALU_Result <= additionab;
  carryout_sig <=ca;
  when "001" => -- Logical or
   ALU_Result <= A or B;
  when "010" => -- Logical and 
   ALU_Result <= A and B;
  when "011" => -- Zero
   ALU_Result <= "00000000" ;
  when "100" => -- one bit addition
  ALU_Result <= additiona1;
  carryout_sig <= ca1;
  when "101" => -- Logical shift left
   ALU_Result <= std_logic_vector(unsigned(A) sll N);

  when others => ALU_Result <= A xor B ; 
  end case;
 end process;
 ALU_Out <= ALU_Result; -- ALU out
 Carryout <=carryout_sig;
end structural;