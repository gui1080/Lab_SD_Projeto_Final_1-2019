library IEEE;
use IEEE.std_logic_1164.all;

entity Full_adder_1BIT is

port( 
  A_1b, B_1b, Cin_1b: in STD_LOGIC;
  S_1b, Cout_1b: out STD_LOGIC);

end Full_adder_1BIT; 

architecture somador_completo_F of Full_adder_1BIT is

begin

  S_1b <= ((A_1b xor B_1b) xor (Cin_1b));
  Cout_1b <= (((A_1b xor B_1b) and Cin_1b) or (A_1b and B_1b));
  
end somador_completo_F; 