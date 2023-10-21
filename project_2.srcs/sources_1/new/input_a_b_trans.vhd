
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity input_a_b_trans is
port(
a,b : in std_logic_vector(3 downto 0);
sin_a, sin_b ,bc_da,bc_db : out std_logic_vector(3 downto 0)
);

end input_a_b_trans;

architecture Behavioral of input_a_b_trans is

signal sina, sinb ,bcd_a,bcd_b : std_logic_vector(3 downto 0);


begin
sin_a <= sina;
sin_b <= sinb;
bc_da <= bcd_a;
bc_db <= bcd_b;

signad : process(a)
begin
if(a(3) = '1') then
    sina <= "1101";
else
    sina <= "1110";
end if;
end process;
signbd : process(b)
begin
if(b(3) = '1') then
    sinb <= "1101";
else
    sinb <= "1110";
end if;
end process; 

bcda : process(a)
begin
if(a(3) = '0') then
    bcd_a <= a;
elsif(a = "1000") then
    bcd_a <= "1000";
elsif(a = "1001") then
    bcd_a <= "0111";
elsif(a = "1010") then
    bcd_a <= "0110";
elsif(a = "1011") then
    bcd_a <= "0101";
elsif(a = "1100") then
    bcd_a <= "0100";
elsif(a = "1101") then
    bcd_a <= "0011";
elsif(a = "1110") then
    bcd_a <= "0010";
elsif(a = "1111") then
    bcd_a <= "0001";
end if;
end process; 

bcdb : process(b)
begin
if(b(3) = '0') then
    bcd_b <= b;
elsif(b = "1000") then
    bcd_b <= "1000";
elsif(b = "1001") then
    bcd_b <= "0111";
elsif(b = "1010") then
    bcd_b <= "0110";
elsif(b = "1011") then
    bcd_b <= "0101";
elsif(b = "1100") then
    bcd_b <= "0100";
elsif(b = "1101") then
    bcd_b <= "0011";
elsif(b = "1110") then
    bcd_b <= "0010";
elsif(b = "1111") then
    bcd_b <= "0001";
end if;
end process; 
end Behavioral;
