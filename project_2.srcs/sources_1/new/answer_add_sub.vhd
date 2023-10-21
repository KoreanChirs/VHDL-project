library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity answer_add_sub is
    port( a, b : in std_logic_vector(3 downto 0);
        select_sig : in std_logic; 
        bcd_10,bcd_1,sign : out std_logic_vector(3 downto 0));   
end answer_add_sub;

architecture Behavioral of answer_add_sub is

component fivebit_add_sub 
port( a, b : in std_logic_vector(3 downto 0);
        select_sig : in std_logic; 
        sum : out std_logic_vector(4 downto 0));   
end component;

component eight_bcd is
    port(
    ans : in std_logic_vector(7 downto 0);
    bcd_10, bcd_1 : out std_logic_vector(3 downto 0)
    );
end component;

component eight_bitt_adder 
  Port ( a : in STD_LOGIC_VECTOR(7 downto 0);
           b : in STD_LOGIC_VECTOR(7 downto 0);
           sum : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal sum : std_logic_vector(4 downto 0);
signal candidate : std_logic_vector(7 downto 0);
signal not_sum : std_logic_vector(7 downto 0);
signal inte : std_logic_vector(7 downto 0);
signal bcd10, bcd1 :  std_logic_vector(3 downto 0);
begin

u1 : fivebit_add_sub port map(a => a, b=>b, select_sig => select_sig, sum => sum);
not_sum <=  not("111" & sum);
u2 : eight_bitt_adder  port map(a => not_sum, b=>"00000001", sum => candidate);
u3 : eight_bcd port map(ans => inte, bcd_10 => bcd10, bcd_1 => bcd1);
siign : process(a,b,select_sig,sum,candidate)
begin
if(a = "1000" and b = "1000" and select_sig = '0') then
    sign <= "1101";
    inte <= "00000000";
elsif(a = "1000" and b = "1000" and select_sig = '1') then
    sign <= "1110";
    inte <= "00000000";
elsif(sum(4) = '0') then
    sign <= "1110";
    inte <= "000" & sum;
else 
    sign <= "1101";
    inte <= "000" & candidate(4 downto 0);
end if;    
end process;

process(a,b,bcd10,bcd1)
begin
if(a = "1000" and b = "1000" and select_sig = '0') then
    bcd_10 <= "0001";
    bcd_1 <= "0110";
elsif(a = "1000" and b = "1000" and select_sig = '1') then
    bcd_10 <= "0000";
    bcd_1 <= "0000";
else
    bcd_10 <= bcd10;
    bcd_1 <= bcd1;
end if;
end process;
end Behavioral;
