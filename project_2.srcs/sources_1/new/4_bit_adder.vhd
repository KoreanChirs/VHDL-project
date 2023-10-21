
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_adder is
  Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
           b : in STD_LOGIC_VECTOR(3 downto 0);
           sum : out STD_LOGIC_VECTOR(3 downto 0));
end four_bit_adder;

architecture Behavioral of four_bit_adder is
component full_adder 
    port(
        a,b,cin : in std_logic;
        cout, s : out std_logic
    );
end component;

signal temp1, temp2, temp3, over : std_logic;
begin
u1 : full_adder port map(a => a(0),b => b(0), cin => '0',s => sum(0),cout => temp1);
u2 : full_adder port map(a => a(1),b => b(1), cin => temp1,s => sum(1),cout => temp2);
u3 : full_adder port map(a => a(2),b => b(2), cin => temp2,s => sum(2),cout => temp3);
u4 : full_adder port map(a => a(3),b => b(3), cin => temp3,s => sum(3),cout => over);
end Behavioral;