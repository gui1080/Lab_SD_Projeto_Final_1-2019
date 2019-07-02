library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity unidade_updown is
    Port (
        updown  : in STD_LOGIC;
        clr : in STD_LOGIC;
        en  : in STD_LOGIC;
        clk : in STD_LOGIC;
        lkd : in STD_LOGIC;
        D   : in STD_LOGIC_VECTOR(7 downto 0);
        off : out STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR(7 downto 0)
        );
end unidade_updown;

architecture logic of unidade_updown is
	signal temp2 : STD_LOGIC_VECTOR (8 downto 0):="000000000";
     --esse temp2 era unsigned so que eu (gabriel moretto) mudei pra std logic pois com a mudança o código compila no eda
	signal temp_off: STD_LOGIC;
begin

off <= std_logic(temp2(8));

process(clk)
begin
if rising_edge(clk) then

if clr = '0' then
	temp2 <= "000000000";

elsif lkd = '1' then
	temp2 <= '0' & D;

elsif en = '1' and updown = '1' then
	temp2 <= temp2+1;

elsif en = '1' and updown = '0' then
	temp2 <= temp2-1;


end if;
end if;

Q <= std_logic_vector(temp2(7 downto 0));
end process;

end logic;
