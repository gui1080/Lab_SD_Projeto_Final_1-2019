-- 8 bit Ripple-carry Adder
-- adder8.vhdl
Library ieee;
Use ieee.std_logic_1164.all;
Use work.fulladd_package.all;

Entity adder8 is
	port ( Cin		:	In	Std_logic;
		x7,x6,x5,x4	:	In	Std_logic;
		x3,x2,x1,x0	:	In	Std_logic;
		y7,y6,y5,y4	:	In	Std_logic;
		y3,y2,y1,y0	:	In	Std_logic;
		r7,r6,r5,r4	:	Out	Std_logic;
		r3,r2,r1,r0	:	Out	Std_logic;
		Cout		:	Out	Std_logic
	);
end adder8;

Architecture adder8_structure of adder8 is
	signal c1, c2, c3, c4	:		Std_logic;
	signal c5, c6, c7	:		Std_logic;
	component fulladd
	port (	Cin, x, y	:	In	Std_logic;
		s, Cout		:	Out	Std_logic
	);
	end component
begin
	stage0: fulladd port map (Cin, x0, y0, r0, c1);
	stage1: fulladd port map (c1, x1, y1, r1, c2);
	stage2: fulladd port map (c2, x2, y2, r2, c3);
	stage3: fulladd port map (c3, x3, y3, r3, c4);
	stage4: fulladd port map (c4, x4, y4, r4, c5);
	stage5: fulladd port map (c5, x5, y5, r5, c6);
	stage6: fulladd port map (c6, x6, y6, r6, c7);
	stage7: fulladd port map (c7, x7, y7, r7, Cout);

end Architecture;
