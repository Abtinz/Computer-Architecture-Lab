----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:28:17 02/24/2022 
-- Design Name: 
-- Module Name:    Comparator - Behavioral 
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

entity Comparator is
    Port ( x : in  STD_LOGIC_VECTOR (1 downto 0);
           y : in  STD_LOGIC_VECTOR (1 downto 0);
           Less : out  STD_LOGIC);
end Comparator;

architecture structural of Comparator is
component MUX4to1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           z : out  STD_LOGIC);
end component;

signal S:STD_LOGIC;

begin
S <= ((not( x(0)))and(y(0)));
C1 : MUX4to1 port map (a=>S,b=>y(1),c=>y(1),d=>S,s0=>x(1),s1=>y(1),z=>Less);

end structural;

