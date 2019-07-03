library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Maquina_Refri is
    Port ( 
           COIN: in STD_LOGIC_VECTOR (1 downto 0);
           clk: in STD_LOGIC;
           clr: in STD_LOGIC;
           MOEDA_ACK : in STD_LOGIC;
           MOEDA_RETIRADA : in STD_LOGIC;
           REFRI_RETIRADO : in STD_LOGIC;
           RETURN_COIN : out STD_LOGIC;
           REFRI_DISPONIVEL: out STD_LOGIC;
			     output_7seg : out STD_LOGIC_VECTOR (6 downto 0);
			     output_an : out STD_LOGIC_VECTOR (3 downto 0)
			  );
			  
end Maquina_Refri;

architecture logic of Maquina_Refri is

component somador_reg is
    Generic( n : integer := 4
    );
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           en : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           S : out STD_LOGIC_VECTOR (n-1 downto 0));
end component;

component decoMoeda is
    Port ( COIN_IN : in STD_LOGIC_VECTOR (1 downto 0);
           DECOIN_OUT : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component contador_74LS169 is
    Port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           lkd : in STD_LOGIC;
           en : in STD_LOGIC;
           up_down : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           o_f : out STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component deco7seg is
    Generic (clk_freq : integer := 100000000; -- 100MHz
             refresh_freq : integer := 30 -- 30Hz
    );
    Port ( clk_7seg : in STD_LOGIC;
           rst : in std_logic;
           input_1 : in STD_LOGIC_VECTOR (3 downto 0);
           input_2 : in STD_LOGIC_VECTOR (3 downto 0);
           input_3 : in STD_LOGIC_VECTOR (3 downto 0);
           input_4 : in STD_LOGIC_VECTOR (3 downto 0);
           output_7seg : out STD_LOGIC_VECTOR (6 downto 0);
           output_an : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component comp4bit is port(
  a, b : in std_logic_vector(3 downto 0);
    agtbin, aeqbin, altbtin : in std_logic;
    agtbout, aeqbout, altbtout : out std_logic);
end component;

component myca2 is
    Port ( 
           clk: in STD_LOGIC;
           clr: in STD_LOGIC;
           flag : in STD_LOGIC;
           opcode : in STD_LOGIC_VECTOR (3 downto 0);
           braddr : in STD_LOGIC_VECTOR (7 downto 0); 
           jaddr : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0);
end component;

component ROM is

port( 

addr : in std_logic_vector(7 downto 0);
d_out : out std_logic_vector(19 downto 0) );

end component;

component flag_myca is

port(

  D0_F, D1_F, D2_F, D3_F, D4_F, D5_F, D6_F, D7_F: in STD_LOGIC_VECTOR;
  Sel_F: in STD_LOGIC_VECTOR(3 downto 0);
  S_M: out STD_LOGIC_VECTOR; 
  );

end component;

signal Resul_Detc_Moeda, ResSoma, Preco_Refri: STD_LOGIC_VECTOR (3 downto 0); 
signal Res_contador_74LS169: STD_LOGIC_VECTOR (3 downto 0); 
signal En_contador, clr_contador, o_f : STD_LOGIC;
signal agtbout, aeqbout, altbtout : STD_LOGIC;
signal CLR_CONT, DEC_TROCO, SOMAR, LOAD_CNT: STD_LOGIC;

signal braddr_myca2, Out_myca2: STD_LOGIC_VECTOR(7 downto 0);
signal Sel_Flag, opcode_myca2: STD_LOGIC_VECTOR(3 downto 0);
signal Out_Flag: STD_LOGIC;
signal Out_ROM: STD_LOGIC_VECTOR(19 downto 0);

begin

Preco_Refri <= "0110"; 

U0 : decoMoeda port map (COIN, Resul_Detc_Moeda);

U1: somador_reg port map(clk, clr, SOMAR, Resul_Detc_Moeda ,Res_contador_74LS169, ResSoma);

En_contador <= (LOAD_CNT or DEC_TROCO);
clr_contador <= (clr or CLR_CONT);

U2: contador_74LS169 port map(clk, clr_contador, LOAD_CNT, En_contador, '0', ResSoma, o_f, Res_contador_74LS169);

U3: comp4bit port map(Res_contador_74LS169, Preco_Refri, '0', '1', '0', agtbout, aeqbout, altbtout);

U4: flag_myca port map(MOEDA_ACK, not(MOEDA_ACK), agtbout, altbtout, aeqbout, REFRI_RETIRADO, MOEDA_RETIRADA, not(MOEDA_RETIRADA), Sel_Flag, Out_Flag); 

U5: myca2 port map(clk, clr, Out_Flag, opcode_myca2, braddr_myca2, "00000000", Out_myca2);

U6: ROM port map(Out_myca2, Out_ROM);

REFRI_DISPONIVEL <= Out_ROM(0);
RETURN_COIN <= Out_ROM(1); 
LOAD_CNT <= Out_ROM(2);
SOMAR <= Out_ROM(3);
DEC_TROCO <= Out_ROM(4);
CLR_CONT <= Out_ROM(5);
braddr_myca2 <= Out_ROM(13 downto 6);
Sel_Flag <= Out_ROM(16 downto 14);
opcode_myca2 <= Out_ROM(19 downto 17);

U7: deco7seg port map(clk, clr, Preco_Refri, Res_contador_74LS169, braddr_myca2(3 downto 0), '0' & opcode_myca2, output_7seg, output_an);

end logic;