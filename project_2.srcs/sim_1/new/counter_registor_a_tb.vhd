-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 21.11.2022 11:14:52 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_counter_shiftregistor_a is
end tb_counter_shiftregistor_a;

architecture tb of tb_counter_shiftregistor_a is

    component counter_shiftregistor_a
        port (a,b     : in std_logic_vector (3 downto 0);
              clk   : in std_logic;
              reset : in std_logic;
              st : out std_logic_vector(2 downto 0);
              out_b : out std_logic_vector(3 downto 0);
              out_a : out std_logic_vector (7 downto 0));
    end component;

    signal a,b     : std_logic_vector (3 downto 0);
    signal clk   : std_logic;
    signal reset : std_logic;
    signal st : std_logic_vector(2 downto 0);
    signal out_b : std_logic_vector(3 downto 0);
    signal out_a : std_logic_vector (7 downto 0);

begin

    dut : counter_shiftregistor_a
    port map (a     => a,
                b   => b,
              clk   => clk,
              reset => reset,
              st => st,
              out_b => out_b,
              out_a => out_a);


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

configuration cfg_tb_counter_shiftregistor_a of tb_counter_shiftregistor_a is
    for tb
    end for;
end cfg_tb_counter_shiftregistor_a;