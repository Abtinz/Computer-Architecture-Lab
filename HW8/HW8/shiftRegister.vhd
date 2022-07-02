----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:35:05 04/27/2022 
-- Design Name: 
-- Module Name:    shiftRegister - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shiftRegister is
    Port ( DataIn : in  STD_LOGIC;
           Selector : in  STD_LOGIC;
           P_in : in  STD_LOGIC_VECTOR (3 downto 0);
           Clk : in  STD_LOGIC;
           OutPut : out  STD_LOGIC);
end shiftRegister;

architecture structural of shiftRegister is

component DFLipFlop is
    Port ( d : in  STD_LOGIC;
           clock : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           q : out  STD_LOGIC);
end component DFLipFlop;

component multiplexer is
    Port ( DataIn : in  STD_LOGIC;
           P_in : in  STD_LOGIC;
           Selector : in  STD_LOGIC;
           Output : out  STD_LOGIC);
end component multiplexer;


signal DFFOutput :  STD_LOGIC_VECTOR(3 downto 0);
signal MuxOutput :  STD_LOGIC_VECTOR(3 downto 0);

begin 

multiplexer0 : multiplexer Port map( DataIn => DataIn , P_in => P_in(3) , Selector => Selector , Output =>  MuxOutput(0) );
dff_interface0 : DFLipFlop port map( d => MuxOutput(0) , clock => Clk , reset => '0' , q => DFFOutput(0));

multiplexer1 : multiplexer Port map( DataIn => DFFOutput(0) , P_in => P_in(2) , Selector => Selector , Output =>  MuxOutput(1) );
dff_interface1 : DFLipFlop port map( d => MuxOutput(1) , clock => Clk  , reset => '0' , q => DFFOutput(1));

multiplexer2 : multiplexer Port map( DataIn => DFFOutput(1) , P_in => P_in(1) , Selector => Selector , Output =>  MuxOutput(2) );
dff_interface2 : DFLipFlop port map( d => MuxOutput(2) , clock => Clk  , reset => '0' , q => DFFOutput(2));

multiplexer3 : multiplexer Port map( DataIn => DFFOutput(2) , P_in => P_in(0) , Selector => Selector , Output =>  MuxOutput(3) );
dff_interface3 : DFLipFlop port map( d => MuxOutput(3) , clock => Clk  , reset => '0' , q => Output);

end structural;

