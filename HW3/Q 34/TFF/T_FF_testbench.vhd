--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:52:48 03/02/2022
-- Design Name:   
-- Module Name:   C:/Users/ABTIN/Documents/amirkabir un/term 4/Computer Architecture/Lab/HW3/Q 34/TFF/T_FF_testbench.vhd
-- Project Name:  TFF
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: T_FF
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY T_FF_testbench IS
END T_FF_testbench;
 
ARCHITECTURE behavior OF T_FF_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT T_FF
    PORT(
         T : IN  std_logic;
         Clock : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal T : std_logic := '0';
   signal Clock : std_logic := '0';

 	--Outputs
   signal Q : std_logic;

   -- Clock period definitions
   constant Clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: T_FF PORT MAP (
          T => T,
          Clock => Clock,
          Q => Q
        );

   -- Clock process definitions
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clock_period*10;
		T <= '1';
		
		wait for Clock_period*10;
		T <= '0';

      wait for Clock_period*10;
		T <= '1';

      wait for Clock_period*10;
		T <= '0';



      -- insert stimulus here 

      wait;
   end process;

END;
