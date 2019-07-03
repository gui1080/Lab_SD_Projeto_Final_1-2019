library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoMoeda is
    Port ( COIN_IN : in STD_LOGIC_VECTOR (1 downto 0);
           DECOIN_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end decoMoeda;

architecture Behavioral of decoMoeda is

begin

with COIN_IN select DECOIN_OUT <=
    "0001" when "00",
    "0010" when "01",
    "0101" when "10",
    "1010" when "11",
    "0000" when others;

end Behavioral;
