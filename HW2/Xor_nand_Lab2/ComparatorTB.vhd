--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:43:48 02/25/2022
-- Design Name:   
-- Module Name:   C:/Users/ASUS.PIESC/OneDrive/Desktop/Programing/VHDL/Xor_nand_Lab2/ComparatorTB.vhd
-- Project Name:  Xor_nand_Lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Comparator
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
 
ENTITY ComparatorTB IS
END ComparatorTB;
 
ARCHITECTURE behavior OF ComparatorTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Comparator
    PORT(
         x : IN  std_logic_vector(1 downto 0);
         y : IN  std_logic_vector(1 downto 0);
         Less : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(1 downto 0) := (others => '0');
   signal y : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Less : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Comparator PORT MAP (
          x => x,
          y => y,
          Less => Less
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
      	

      --wait for <clock>_period*10;

      -- insert stimulus here 
		wait for 100 ns;
		x<="01";
		y<="01";
		
		wait for 100 ns;
		x<="10";
		y<="11";
      wait;
   end process;

END;
