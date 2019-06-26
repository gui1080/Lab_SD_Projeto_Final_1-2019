library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity ROM is

port( 

addr : in std_logic_vector(3 downto 0);
d_out : out std_logic_vector(3 downto 0) );

end ROM;

architecture Behav of ROM is

type ROM_Array is array (0 to 9) of std_logic_vector(4 downto 0);

constant Content: ROM_Array := (

0 => "0000", 
1 => "0000", 
2 => "0000", 
3 => "0000", 
4 => "0001", 
5 => "1000", 
6 => "0100", 
7 => "0010", 
8 => "0000",
9 => "0000",  
OTHERS => "1111" 
);

begin

process(addr)

begin

Data_out <= Content(to_integer(addr));

end process;

end Behav;
