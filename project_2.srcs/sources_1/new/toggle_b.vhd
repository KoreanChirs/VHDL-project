
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toggle_b is
port(
        b_t: in std_logic_vector(4 downto 0);
        s : in std_logic;
        t_b_t : out std_logic_vector(4 downto 0)
    );
end toggle_b;

architecture Behavioral of toggle_b is
begin
process(s,b_t)
    begin
    if (s = '1') then
    t_b_t <= not(b_t);
    else
    t_b_t <= b_t;
    end if;
end process;
end Behavioral;
