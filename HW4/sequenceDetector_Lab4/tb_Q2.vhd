LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_Q2 IS
END tb_Q2;
 
ARCHITECTURE behavior OF tb_Q2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Q2_mooreSequenceDetector
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         sequence_in : IN  std_logic;
         detector_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal sequence_in : std_logic := '0';

 	--Outputs
   signal detector_out : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Q2_mooreSequenceDetector PORT MAP (
          clock => clock,
          reset => reset,
          sequence_in => sequence_in,
          detector_out => detector_out
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
    sequence_in <= '0';
  reset <= '1';
  -- Wait 100 ns for global reset to finish
  wait for 30 ns;
      reset <= '0';
  wait for 40 ns;
  sequence_in <= '1';
  wait for 10 ns;
  sequence_in <= '0';
  wait for 10 ns;
  sequence_in <= '1'; 
  wait for 20 ns;
  sequence_in <= '1'; 
  wait for 10 ns;
  sequence_in <= '1'; 
  wait for 10 ns;
  sequence_in <= '0';
wait for 10 ns;
  sequence_in <= '1';
wait for 10 ns;
  sequence_in <= '0';  
      -- insert stimulus here 
		wait;
   end process;
END;
