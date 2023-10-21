library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity a_mul_b_0 is
port(
    a,b : in std_logic_vector(3 downto 0);
    clk, reset : in std_logic;
    st : out std_logic_vector(2 downto 0);
    nd : out std_logic_vector(7 downto 0));
end a_mul_b_0;

architecture Behavioral of a_mul_b_0 is

component counter_shiftregistor_a 
port(
    a,b : in std_logic_vector(3 downto 0);
    clk, reset : in std_logic;
    st : out std_logic_vector(2 downto 0);
    out_b : out std_logic_vector(3 downto 0);
    out_a : out std_logic_vector(7 downto 0));
end component;
signal out_a :  std_logic_vector(7 downto 0);
signal out_b : std_logic_vector(3 downto 0);
begin

u1 : counter_shiftregistor_a port map(a => a, b=>b, clk => clk, reset =>reset, st => st, out_b => out_b, out_a =>out_a);
nd <= (out_a and(out_b(0) & out_b(0) & out_b(0) & out_b(0) & out_b(0) & out_b(0) & out_b(0) & out_b(0)));
end Behavioral;
