library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.NUMERIC_STD.all;

entity my_alu is
port(A, B: in  unsigned(3 downto 0);  -- 2 inputs 4-bit
ALU_sel: in unsigned(3 downto 0);  -- 1 input 4-bit for selecting operation
ALU_out: out unsigned(3 downto 0)); -- 1 output 4-bit 
end my_alu; 

architecture behavioral of my_alu is
signal output : unsigned(3 downto 0);

begin
   process(A,B,ALU_sel)
 begin
  case(ALU_sel) is
  when "0000" => 
   output <= A + B; -- addition
  when "0001" => 
   output <= A - B; -- subtraction
  when "0010" => 
   output <= A + 1; -- A + 1
  when "0011" => 
   output <= A - 1; -- A - 1
  when "0100" => 
   output <= 0 - A; -- 0 - A
  when "0101" => if(A > B) then   -- A > B 
      output <= "0001"; 
   else
      output <= "0000"; 
   end if;
  when "0110" => 
   output <= A sll 1; -- shift left logical
   when "0111" => 
   output <= A srl 1; -- shift right logical
  when "1000" => 
   output <= unsigned(shift_right(signed(A),1)); -- shift right arithmetic
  when "1001" => 
   output <= NOT A; -- not A
  when "1010" =>   
   output <= A AND B; -- logical and
  when "1011" => 
   output <= A OR B; -- logical or
  when "1100" => 
   output <= A XOR B; -- logical xor
  when "1101" => 
   output <= A XNOR B; -- logical xnor 
  when "1110" => 
   output <= A NAND B; -- logical nand
  when "1111" => 
   output <= A NOR B; --logical NOR
  when others => output <= "0000"; 
 end case;
 end process;
 ALU_out <= output; 
end behavioral;
