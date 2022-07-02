Library ieee;
Use ieee.std_logic_1164.all;


Entity adder8 is
	port ( Cin	:	In	Std_logic;
		x,y	:	In	std_logic_vector (7 downto 0);
		r	:	Out	std_logic_vector (7 downto 0);	
		Cout	:	Out	Std_logic
);	
end adder8;

Architecture structural of adder8 is
component FullAdder
	Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
	
			  end component;
	signal c1, c2, c3, c4	:		Std_logic;
	signal c5, c6, c7	:		Std_logic;
	
begin
	stage0: FullAdder port map (a=>y(0), b=>x(0), cin=>Cin, sum=>r(0), cout=>c1);
	stage1: FullAdder port map (a=>y(1), b=>x(1), cin=>c1, sum=>r(1), cout=>c2);
	stage2: FullAdder port map (a=>y(2), b=>x(2), cin=>c2, sum=>r(2), cout=>c3);
	stage3: FullAdder port map (a=>y(3), b=>x(3), cin=>c3, sum=>r(3), cout=>c4);
	stage4: FullAdder port map (a=>y(4), b=>x(4), cin=>c4, sum=>r(4), cout=>c5);
	stage5: FullAdder port map (a=>y(5), b=>x(5), cin=>c5, sum=>r(5), cout=>c6);
	stage6: FullAdder port map (a=>y(6), b=>x(6), cin=>c6, sum=>r(6), cout=>c7);
	stage7: FullAdder port map (a=>y(7), b=>x(7), cin=>c7, sum=>r(7), cout=>Cout);
	
end structural;