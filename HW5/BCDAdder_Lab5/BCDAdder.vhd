----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:02:36 04/17/2022 
-- Design Name: 
-- Module Name:    BCDAdder - Behavioral 
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

entity BCDAdder is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end BCDAdder;

architecture Behavioral of BCDAdder is
component FourBitRippleAdder is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR(3 downto 0) );
end component FourBitRippleAdder;
signal carryOut_Wire :  STD_LOGIC;
signal carryOut_Wire2 :  STD_LOGIC;
signal firstSum : STD_LOGIC_VECTOR(3 downto 0);
signal lastCarry : STD_LOGIC;
signal secondFourBitRippleAdder : STD_LOGIC_VECTOR(3 downto 0);
begin

FBR1 : FourBitRippleAdder port map(A=>A,B=>B,Cin=>Cin,Cout=>carryOut_Wire,Sum=>firstSum);
lastCarry <= (firstSum(3) and firstSum(2))or(firstSum(3) and firstSum(1))or(carryOut_Wire) ;
Cout <= lastCarry;
secondFourBitRippleAdder(0) <= '0';
secondFourBitRippleAdder(3) <= '0';
secondFourBitRippleAdder(2) <= lastCarry;
secondFourBitRippleAdder(1) <= lastCarry;
FBR2 : FourBitRippleAdder port map(A=>firstSum,B=>secondFourBitRippleAdder,Cin=>Cin,Cout=>carryOut_Wire2,Sum=>Sum);
end Behavioral;

