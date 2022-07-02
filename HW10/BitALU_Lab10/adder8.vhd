Library ieee;
Use ieee.std_logic_1164.all;


Entity adder8 is
	port ( Cin	:	In	Std_logic;
		x,y	:	In	std_logic_vector (7 downto 0);
		r	:	Out	std_logic_vector (7 downto 0);	
		Cout	:	Out	Std_logic
);	
end adder8;

Architecture Behavioral of adder8 is
component FullAdder
	Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);	
			  end component;
	signal c1, c2, c3, c4	:		Std_logic;
	signal c5, c6, c7	:		Std_logic;
	
begin
	stage0: FullAdder port map (a=>Cin, b=>x(0), c=>y(0), sum=>r(0), carry=>c1);
	stage1: FullAdder port map (a=>c1, b=>x(1), c=>y(1), sum=>r(1), carry=>c2);
	stage2: FullAdder port map (a=>c2, b=>x(2), c=>y(2), sum=>r(2), carry=>c3);
	stage3: FullAdder port map (a=>c3, b=>x(3), c=>y(3), sum=>r(3), carry=>c4);
	stage4: FullAdder port map (a=>c4, b=>x(4), c=>y(4), sum=>r(4), carry=>c5);
	stage5: FullAdder port map (a=>c5, b=>x(5), c=>y(5), sum=>r(5), carry=>c6);
	stage6: FullAdder port map (a=>c6, b=>x(6), c=>y(6), sum=>r(6), carry=>c7);
	stage7: FullAdder port map (a=>c7, b=>x(7), c=>y(7), sum=>r(7), carry=>Cout);
	
end Architecture;
