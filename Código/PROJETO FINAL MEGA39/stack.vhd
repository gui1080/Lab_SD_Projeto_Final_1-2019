library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity stack is

  port

  (
  clk_2:  in  std_Logic;
  clr_2:  in  std_Logic;
  S_aux: in std_Logic_vector(1 downto 0);
  A: in std_Logic_vector(7 downto 0);
  Q_aux: out std_Logic_vector(7 downto 0);

  );

end stack;


architecture logic of stack is


  component shifter is
  port(
    SHIFTINPUT : in  STD_LOGIC_VECTOR(7 downto 0);
    L, R: in STD_LOGIC;
    SHIFT_Ctrl : in  STD_LOGIC_VECTOR(1 downto 0);
    SHIFTOUT: out  STD_LOGIC_VECTOR(7 downto 0);
    clk:  in  std_Logic;
    clr:  in  std_Logic
    );

  end component;

signal 
input_0, output_0,
input_1, output_1,
input_2, output_2,
input_3, output_3,
input_4, output_4,
input_5, output_5,
input_6, output_6,
input_7, output_7: STD_LOGIC_VECTOR(7 downto 0);

--signal SHIFTINPUT: STD_LOGIC_VECTOR(7 downto 0);
--signal L, R: STD_LOGIC;
--signal SHIFT_Ctrl :STD_LOGIC_VECTOR(1 downto 0);
--signal SHIFTOUT:STD_LOGIC_VECTOR(7 downto 0);
--signal clk: std_Logic;
--signal clr: std_Logic;
--eu realmente n entendi o pq dessa declaração

begin

  input_7(7) <= A(7);
  input_7(6) <= output_7(6);
  input_7(5) <= output_7(5);
  input_7(4) <= output_7(4);
  input_7(3) <= output_7(3);
  input_7(2) <= output_7(2);
  input_7(1) <= output_7(1);
  input_7(0) <= output_7(0);

  R7: shifter port map(input_7, output_7(0), A(7), S_aux, output_7, clk, clr);

  Q_aux(7) <= output_7(7);

  input_6(7) <= A(6);
  input_6(6) <= output_6(6);
  input_6(5) <= output_6(5);
  input_6(4) <= output_6(4);
  input_6(3) <= output_6(3);
  input_6(2) <= output_6(2);
  input_6(1) <= output_6(1);
  input_6(0) <= output_6(0);

  R6: shifter port map(input_6, output_6(0), A(6), S_aux, output_6, clk, clr);

  Q_aux(6) <= output_6(7);

  input_5(7) <= A(5);
  input_5(6) <= output_5(6);
  input_5(5) <= output_5(5);
  input_5(4) <= output_5(4);
  input_5(3) <= output_5(3);
  input_5(2) <= output_5(2);
  input_5(1) <= output_5(1);
  input_5(0) <= output_5(0);

  R5: shifter port map(input_5, output_5(0), A(5), S_aux, output_5, clk, clr);

  Q_aux(5) <= output_5(7);

  input_4(7) <= A(4);
  input_4(6) <= output_4(6);
  input_4(5) <= output_4(5);
  input_4(4) <= output_4(4);
  input_4(3) <= output_4(3);
  input_4(2) <= output_4(2);
  input_4(1) <= output_4(1);
  input_4(0) <= output_4(0);

  R4: shifter port map(input_4, output_4(0), A(4), S_aux, output_4, clk, clr);

  Q_aux(4) <= output_4(7);

  input_3(7) <= A(3);
  input_3(6) <= output_3(6);
  input_3(5) <= output_3(5);
  input_3(4) <= output_3(4);
  input_3(3) <= output_3(3);
  input_3(2) <= output_3(2);
  input_3(1) <= output_3(1);
  input_3(0) <= output_3(0);

  R3: shifter port map(input_3, output_3(0), A(3), S_aux, output_3, clk, clr);

  Q_aux(3) <= output_3(7);

  input_2(7) <= A(2);
  input_2(6) <= output_2(6);
  input_2(5) <= output_2(5);
  input_2(4) <= output_2(4);
  input_2(3) <= output_2(3);
  input_2(2) <= output_2(2);
  input_2(1) <= output_2(1);
  input_2(0) <= output_2(0);

  R2: shifter port map(input_2, output_2(0), A(2), S_aux, output_2, clk, clr);

  Q_aux(2) <= output_2(7);

  input_1(7) <= A(1);
  input_1(6) <= output_1(6);
  input_1(5) <= output_1(5);
  input_1(4) <= output_1(4);
  input_1(3) <= output_1(3);
  input_1(2) <= output_1(2);
  input_1(1) <= output_1(1);
  input_1(0) <= output_1(0);

  R1: shifter port map(input_1, output_1(0), A(1), S_aux, output_1, clk, clr);

  Q_aux(1) <= output_1(7);

  input_0(7) <= A(0);
  input_0(6) <= output_0(6);
  input_0(5) <= output_0(5);
  input_0(4) <= output_0(4);
  input_0(3) <= output_0(3);
  input_0(2) <= output_0(2);
  input_0(1) <= output_0(1);
  input_0(0) <= output_0(0);

  R0: shifter port map(input_0, output_0(0), A(0), S_aux, output_0, clk, clr);

  Q_aux(0) <= output_0(7);

end logic;