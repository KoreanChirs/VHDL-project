library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_registor_a is
    port(
        a : in std_logic_vector(3 downto 0);
        state : in std_logic_vector(2 downto 0);
        clk,reset : in std_logic;
        a_out : out std_logic_vector(7 downto 0) 
    );
end shift_registor_a;

architecture Behavioral of shift_registor_a is
signal d_out : std_logic_vector(7 downto 0); 
begin
process(state,a)
    begin
    if (state = "000") then
        d_out <= "0000" & a;
    elsif (state = "001") then
        d_out <= "000" & a & '0';
    elsif (state = "010") then
        d_out <= "00" & a & "00";
    elsif (state = "011") then
        d_out <= '0' & a & "000";
    elsif (state = "100") then
        d_out <= a & "0000";
    elsif (state = "101") then 
        d_out <= "00000000";
    end if;
end process;

process(clk,d_out)
    begin
    if(reset = '1') then
        a_out <= "00000000";
    elsif(rising_edge(clk)) then
        a_out <= d_out;
    end if;
end process;
end Behavioral;
