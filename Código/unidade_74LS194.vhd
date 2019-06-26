library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity unidade_74LS194 is
    port(
          d:	in	std_Logic_Vector ( 3 DOWNTO 0 );
          q:	out	std_Logic_Vector ( 3 DOWNTO 0 );
          s:	in	std_Logic_Vector ( 1 DOWNTO 0 );
          L:	in	std_Logic;
          R:	in	std_Logic;
          clk:	in	std_Logic;
          clr:	in	std_Logic);
end entity unidade_74LS194;

architecture logic of unidade_74LS194 is

  SIGNAL flw: std_Logic_Vector ( 3 DOWNTO 0 );

  procedure logic_pattern (
	signal ff0: in std_Logic;
	signal ff1: in std_Logic;
	signal ff2: in std_Logic;
	signal b: in std_Logic;
	signal s: in std_Logic_Vector ( 1 DOWNTO 0 );
	signal o: out std_Logic
        ) is
  begin
	o <= (
		( b and (not s(0)) and (not s(1)) ) OR
		( ff0 and (not s(0)) and s(1) ) OR
		( ff1 and s(0) and (not s(1)) ) OR
		( ff2 and s(0) and s(1) )
	);

  end procedure;

begin

  main: PROCESS ( d, s, R, L, clr, clk, flw)
  begin

	--flw <= "0000";

     If ( rising_edge(clk) ) then
			if(clr = '0') then
       flw <= "0000";

			else 
       logic_pattern ( R, flw(1), flw(0), d(0), s, flw(0) );
       logic_pattern ( flw(0), flw(2), flw(1), d(1), s, flw(1) );
       logic_pattern ( flw(1), flw(3), flw(2), d(2), s, flw(2) );
       logic_pattern ( flw(2), L, flw(3), d(3), s, flw(3) );
  end if;
  end if;

  end process; 
  q <= flw;

end architecture logic;