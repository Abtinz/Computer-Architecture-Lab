library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VHDL_MEALY_FSM_Sequence_Detector is port (
     clk,x:    in std_logic;
     z:        out std_logic);
end VHDL_MEALY_FSM_Sequence_Detector;               -- detect a 1110 sequence

architecture Behavioral of VHDL_MEALY_FSM_Sequence_Detector is
     type states is (a,b,c,d,e);
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
                         z <= '0';
                         next_state <= b;
                    else
                         next_state <= a;
                         z <= '0';
                    end if;
               when b => if x = '1' then
                         next_state <= c;
                         z <= '0';
                    else
                         z <= '0';
                         next_state <= a;
                    end if;
               when c => if x = '1' then
                         next_state <= d;
                         z <= '0';
                    else
                         next_state <= a;
                         z <= '0';
                    end if;
               when d => if x = '0' then
                         next_state <= e;
                         z <= '0';
                    else
                         next_state <= b;
                         z <= '0';
                     end if;
               when e => if x = '0' then
                         next_state <= a;
                         z <= '1';
                    else 
                         next_state <= b;
                         z <= '1';        
                     end if;
end case;
end process state_trans;
end Behavioral;