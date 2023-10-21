--fake, mul_trans_a and trans_b and out sign.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mul_trans_b is
port(
    a,b : in std_logic_vector(3 downto 0);
    t_a, t_b, sign : out std_logic_vector(3 downto 0)    
);
end mul_trans_b;

architecture Behavioral of mul_trans_b is
component four_bit_adder is
  Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
           b : in STD_LOGIC_VECTOR(3 downto 0);
           sum : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal tt_a, tt_b, r_a, r_b : std_logic_vector(3 downto 0);

begin
tt_a <= '0' & not(a(2 downto 0));
u1 : four_bit_adder port map(a => "0001", b =>tt_a, sum => r_a);
tt_b <= '0' & not(b(2 downto 0));
u2 : four_bit_adder port map(a => "0001", b =>tt_b, sum => r_b);
process(a,r_a)
begin
    if(a(3) = '1') then
        t_a <= r_a;
    elsif(a(3) = '0') then
        t_a <= a;
    end if;
end process;

process(b,r_b)
begin
    if(b(3) = '1') then
        t_b <= r_b;
    elsif(b(3) = '0') then
        t_b <= b;
    end if;
end process;
sign <= "11" & (a(3) xnor b(3)) & (a(3) xor b(3));
end Behavioral;
