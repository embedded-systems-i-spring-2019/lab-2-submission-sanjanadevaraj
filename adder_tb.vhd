library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_tb IS
end adder_tb;

architecture behavioral of adder_tb is 
component adder
port(A,B,Cin : in std_logic;
S,Cout : out std_logic);
end component;

signal A,B,Cin: std_logic := '0';
signal S, Cout: std_logic :='0';

begin
adder_ckt: adder port map(
 A => A,
 B => B,
 Cin => Cin,
 S => S,
 Cout => Cout
 );

process
begin
 
 A <= '0';
 B <= '0';
 Cin <= '0';
 wait for 40 ns;

 A <= '0';
 B <= '0';
 Cin <= '1';
 wait for 40 ns;

 A <= '0';
 B <= '1';
 Cin <= '0';
 wait for 40 ns;

 A <= '0';
 B <= '1';
 Cin <= '1';
 wait for 40 ns;

 A <= '1';
 B <= '0';
 Cin <= '0';
 wait for 40 ns;
 
 A <= '1';
 B <= '0';
 Cin <= '1';
 wait for 40 ns;

 A <= '1';
 B <= '1';
 Cin <= '0';
 wait for 40 ns;

 A <= '1';
 B <= '1';
 Cin <= '1';
 wait for 40 ns;

 end process;

end behavioral;
