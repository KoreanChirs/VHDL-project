library ieee;
use ieee.std_logic_1164.all;

entity tb_four_to_five is
end tb_four_to_five;

architecture Behavioral of tb_four_to_five is
component four_to_five 
port (a,b : in std_logic_vector(3 downto 0);
        a_t,b_t : out std_logic_vector(4 downto 0)); 
end component;

signal  a :  std_logic_vector(3 downto 0);
signal b : std_logic_vector(3 downto 0);
signal a_t :  std_logic_vector(4 downto 0);
signal b_t :  std_logic_vector(4 downto 0);

begin

dut : four_to_five port map (a,b,a_t,b_t);
stimuli : process
begin
    a <= "1000";
    b <= "0101";
wait;
end process;
end Behavioral;
configuration cfg_tb_four_to_five of tb_four_to_five is
    for Behavioral
    end for;
end cfg_tb_four_to_five;
