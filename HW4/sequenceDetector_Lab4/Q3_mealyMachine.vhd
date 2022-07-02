----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:58:01 03/18/2022 
-- Design Name: 
-- Module Name:    Q3_mealyMachine - Behavioral 
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

entity Q3_mealyMachine is port (
     clk,x:    in std_logic;
     z:        out std_logic);
end Q3_mealyMachine;              

architecture Behavioral of Q3_mealyMachine is
     type states is (a,b,c);
     signal state:  states := a;  -- initial value is a
     signal next_state:   states := a;  -- initial value
begin
clock:  process(clk)
          begin
            if clk'event and clk = '1' then
            state <= next_state;
            end if;
          end process clock;
state_trans:  process(state,x)   --reacts to changes in state and x
          begin
            next_state <= state;  --update next state
            case state is
               when a => if x = '1' then
                         z <= '1';
                         next_state <= b;
                    else
                         next_state <= a;
                         z <= '0';
                    end if;
               when b => if x = '1' then
                         next_state <= b;
                         z <= '1';
                    else
                         z <= '1';
                         next_state <= a;
                    end if;
               when c => if x = '1' then
                         next_state <= b;
                         z <= '0';
                    else
                         next_state <= a;
                         z <= '0';
                    end if;
end case;
end process state_trans;
end Behavioral;
