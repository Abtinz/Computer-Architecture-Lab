--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:44:19 02/24/2022
-- Design Name:   
-- Module Name:   C:/Users/ABTIN/Documents/amirkabir un/term 4/Computer Architecture/Lab/HW1/Part-1/firtsPart/half_adder_test_bench.vhd
-- Project Name:  firtsPart
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: half_adder
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
 
ENTITY half_adder_test_bench IS
END half_adder_test_bench;
 
ARCHITECTURE behavior OF half_adder_test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT half_adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         output1 : OUT  std_logic;
         output2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';

 	--Outputs
   signal output1 : std_logic;
   signal output2 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: half_adder PORT MAP (
          A => A,
          B => B,
          output1 => output1,
          output2 => output2
        );

   -- Clock process definitions
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

      -- insert stimulus here 

      A <= '0' , '1' after 100 ns ;
		B <= '0' , '1' after 150 ns ;
      wait;
   end process;

END;
