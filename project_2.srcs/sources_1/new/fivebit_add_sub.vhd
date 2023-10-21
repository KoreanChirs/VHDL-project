library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fivebit_add_sub is
port( a, b : in std_logic_vector(3 downto 0);
        select_sig : in std_logic; 
        sum : out std_logic_vector(4 downto 0));   
end fivebit_add_sub;

architecture Behavioral of fivebit_add_sub is

component full_adder 
    port(
        a,b,cin : in std_logic;
        cout, s : out std_logic
    );
end component;

component four_to_five 
    port (a,b : in std_logic_vector(3 downto 0);
            a_t,b_t : out std_logic_vector(4 downto 0)); 
end component;

component toggle_b 
port(
        b_t: in std_logic_vector(4 downto 0);
        s : in std_logic;
        t_b_t : out std_logic_vector(4 downto 0)
    );
end component;

signal temp1, temp2, temp3, temp4, over : std_logic;
signal a_t,b_t : std_logic_vector(4 downto 0);
signal t_b_t : std_logic_vector(4 downto 0);

begin
u1 : four_to_five port map(a,b,a_t,b_t);
u2 : toggle_b port map(b_t,select_sig,t_b_t);
u3 : full_adder port map(a => a_t(0),b => t_b_t(0), cin => select_sig,s => sum(0),cout => temp1);
u4 :  full_adder port map(a => a_t(1),b => t_b_t(1), cin => temp1, s => sum(1),cout => temp2);
u5 :  full_adder port map(a => a_t(2),b => t_b_t(2), cin => temp2, s => sum(2),cout => temp3);
u6 :  full_adder port map(a => a_t(3),b => t_b_t(3), cin => temp3, s => sum(3),cout => temp4);
u7 :  full_adder port map(a => a_t(4),b => t_b_t(4), cin => temp4, s => sum(4),cout => over);
end Behavioral;
