library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity counter_shiftregistor_a is

port(
    a,b : in std_logic_vector(3 downto 0);
    clk, reset : in std_logic;
    st : out std_logic_vector(2 downto 0);
    out_b : out std_logic_vector(3 downto 0);
    out_a : out std_logic_vector(7 downto 0));
end counter_shiftregistor_a;

architecture Behavioral of counter_shiftregistor_a is

component my_counter 
    port( clk,reset : in std_logic;
           counter : out std_logic_vector(2 downto 0));
end component;

component shift_registor_a is
    port(
        a : in std_logic_vector(3 downto 0);
        state : in std_logic_vector(2 downto 0);
        clk,reset : in std_logic;
        a_out : out std_logic_vector(7 downto 0) 
    );
end component;

component shift_registor_b 
    port(
        b : in std_logic_vector(3 downto 0);
        state : in std_logic_vector(2 downto 0);
        clk,reset : in std_logic;
        b_out : out std_logic_vector(3 downto 0) 
    );
end component;
signal m_state : std_logic_vector(2 downto 0);
begin

u1 : my_counter port map(clk => clk, reset => reset, counter => m_state);
u2 : shift_registor_a port map(a =>a, clk=>clk, reset => reset, state =>m_state, a_out => out_a);
u3 : shift_registor_b port map(b =>b, clk => clk, reset => reset, state => m_state, b_out => out_b);
st <= m_state;
end Behavioral;
