----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:16:46 02/23/2022 
-- Design Name: 
-- Module Name:    and_4_input - Behavioral 
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

entity and_4_input is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           D : in  STD_LOGIC;
           andOutput : out  STD_LOGIC);
end and_4_input;

architecture Behavioral of and_4_input is
component and_2_input is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : out  STD_LOGIC);
end component;
--signals
signal firstSignal , secondSignal : STD_LOGIC;
begin

instance0: and_2_input port map ( A => A , B => B , C => firstSignal);
instance1: and_2_input port map ( A => C , B => D , C => secondSignal);                                      
instance2: and_2_input port map ( A => firstSignal , B => secondSignal , C => andOutput);

end Behavioral;

