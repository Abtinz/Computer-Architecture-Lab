--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:27:19 03/02/2022
-- Design Name:   
-- Module Name:   C:/Users/ASUS.PIESC/OneDrive/Desktop/Programing/VHDL/FlipFlop_Lab3/d_TB.vhd
-- Project Name:  FlipFlop_Lab3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DFLipFlop
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
 
ENTITY d_TB IS
END d_TB;
 
ARCHITECTURE behavior OF d_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DFLipFlop
    PORT(
         d : IN  std_logic;
         clock : IN  std_logic;
         reset : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic := '0';
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DFLipFlop PORT MAP (
          d => d,
          clock => clock,
          reset => reset,
          q => q
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		d<='1';
      wait for clock_period*2;
		reset<='1';
		d<='1';
      wait for clock_period*2;
		reset<='1';
		d<='0';
      wait for clock_period*2;
		reset <='0';
		d<='1';
      wait for clock_period*2;
		reset <='0';
		d<='0';

      -- insert stimulus here 

      wait;
   end process;

END;
