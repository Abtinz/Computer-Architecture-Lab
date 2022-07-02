--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:56:23 02/27/2022
-- Design Name:   
-- Module Name:   C:/Users/ABTIN/Documents/amirkabir un/term 4/Computer Architecture/Lab/HW2/Q3/section-1/section-1/decoder_test_bench.vhd
-- Project Name:  section-1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder
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
 
ENTITY decoder_test_bench IS
END decoder_test_bench;
 
ARCHITECTURE behavior OF decoder_test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder
    PORT(
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         decoder_output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';

 	--Outputs
   signal decoder_output : std_logic_vector(3 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder PORT MAP (
          S1 => S1,
          S2 => S2,
          decoder_output => decoder_output
        );

  
   -- Stimulus process
   stim_proc: process
   begin		
     
      wait;
   end process;

END;
