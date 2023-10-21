library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sum_registor is
port(
    clk, reset : in std_logic;
    st : in std_logic_vector(2 downto 0);
    p_out_p : in std_logic_vector(7 downto 0);
    nw_s : in std_logic_vector(7 downto 0);
    out_p : out std_logic_vector(7 downto 0)
);

end sum_registor;
architecture Behavioral of sum_registor is

component eight_bitt_adder is
  Port ( a : in STD_LOGIC_VECTOR(7 downto 0);
           b : in STD_LOGIC_VECTOR(7 downto 0);
           sum : out STD_LOGIC_VECTOR(7 downto 0));
end component;
signal temp : std_logic_vector(7 downto 0);
begin

u1 : eight_bitt_adder port map(a => p_out_p,b => nw_s, sum => temp);

process(st,temp,clk,reset)
begin
    if (reset = '1') then
        out_p <= "00000000";
    elsif(rising_edge(clk)) then
        if(st = "000") then
            out_p <= "00000000";
        else 
            out_p <= temp; 
    end if;
    end if;
end process;
end Behavioral;
