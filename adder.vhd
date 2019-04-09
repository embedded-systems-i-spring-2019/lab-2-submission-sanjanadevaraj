library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
port(A,B,Cin: in std_logic;
S,Cout: out std_logic);
end adder;

architecture adder_ckt of adder is
begin
S <= A XOR B XOR Cin;
Cout <= (A AND B) OR (Cin AND (A XOR B));
end adder_ckt;
