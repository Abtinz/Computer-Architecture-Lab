----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:54:14 02/24/2022 
-- Design Name: 
-- Module Name:    Xor_gate - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Xor_gate is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : out  STD_LOGIC);
end Xor_gate;

architecture structural of Xor_gate is
component NAND_GATE is

       Port ( A,B : in STD_LOGIC;

                Y : out STD_LOGIC);

end component;




signal S0,S1,S2:STD_LOGIC;
begin

U1:NAND_GATE PORT MAP(A=>A,B=>B,Y=>S0);

U2:NAND_GATE PORT MAP(A=>A,B=>S0,Y=>S1);

U3:NAND_GATE PORT MAP(A=>B,B=>S0,Y=>S2);

U4:NAND_GATE PORT MAP(A=>S1,B=>S2,Y=>C);

end structural;

