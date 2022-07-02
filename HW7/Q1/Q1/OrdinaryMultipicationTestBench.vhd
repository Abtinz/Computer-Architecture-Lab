--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:47:42 04/26/2022
-- Design Name:   
-- Module Name:   C:/Users/ABTIN/Documents/amirkabir un/term 4/Computer Architecture/Lab/HW7/Q1/Q1/OrdinaryMultipicationTestBench.vhd
-- Project Name:  Q1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: OrdinaryMultiplier
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
 
ENTITY OrdinaryMultipicationTestBench IS
END OrdinaryMultipicationTestBench;
 
ARCHITECTURE behavior OF OrdinaryMultipicationTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OrdinaryMultiplier
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(4 downto 0);
         MultipactionResult : OUT  std_logic_vector(8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal MultipactionResult : std_logic_vector(8 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OrdinaryMultiplier PORT MAP (
          A => A,
          B => B,
          MultipactionResult => MultipactionResult
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      A <= "1111" ; B <= "11111" ; wait for 100 ns;
		A <= "1001" ; B <= "10101" ; wait for 100 ns;
		A <= "1111" ; B <= "10000" ; wait for 100 ns;
		A <= "1111" ; B <= "00001" ; wait for 100 ns;
		A <= "0111" ; B <= "11001" ; wait for 100 ns;
		A <= "1100" ; B <= "10011" ; wait for 100 ns;
		A <= "1011" ; B <= "10001" ; wait for 100 ns;
		
		
		
      

      -- insert stimulus here 

      wait;
   end process;

END;
