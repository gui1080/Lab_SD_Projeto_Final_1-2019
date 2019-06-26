library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity opcodeDecoder is
    Port ( 
           deco_in : in STD_LOGIC_VECTOR (3 downto 0);
           deco_out : out STD_LOGIC_VECTOR (6 downto 0);
end opcodeDecoder;

architecture Behavioral of opcodeDecoder is

begin

  deco_out <= "0000000" when deco_in = '0000' else
              "0000001" when deco_in = '0001' else
              "0000000" when deco_in = '0010' else
              "0000010" when deco_in = '0011' else
              "0000001" when deco_in = '0100' else
              "0000001" when deco_in = '0101' else
              "0000010" when deco_in = '0110' else
              "0000010" when deco_in = '0111' else
              "0000001" when deco_in = '1000' else
              "0000010" when deco_in = '1001' else
              "0000001" when deco_in = '1010' else
              "1100010" when deco_in = '1011' else
              "0000010" when deco_in = '1100' else
              "0010110" when deco_in = '1101' else
              "0000001" when deco_in = '1110' else
              "1101010" when deco_in = '1111' else
        1111111;

end Behavioral;