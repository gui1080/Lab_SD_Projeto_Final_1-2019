library ieee;
use ieee.std_logic_1164.all;

entity flag_myca is

port(

  D0_F, D1_F, D2_F, D3_F, D4_F, D5_F, D6_F, D7_F: in STD_LOGIC_VECTOR;
  Sel_F: in STD_LOGIC_VECTOR(3 downto 0);
  S_M: out STD_LOGIC_VECTOR; 
  );

end flag_myca;

architecture logic of flag_myca is

begin
  S_M <= D0_F when Sel_F = "000" else
        D1_F when Sel_F = "001" else
        D2_F when Sel_F = "010" else
        D3_F when Sel_F = "011" else
        D4_F when Sel_F = "100" else
        D5_F when Sel_F = "101" else
        D6_F when Sel_F = "110" else
        D7_F when Sel_F = "111" else
        '0';

end logic;