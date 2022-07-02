library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shiftRegister is
    Port ( DataIn : in  STD_LOGIC;
           Selector : in  STD_LOGIC;
           P_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Clk : in  STD_LOGIC;
           OutPut : out  STD_LOGIC_VECTOR (7 downto 0));
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


signal DFFOutput :  STD_LOGIC_VECTOR(7 downto 0);
signal MuxOutput :  STD_LOGIC_VECTOR(7 downto 0);

begin 

multiplexer0 : multiplexer Port map( DataIn => DataIn , P_in => P_in(0) , Selector => Selector , Output =>  MuxOutput(0) );
dff_interface0 : DFLipFlop port map( d => MuxOutput(0) , clock => Clk , reset => '0' , q => DFFOutput(0));

multiplexer1 : multiplexer Port map( DataIn => DFFOutput(0) , P_in => P_in(1) , Selector => Selector , Output =>  MuxOutput(1) );
dff_interface1 : DFLipFlop port map( d => MuxOutput(1) , clock => Clk  , reset => '0' , q => DFFOutput(1));

multiplexer2 : multiplexer Port map( DataIn => DFFOutput(1) , P_in => P_in(2) , Selector => Selector , Output =>  MuxOutput(2) );
dff_interface2 : DFLipFlop port map( d => MuxOutput(2) , clock => Clk  , reset => '0' , q => DFFOutput(2));

multiplexer3 : multiplexer Port map( DataIn => DFFOutput(2) , P_in => P_in(3) , Selector => Selector , Output =>  MuxOutput(3) );
dff_interface3 : DFLipFlop port map( d => MuxOutput(3) , clock => Clk  , reset => '0' , q => DFFOutput(3));

multiplexer4 : multiplexer Port map( DataIn => DFFOutput(3) , P_in => P_in(4) , Selector => Selector , Output =>  MuxOutput(4) );
dff_interface4 : DFLipFlop port map( d => MuxOutput(4) , clock => Clk , reset => '0' , q => DFFOutput(4));

multiplexer5 : multiplexer Port map( DataIn => DFFOutput(4) , P_in => P_in(5) , Selector => Selector , Output =>  MuxOutput(5) );
dff_interface5 : DFLipFlop port map( d => MuxOutput(5) , clock => Clk  , reset => '0' , q => DFFOutput(5));

multiplexer6 : multiplexer Port map( DataIn => DFFOutput(5) , P_in => P_in(6) , Selector => Selector , Output =>  MuxOutput(6) );
dff_interface6 : DFLipFlop port map( d => MuxOutput(6) , clock => Clk  , reset => '0' , q => DFFOutput(6));

multiplexer7 : multiplexer Port map( DataIn => DFFOutput(6) , P_in => P_in(7) , Selector => Selector , Output =>  MuxOutput(7) );
dff_interface7 : DFLipFlop port map( d => MuxOutput(7) , clock => Clk  , reset => '0' , q => DFFOutput(7));

OutPut <= DFFOutput;

end structural;

