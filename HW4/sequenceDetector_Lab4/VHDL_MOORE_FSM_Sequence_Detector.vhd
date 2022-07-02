library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VHDL_MOORE_FSM_Sequence_Detector is
port (
 clock: in std_logic; --- clock signal
 reset: in std_logic; -- reset input
 sequence_in: in std_logic; -- binary sequence input
 detector_out: out std_logic -- output of the VHDL sequence detector
);
end VHDL_MOORE_FSM_Sequence_Detector;

architecture Behavioral of VHDL_MOORE_FSM_Sequence_Detector is
type MOORE_FSM is (Zero, One, OneOne, OneOneOne, OneOneOneZero);
signal current_state, next_state: MOORE_FSM;

begin
-- Sequential memory of the VHDL MOORE FSM Sequence Detector
process(clock,reset)
begin
 if(reset='1') then
  current_state <= Zero;
 elsif(rising_edge(clock)) then
  current_state <= next_state;
 end if;
end process;
-- Next state logic of the VHDL MOORE FSM Sequence Detector
-- Combinational logic
process(current_state,sequence_in)
begin
 case(current_state) is
 when Zero =>
  if(sequence_in='1') then
   -- "1"
   next_state <= One;
  else
   next_state <= Zero;
  end if;
 when One =>
  if(sequence_in='1') then
   -- "11"
   next_state <= OneOne;
  else
   next_state <= Zero;
  end if;  
 when OneOne => 
  if(sequence_in='1') then
   -- "111"
   next_state <= OneOneOne;
  else
   next_state <= Zero;
  end if;  
 when OneOneOne =>
  if(sequence_in='0') then
   -- "1110"
   next_state <= OneOneOneZero;
  else
   next_state <= OneOneOne;
  end if; 
 when OneOneOneZero =>
  if(sequence_in='1') then
   next_state <= One;
  else
   next_state <= Zero;
  end if;
 end case;
end process;
-- Output logic of the VHDL MOORE FSM Sequence Detector
process(current_state)
begin 
 case current_state is
 when Zero =>
  detector_out <= '0';
 when One =>
  detector_out <= '0'; 
 when OneOne => 
  detector_out <= '0'; 
 when OneOneOne =>
  detector_out <= '0'; 
 when OneOneOneZero =>
  detector_out <= '1';
 end case;
end process;
end Behavioral;