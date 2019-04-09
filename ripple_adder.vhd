library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
port(A, B: in std_logic_vector(3 downto 0);
Cin: in std_logic;
S: out std_logic_vector(3 downto 0);
Cout: out std_logic);
end ripple_adder;

architecture ripple_adder_ckt of ripple_adder is
signal c1,c2,c3: std_logic := '0';

component adder 
port (A, B, Cin: in std_logic;
S, Cout: out std_logic);
end component;

begin

full_adder1: 
adder port map(
A => A(0),
B => B(0),
Cin => Cin,
S => S(0),
Cout => c1);
                                                
full_adder2: 
adder port map(
A => A(1),
B => B(1),
Cin => c1,
S => S(1),
Cout => c2);                        

full_adder3: 
adder port map(
A => A(2),
B => B(2),
Cin => c2,
S => S(2),
Cout => c3);


full_adder4: 
adder port map(
A => A(3),
B => B(3),
Cin => c3,
S => S(3),
Cout => Cout);

end ripple_adder_ckt;
