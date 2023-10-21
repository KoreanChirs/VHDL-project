library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_registor_b is
    port(
        b : in std_logic_vector(3 downto 0);
        state : in std_logic_vector(2 downto 0);
        clk,reset : in std_logic;
        b_out : out std_logic_vector(3 downto 0) 
    );
end shift_registor_b;

architecture Behavioral of shift_registor_b is
signal d_out : std_logic_vector(3 downto 0); 
begin
process(state,b)
    begin
    if (state = "000") then
        d_out <= b;
    elsif (state = "001") then
        d_out <= b(0) & b(3 downto 1);
    elsif (state = "010") then
        d_out <= b(1 downto 0) & b(3 downto 2);
    elsif (state = "011") then
        d_out <= b(2 downto 0) & b(3);
    elsif (state = "100") then
        d_out <= b;
    elsif (state = "101") then 
        d_out <= "0000";
    end if;
end process;

process(clk,d_out)
    begin
    if(reset = '1') then
        b_out <= "0000";
    elsif(rising_edge(clk)) then
        b_out <= d_out;
    end if;
end process;
end Behavioral;