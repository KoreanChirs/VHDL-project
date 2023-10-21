-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 21.11.2022 12:05:42 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_a_mul_b_0 is
end tb_a_mul_b_0;

architecture tb of tb_a_mul_b_0 is

    component a_mul_b_0
        port (a     : in std_logic_vector (3 downto 0);
              b     : in std_logic_vector (3 downto 0);
              clk   : in std_logic;
              reset : in std_logic;
              st    : out std_logic_vector (2 downto 0);
              nd    : out std_logic_vector (7 downto 0));
    end component;

    signal a     : std_logic_vector (3 downto 0);
    signal b     : std_logic_vector (3 downto 0);
    signal clk   : std_logic;
    signal reset : std_logic;
    signal st    : std_logic_vector (2 downto 0);
    signal nd    : std_logic_vector (7 downto 0);

begin

    dut : a_mul_b_0
    port map (a     => a,
              b     => b,
              clk   => clk,
              reset => reset,
              st    => st,
              nd    => nd);

    -- Clock generation
   clock_process :process
begin
     clk <= '0';
     wait for 5 ps;
     clk <= '1';
     wait for 5 ps;
end process;

a <= "1111";
b  <= "1001";
-- Stimulus process
stim_proc: process
begin        
   -- hold reset state for 100 ns.
   reset <= '1';
   wait for 20 ps;    
    reset <= '0';
   wait;
end process;
end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.
-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_a_mul_b_0 of tb_a_mul_b_0 is
    for tb
    end for;
end cfg_tb_a_mul_b_0;
