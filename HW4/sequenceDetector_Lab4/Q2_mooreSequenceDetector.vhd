library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Q2_mooreSequenceDetector is
port (
 clock: in std_logic; --- clock signal
 reset: in std_logic; -- reset input
 sequence_in: in std_logic; -- binary sequence input
 detector_out: out std_logic -- output of the VHDL sequence detector
);
end Q2_mooreSequenceDetector;

architecture Behavioral of Q2_mooreSequenceDetector is
type MOORE_FSM is (Zero, One, OneZero, OneZeroOne, OneZeroOneZO);
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
  if(sequence_in='0') then
   -- "10"
   next_state <= OneZero;
  else
   next_state <= One;
  end if;  
 when OneZero => 
  if(sequence_in='1') then
   -- "101"
   next_state <= OneZeroOne;
  else
   next_state <= Zero;
  end if;  
 when OneZeroOne =>
  if(sequence_in='1') then
   -- "101..."
   next_state <= OneZeroOneZO;
  else
   next_state <= OneZeroOneZO;
  end if; 
 when OneZeroOneZO =>
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
 when OneZero => 
  detector_out <= '0'; 
 when OneZeroOne =>
  detector_out <= '0'; 
 when OneZeroOneZO =>
  detector_out <= '1';
 end case;
end process;
end Behavioral;