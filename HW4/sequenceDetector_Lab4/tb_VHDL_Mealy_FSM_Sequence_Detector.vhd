
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_VHDL_Mealy_FSM_Sequence_Detector IS
END tb_VHDL_Mealy_FSM_Sequence_Detector;
 
ARCHITECTURE behavior OF tb_VHDL_Mealy_FSM_Sequence_Detector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VHDL_MEALY_FSM_Sequence_Detector
    PORT(
         clk : IN  std_logic;
         x : IN  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal x : std_logic := '0';

 	--Outputs
   signal z : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VHDL_MEALY_FSM_Sequence_Detector PORT MAP (
          clk => clk,
          x => x,
          z => z
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
  x <= '0';
  -- Wait 100 ns for global reset to finish
  wait for 40 ns;
  x <= '1';
  wait for 10 ns;
  x <= '0';
  wait for 10 ns;
  x <= '1'; 
  wait for 20 ns;
  x <= '1'; 
  wait for 20 ns;
  x <= '1'; 
  wait for 20 ns;
  x <= '0'; 
      -- insert stimulus here 

      wait;
   end process;

END;
