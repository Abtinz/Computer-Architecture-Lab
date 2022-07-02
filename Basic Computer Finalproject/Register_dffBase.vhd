----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:21:49 06/03/2022 
-- Design Name: 
-- Module Name:    Register_dffBase - Behavioral 
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

entity Register_dffBase is
    Port ( d : in  STD_LOGIC_VECTOR (3 downto 0);
           Sin : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 downto 0));
end Register_dffBase;

architecture Behavioral of Register_dffBase is
signal Q_i : std_logic_vector(3 downto 0);
begin
Q <= Q_i;
FF1: DFF port map(Clock, Sin, Q_i(3));
FF2: DFF port map(Clock, Q_i(3), Q_i(2));
FF3: DFF port map(Clock, Q_i(2), Q_i(1));
FF4: DFF port map(Clock, Q_i(1), Q_i(0));

end Behavioral;

