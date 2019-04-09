library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder_tb IS
end ripple_adder_tb;

architecture behavioral of ripple_adder_tb is

component ripple_adder 
port(
A,B : in std_logic_vector(3 downto 0);
Cin: in std_logic;
S: out std_logic_vector(3 downto 0);
Cout: out std_logic
);
end component;

--Inputs
signal A : std_logic_vector(3 downto 0) := (others => '0');
signal B : std_logic_vector(3 downto 0) := (others => '0');
signal Cin : std_logic := '0';

--Outputs
signal S : std_logic_vector(3 downto 0);
signal Cout : std_logic;

BEGIN

rippleadder: ripple_adder port map(
A => A,
B => B,
Cin => Cin,
S => S,
Cout => Cout);

process
begin

wait for 100 ns; 
A <= "0001";
B <= "0011";
Cin <= '0';

wait for 100 ns;
A <= "0011";
B <= "0100";
Cin <= '0';

wait for 100 ns;
A <= "0010";
B <= "0010";
Cin <= '1';

wait for 100 ns;
A <= "0101";
B <= "0101";
Cin <= '1';

wait for 100 ns;
A <= "1111";
B <= "1100";
Cin <= '0';

wait for 100 ns;
A <= "0110";
B <= "0111";
Cin <='1';

wait for 100 ns;
A <= "0110";
B <= "1110";
Cin <='0';

wait for 100 ns;
A <= "1111";
B <= "1111";
Cin <= '0';
wait;

end process;

end behavioral;
