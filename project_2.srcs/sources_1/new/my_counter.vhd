library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity my_counter is
    port( clk,reset : in std_logic;
           counter : out std_logic_vector(2 downto 0));
end my_counter;
architecture Behavioral of my_counter is
    signal c_state : std_logic_vector(2 downto 0);    
begin
    counter <= c_state;
    process(c_state,reset,clk)
    begin
    if(reset ='1') then
        c_state <= "000";
    elsif(rising_edge(clk)) then
        if(c_state = "000") then
            c_state <= "001";
        elsif(c_state = "001") then
            c_state <= "010";
        elsif(c_state = "010") then
            c_state <= "011";
        elsif(c_state = "011") then
            c_state <= "100";
        elsif(c_state = "100") then
            c_state <= "101";
        elsif(c_state = "101") then 
            c_state <= "000";
        end if;
    end if;
    end process;
end Behavioral;
