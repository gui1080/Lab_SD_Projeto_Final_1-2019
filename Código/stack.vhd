library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity stack is

  port

  (
  clk_2:	in	std_Logic;
  clr_2:	in	std_Logic
  S_aux: in std_Logic_vector(1 downto 0);
  A: in std_Logic_vector(3 downto 0);
  Q_aux: out std_Logic_vector(3 downto 0);
  );


end entity stack;


architecture logic of stack is

----------------------------------------------------------------------------------

  component unidade_74LS194 is

  port(
        d:	in	std_Logic_Vector ( 3 DOWNTO 0 );
        q:	out	std_Logic_Vector ( 3 DOWNTO 0 );
        s:	in	std_Logic_Vector ( 1 DOWNTO 0 );
        L:	in	std_Logic;
        R:	in	std_Logic;
        clk:	in	std_Logic;
        clr:	in	std_Logic);

  end component;

----------------------------------------------------------------------------------


signal Q_3, vector_d_3: STD_LOGIC_VECTOR (3 downto 0);
signal Q_2, vector_d_2: STD_LOGIC_VECTOR (3 downto 0);
signal Q_1, vector_d_1: STD_LOGIC_VECTOR (3 downto 0);
signal Q_0, vector_d_0: STD_LOGIC_VECTOR (3 downto 0);

begin

vector_d_3(3) <= A(3);
vector_d_3(2) <= Q_3(2);
vector_d_3(1) <= Q_3(1);
vector_d_3(0) <= Q_3(0);

R3: unidade_74LS194 port map(vector_d_3, Q_3, S_aux, Q_1(3), A(3), clk_2, clr_2);

Q_aux(3) <= Q_3(3);

vector_d_2(3) <= A(2);
vector_d_2(2) <= Q_2(2);
vector_d_2(1) <= Q_2(1);
vector_d_2(0) <= Q_2(0);

R2: unidade_74LS194 port map(vector_d_2, Q_2, S_aux, Q_2(3), A(2), clk_2, clr_2);

Q_aux(2) <= Q_2(3);

vector_d_1(3) <= A(1);
vector_d_1(2) <= Q_1(2);
vector_d_1(1) <= Q_1(1);
vector_d_1(0) <= Q_1(0);

R1: unidade_74LS194 port map(vector_d_1, Q_1, S_aux, Q_1(3), A(1), clk_2, clr_2);

Q_aux(1) <= Q_1(3);

vector_d_0(3) <= A(0);
vector_d_0(2) <= Q_0(2);
vector_d_0(1) <= Q_0(1);
vector_d_0(0) <= Q_0(0);

R0: unidade_74LS194 port map(vector_d_0, Q_0, S_aux, Q_0(3), A(0), clk_2, clr_2);

Q_aux(0) <= Q_0(3);

end logic;