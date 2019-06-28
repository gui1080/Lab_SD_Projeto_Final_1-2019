library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity ROM is

port( 

addr : in std_logic_vector(7 downto 0);
d_out : out std_logic_vector(19 downto 0) );

end ROM;

architecture Behav of ROM is

type ROM_Array is array (0 to 9) of std_logic_vector(19 downto 0);

constant Content: ROM_Array := (

-- REFRI_DISPONIVEL <= Out_ROM(0); ---------- DP
-- RETURN_COIN <= Out_ROM(1); --------------- RN 
-- LOAD_CNT <= Out_ROM(2); ------------------ LD
-- SOMAR <= Out_ROM(3); --------------------- SU
-- DEC_TROCO <= Out_ROM(4); ----------------- DA
-- CLR_CONT <= Out_ROM(5); ------------------ CA

-- MOEDA_ACK -------------------------------- CP       ( 000 )  
-- not(MOEDA_ACK) --------------------------- not(CP)  ( 001 )
-- agtbout ---------------------------------- S > 30   ( 010 ) 
-- altbtout --------------------------------- S < 30   ( 011 )
-- aeqbout ---------------------------------- S = 30   ( 100 ) 
-- REFRI_RETIRADO --------------------------- PDR      ( 101 ) 
-- MOEDA_RETIRADA --------------------------- CR       ( 110 ) 
-- not(MOEDA_RETIRADA) ---------------------- not(CR)  ( 111 )

--A  
0 => "00000000000000001000", 
--B
1 => "00000100000000000100", 
--C
2 => "10001100000000000000", 
--D
3 => "10101000000110000000", 
--E
4 => "00010100000000000001", 
--F
5 => "01100000000000100000", 
--G
6 => "00011000000000000010", 
--H
7 => "01000000000000010000", 
--I
8 => "00011100000000000000",
--J
9 => "11010000000110000000",  
OTHERS => "11111111111111111111" 
);

begin

process(addr)

begin

Data_out <= Content(to_integer(addr));

end process;

end Behav;
