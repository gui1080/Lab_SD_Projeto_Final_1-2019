Library ieee;
Use ieee.std_logic_1164.all;
--Use work.fulladd_package.all;

entity FullAdder_8bits is
  Port(
    A, B : in std_logic_vector(7 downto 0);
    cin : in std_logic; 
    S : out std_logic_vector(7 downto 0);
    cout : out std_logic
    );
end entity;

architecture somador of FullAdder_8bits is

component Full_adder_1BIT is

port( 
  A_1b, B_1b ,Cin_1b: in STD_LOGIC;
  S_1b, Cout_1b: out STD_LOGIC);

end component; 

signal c1, c2, c3, c4, c5, c6, c7: STD_LOGIC;

begin

	U0: Full_adder_1BIT port map (A(0), B(0), Cin, S(0), c1);
	U1: Full_adder_1BIT port map (A(1), B(1), c1, S(1), c2);
	U2: Full_adder_1BIT port map (A(2), B(2), c2, S(2), c3);
	U3: Full_adder_1BIT port map (A(3), B(3), c3, S(3), c4);
	U4: Full_adder_1BIT port map (A(4), B(4), c4, S(4), c5);
	U5: Full_adder_1BIT port map (A(5), B(5), c5, S(5), c6);
	U6: Full_adder_1BIT port map (A(6), B(6), c6, S(6), c7);
	U7: Full_adder_1BIT port map (A(7), B(7), c7, S(7), cout);

end somador;