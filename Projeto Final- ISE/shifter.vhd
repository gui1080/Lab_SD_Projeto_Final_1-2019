library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity shifter is
    Port ( SHIFTINPUT : in  STD_LOGIC_VECTOR(7 downto 0);
    L, R: in STD_LOGIC;
    SHIFT_Ctrl : in  STD_LOGIC_VECTOR(1 downto 0);
    SHIFTOUT: out  STD_LOGIC_VECTOR(7 downto 0);
    clk:	in	std_Logic;
    clr:	in	std_Logic
  );
end shifter;

architecture Behavioral of shifter is

begin

  process(SHIFTINPUT,SHIFT_Ctrl, clk, clr)
    begin
    if(clk = '0') then
      case(SHIFT_Ctrl) is
        when "00" => SHIFTOUT <= SHIFTINPUT(7 downto 0); -- HOLD
        when "01" => SHIFTOUT <= L&SHIFTINPUT(6 downto 0);-- Shift Left
        when "10" => SHIFTOUT <= SHIFTINPUT(7 downto 1)&R; -- Shift Right
        when others => SHIFTOUT <= "00000000";
      end case;
      end if;

    if (clr = '0') then
      SHIFTOUT <= "00000000";
      end if;
    end process;

end Behavioral;