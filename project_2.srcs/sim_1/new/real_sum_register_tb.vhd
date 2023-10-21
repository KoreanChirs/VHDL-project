-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 21.11.2022 14:30:09 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_real_sum_resistor is
end tb_real_sum_resistor;

architecture tb of tb_real_sum_resistor is

    component real_sum_resistor
        port (a      : in std_logic_vector (3 downto 0);
              b      : in std_logic_vector (3 downto 0);
              clk    : in std_logic;
              reset  : in std_logic;
              st     : out std_logic_vector (2 downto 0);
              output : out std_logic_vector (7 downto 0);
              sign   : out std_logic_vector (3 downto 0));
    end component;

    signal a      : std_logic_vector (3 downto 0);
    signal b      : std_logic_vector (3 downto 0);
    signal clk    : std_logic;
    signal reset  : std_logic;
    signal st     : std_logic_vector (2 downto 0);
    signal output : std_logic_vector (7 downto 0);
    signal sign   : std_logic_vector (3 downto 0);


begin

    dut : real_sum_resistor
    port map (a      => a,
              b      => b,
              clk    => clk,
              reset  => reset,
              st     => st,
              output => output,
              sign   => sign);

    clock_process :process
begin
     clk <= '0';
     wait for 8 ps;
     clk <= '1';
     wait for 7 ps;
end process;

a <= "1000";
b  <= "1111";
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

configuration cfg_tb_real_sum_resistor of tb_real_sum_resistor is
    for tb
    end for;
end cfg_tb_real_sum_resistor;
