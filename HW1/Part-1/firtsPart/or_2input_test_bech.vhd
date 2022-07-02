--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:22:38 02/24/2022
-- Design Name:   
-- Module Name:   C:/Users/ABTIN/Documents/amirkabir un/term 4/Computer Architecture/Lab/HW1/Part-1/firtsPart/or_2input_test_bech.vhd
-- Project Name:  firtsPart
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: or_2_input
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
 
ENTITY or_2input_test_bech IS
END or_2input_test_bech;
 
ARCHITECTURE behavior OF or_2input_test_bech IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT or_2_input
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal C : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: or_2_input PORT MAP (
          A => A,
          B => B,
          C => C
        );

--   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--      wait for <clock>_period*10;

      A <= '0' , '1' after 100 ns ;
		B <= '0' , '1' after 150 ns ;
		A <= '1' , '0' after 150 ns ;
		B <= '0' , '1' after 200 ns ;
      -- insert stimulus here 

      wait;
   end process;

END;
