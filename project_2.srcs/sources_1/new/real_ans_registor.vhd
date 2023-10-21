library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity real_ans_registor is
port(
    a,b : in std_logic_vector(3 downto 0);
    clk, reset : in std_logic;
    done : out std_logic;
    st : out std_logic_vector(2 downto 0);
    answer : out std_logic_vector(7 downto 0);
    sign : out std_logic_vector(3 downto 0)
    );
end real_ans_registor;

architecture Behavioral of real_ans_registor is

component real_sum_resistor is
    port(
    a,b : in std_logic_vector(3 downto 0);
    clk, reset : in std_logic;
    st : out std_logic_vector(2 downto 0);
    output : out std_logic_vector(7 downto 0);
    sign : out std_logic_vector(3 downto 0)
    );
end component;
signal state :  std_logic_vector(2 downto 0);
signal ans : std_logic_vector(7 downto 0);
signal sig : std_logic_vector(3 downto 0);
begin
u1 : real_sum_resistor port map(a => a, b => b, clk => clk, reset => reset, st => state, output => ans, sign =>sig);
st <= state;
process(reset,clk,ans,state)
begin
if (reset = '1') then
    answer <= "00000000";
    sign <= "0000";
    done <= '0';
elsif (rising_edge(clk)) then
    if(state = "101") then
        answer <= ans;
        sign <= sig;
        done <= '1';
    end if;
end if;
end process;
end Behavioral;
