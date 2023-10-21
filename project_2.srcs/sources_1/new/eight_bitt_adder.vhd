
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bitt_adder is
  Port ( a : in STD_LOGIC_VECTOR(7 downto 0);
           b : in STD_LOGIC_VECTOR(7 downto 0);
           sum : out STD_LOGIC_VECTOR(7 downto 0));
end eight_bitt_adder;

architecture Behavioral of eight_bitt_adder is
component full_adder 
    port(
        a,b,cin : in std_logic;
        cout, s : out std_logic
    );
end component;

signal temp1, temp2, temp3, temp4, temp5, temp6, temp7, over : std_logic;
begin
u1 : full_adder port map(a => a(0),b => b(0), cin => '0',s => sum(0),cout => temp1);
u2 : full_adder port map(a => a(1),b => b(1), cin => temp1,s => sum(1),cout => temp2);
u3 : full_adder port map(a => a(2),b => b(2), cin => temp2,s => sum(2),cout => temp3);
u4 : full_adder port map(a => a(3),b => b(3), cin => temp3,s => sum(3),cout => temp4);
u5 : full_adder port map(a => a(4),b => b(4), cin => temp4,s => sum(4),cout => temp5);
u6 : full_adder port map(a => a(5),b => b(5), cin => temp5,s => sum(5),cout => temp6);
u7 : full_adder port map(a => a(6),b => b(6), cin => temp6,s => sum(6),cout => temp7);
u8 : full_adder port map(a => a(7),b => b(7), cin => temp7,s => sum(7),cout => over);
end Behavioral;
