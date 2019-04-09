library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity debounce is
port(clk: in std_logic;
btn: in std_logic;
dbnc: out std_logic);
end debounce;

architecture debounce_ckt of debounce is
signal reg : std_logic_vector (1 downto 0):=(others=>'0');
signal counter : std_logic_vector(21 downto 0):=(others=>'0');
begin

process (clk)
begin

if (rising_edge(clk)) then
    reg(1) <= reg(0);
    reg(0) <= btn;
    
if (unsigned(counter)<= 2499999) then
    dbnc <= '0';
    if reg(1) = '1' then
    counter <= std_logic_vector(unsigned(counter)+1);
    elsif (reg(1)='0') then
    counter <= (others => '0');
    end if;
    elsif(unsigned(counter)= 2500000) then
    if(reg(1)='1') then
    dbnc <='1'; 
    else
    dbnc <='0';
    counter <= (others =>'0');
    end if;
end if;
end if;
end process;

end debounce_ckt;
