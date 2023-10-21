
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity real_sum_resistor is
    port(
    a,b : in std_logic_vector(3 downto 0);
    clk, reset : in std_logic;
    st : out std_logic_vector(2 downto 0);
    output : out std_logic_vector(7 downto 0);
    sign : out std_logic_vector(3 downto 0)
    );
end real_sum_resistor;

architecture Behavioral of real_sum_resistor is

component sum_registor is
port(
    clk, reset : in std_logic;
    st : in std_logic_vector(2 downto 0);
    p_out_p : in std_logic_vector(7 downto 0);
    nw_s : in std_logic_vector(7 downto 0);
    out_p : out std_logic_vector(7 downto 0)
);
end component;

component mul_trans_b 
port(
    a,b : in std_logic_vector(3 downto 0);
    t_a, t_b, sign : out std_logic_vector(3 downto 0)    
);
end component;

component a_mul_b_0 is
port(
    a,b : in std_logic_vector(3 downto 0);
    clk, reset : in std_logic;
    st : out std_logic_vector(2 downto 0);
    nd : out std_logic_vector(7 downto 0));
end component;


signal t_a,t_b : std_logic_vector(3 downto 0);
signal temp1 : std_logic_vector(7 downto 0);
signal state : std_logic_vector(2 downto 0);
signal outpt_1,outpt_2,outpt_3,outpt_4 : std_logic_vector(7 downto 0);
begin
u1 : mul_trans_b port map(a=>a, b=>b, t_a => t_a, t_b => t_b,sign => sign);
u2 : a_mul_b_0 port map(a => t_a, b => t_b, clk => clk, reset => reset, st => state, nd => temp1);
u3 : sum_registor port map(clk => clk, reset => reset, st => state, p_out_p => "00000000", nw_s => temp1, out_p => outpt_1);
u4 : sum_registor port map(clk => clk, reset => reset, st => state,  p_out_p => outpt_1, nw_s => temp1, out_p => outpt_2);
u5 : sum_registor port map(clk => clk, reset => reset, st => state, p_out_p => outpt_2, nw_s => temp1, out_p => outpt_3);
u6 : sum_registor port map(clk => clk, reset => reset, st => state,  p_out_p => outpt_3, nw_s => temp1, out_p => outpt_4);
st <= state;
output <= outpt_4;
end Behavioral;
