library ieee;
use ieee.std_logic_1164.all;

entity MUX4_8 is

port(

  D0: in STD_LOGIC_VECTOR(7 downto 0);
  D1: in STD_LOGIC_VECTOR(7 downto 0);
  D2: in STD_LOGIC_VECTOR(7 downto 0);
  D3: in STD_LOGIC_VECTOR(7 downto 0);
  S1: in STD_LOGIC_VECTOR(1 downto 0);
  Y1: out STD_LOGIC_VECTOR(7 downto 0)
  );

end MUX4_8;

architecture MUX of MUX4_8 is

begin

  Y1 <= D0 when S1 = "00" else
        D1 when S1 = "01" else
        D2 when S1 = "10" else
        D3 when S1 = "11" else
        "00000000";
end MUX;
