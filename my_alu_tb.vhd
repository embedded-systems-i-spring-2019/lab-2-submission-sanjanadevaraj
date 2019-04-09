library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity my_alu_tb is
end my_alu_tb;

architecture behavioral of my_alu_tb is
signal A, B, opcode, output: unsigned(3 downto 0) :="0000";

component my_alu
port(A, B, ALU_Sel: in unsigned(3 downto 0);
ALU_Out: out unsigned(3 downto 0));
end component;

begin
my_alu_mapping: my_alu port map(
A => A,
B => B,
ALU_Sel => opcode,
ALU_Out => output);

process
begin

A <= "0100";
B <= "0010";
opcode <= "0000";
wait for 400ns;

A <= "0101";
B <= "0011";
opcode <= "0001";
wait for 400ns;

A <= "0010";
opcode <= "0010";
wait for 400ns;

A <= "1111";
opcode <= "0010";
wait for 400ns;

A <= "0100";
opcode <= "0011";
wait for 400ns;

A <= "0011";
opcode <= "0100";
wait for 400ns;

A <= "0010";
B <= "0001";
opcode <= "0101";
wait for 400ns;

A <= "0011";
B <= "1011";
opcode <= "0101";
wait for 400ns;

A <= "0011";
opcode <= "0110";
wait for 400ns;

A <= "1111";
opcode <= "0111";
wait for 400ns;

A <= "1110";
opcode <= "1000";
wait for 400ns;

A <= "0110";
opcode <= "1000";
wait for 400ns;

A <= "1101";
opcode <= "1001";
wait for 400ns;

A <= "1100";
B <= "1001";
opcode <= "1010";
wait for 400ns;

A <= "1000";
B <= "0101";
opcode <= "1011";
wait for 400ns;

A <= "1011";
B <= "1000";
opcode <= "1100";
wait for 400ns;

A <= "1001";
B <= "1010";
opcode <= "1101";
wait for 400ns;

A <= "0011";
B <= "1001";
opcode <= "1110";
wait for 400ns;

A <= "1100";
B <= "1010";
opcode <= "1111";
wait for 400ns;

end process;

end behavioral;
