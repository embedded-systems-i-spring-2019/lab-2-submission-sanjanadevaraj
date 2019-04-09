library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_tester is
port(clk: in std_logic;
sw, btn : in std_logic_vector(3 downto 0);
led : out std_logic_vector(3 downto 0));
end alu_tester;

architecture alu_tester_ckt of alu_tester is
signal dbnc : std_logic_vector(3 downto 0);
signal A, B, opcode, output: std_logic_vector(3 downto 0);

component debounce
port (clk: in std_logic;
btn: in std_logic;
dbnc: out std_logic );
end component;

component my_alu
port (A, B, ALU_sel: in std_logic_vector(3 downto 0);
ALU_out: out std_logic_vector(3 downto 0));
end component;

begin
              
debounce2: debounce port map(
clk => clk,
btn => btn(2),
dbnc => dbnc(2));
                                     
debounce1: debounce port map(
clk => clk,
btn => btn(1),
dbnc => dbnc(1));                  
             
debounce0: debounce port map(
clk => clk,
btn => btn(0),
dbnc => dbnc(0));
           
debounce3: debounce port map(
clk => clk,
btn => btn(3),
dbnc => dbnc(3));
                           
ALU: my_alu port map(
A => A,
B => B,
ALU_sel => opcode,
ALU_out => output);

process(clk)

begin
if(rising_edge(clk)) then
   if(dbnc(2) = '1') then     -- pressing button 2 loads opcode  
      opcode <= sw;                    
   elsif(dbnc(1) = '1') then  -- pressing button 1 loads input A
      A <= sw;             
   elsif(dbnc(0) = '1') then  -- pressing button 0 loads input B
      B <= sw;              
   elsif(dbnc(3) = '1') then  -- pressing button 3 resets the opcode and inputs A and B
      opcode <= "0000";
      A <= "0000";
      B <= "0000";
   end if;
led <= output;     -- final output is sent to led on rising edge of the clock
end if;
end process;
   
end alu_tester_ckt;
