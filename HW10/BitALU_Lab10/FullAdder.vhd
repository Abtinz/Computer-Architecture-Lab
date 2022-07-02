----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:22:04 02/23/2022 
-- Design Name: 
-- Module Name:    FullAdder - Behavioral 
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

entity FullAdder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end FullAdder;

architecture structural of FullAdder is

component HalfAdder is
Port ( A,B : in STD_LOGIC;
       C,D : out STD_LOGIC);
end component;

component Or2Input is
Port ( A,B: in STD_LOGIC;
         C: out STD_LOGIC);
end component;

SIGNAL S0,S1,S2:STD_LOGIC;

begin

U1:HalfAdder PORT MAP(A=>A,B=>B,C=>S0,D=>S1);
U2:HalfAdder PORT MAP(A=>S0,B=>C,C=>sum,D=>S2);
U3:Or2Input PORT MAP(A=>S2,B=>S1,C=>carry);

end structural;

