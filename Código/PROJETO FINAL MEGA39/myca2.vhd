library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity myca2 is
    Port ( 
           clk: in STD_LOGIC;
           clr: in STD_LOGIC;
           flag : in STD_LOGIC;
           opcode : in STD_LOGIC_VECTOR (3 downto 0);
           braddr : in STD_LOGIC_VECTOR (7 downto 0); 
           jaddr : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end myca2;

architecture logic of myca2 is

component MUX4_8 is
port(

  D0: in STD_LOGIC_VECTOR(7 downto 0);
  D1: in STD_LOGIC_VECTOR(7 downto 0);
  D2: in STD_LOGIC_VECTOR(7 downto 0);
  D3: in STD_LOGIC_VECTOR(7 downto 0);
  S1: in STD_LOGIC_VECTOR(1 downto 0);
  Y1: out STD_LOGIC_VECTOR(7 downto 0));

end component;

component FullAdder_8bits is
  Port(
    A, B : in std_logic_vector(7 downto 0);
    cin : in std_logic; 
    S : out std_logic_vector(7 downto 0);
    cout : out std_logic
    );
end component;

component opcodeDecoder is
    Port ( 
           deco_in : in STD_LOGIC_VECTOR (3 downto 0);
           deco_out : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component stack is
  port
  (
  clk_2:  in  std_Logic;
  clr_2:  in  std_Logic;
  S_aux: in std_Logic_vector(1 downto 0);
  A: in std_Logic_vector(7 downto 0);
  Q_aux: out std_Logic_vector(7 downto 0)
  );

end component;

component unidade_updown is
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
end component;

signal Cout_Full_Adder, off_f: STD_LOGIC;
signal deco_in_f: STD_LOGIC_VECTOR (3 downto 0);
signal deco_out_f: STD_LOGIC_VECTOR (6 downto 0);
signal Out_Contador_up_down, Out_FullAdder, Out_stack, Out_MUX: STD_LOGIC_VECTOR (7 downto 0);
signal entrada_mux: STD_LOGIC_VECTOR (1 downto 0);

begin

deco_in_f(3) <= flag; 
deco_in_f(2) <= opcode(2);
deco_in_f(1) <= opcode(1); 
deco_in_f(0) <= opcode(0); 

U0: opcodeDecoder port map ( deco_in_f, deco_out_f);

U1: FullAdder_8bits port map("00000000", Out_Contador_up_down, deco_out_f(0), Out_FullAdder, Cout_Full_Adder);

U2: stack port map(clk, clr, deco_out_f(2 downto 1), Out_FullAdder, Out_stack);

U3: MUX4_8 port map(braddr, jaddr, Out_stack, "00000000", deco_out_f(4 downto 3), Out_MUX);

U4: unidade_updown port map('1', clr, deco_out_f(6), clk, deco_out_f(5), Out_MUX, off_f, Out_Contador_up_down);

Q <= Out_Contador_up_down; 

end logic;