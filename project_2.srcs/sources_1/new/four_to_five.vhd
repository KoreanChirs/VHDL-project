library ieee;
use ieee.std_logic_1164.all;

entity four_to_five is
port (a,b : in std_logic_vector(3 downto 0);
        a_t,b_t : out std_logic_vector(4 downto 0)); 
end four_to_five;

architecture Behavioral of four_to_five is
constant eight : std_logic_vector := "11000";    
begin
process(a)
    begin
    if (a(3) = '0') then
        a_t <= '0' & a;
    else
        if (a = "1000") then
            a_t <= eight;
        else
            a_t <=  (a(3) & a);
    end if;    
    end if;
    end process;
    
process(b)
    begin
    if (b(3) = '0') then
        b_t <= '0' & b;
    else
        if (b = "1000") then
            b_t <= eight;
        else
            b_t <=  (b(3) & b);
    end if;    
    end if;
    end process;
end Behavioral;
