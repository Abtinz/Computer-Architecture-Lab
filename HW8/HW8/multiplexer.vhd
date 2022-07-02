----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:37:48 04/27/2022 
-- Design Name: 
-- Module Name:    multiplexer - Behavioral 
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

entity multiplexer is
    Port ( DataIn : in  STD_LOGIC;
           P_in : in  STD_LOGIC;
           Selector : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end multiplexer;

architecture Behavioral of multiplexer is

begin

process(Selector)
begin 
   
    if Selector = '0' then
       Output <= DataIn ;

    else 		
        OutPut <= P_in ;
   
    end if;
 end process;


end Behavioral;

