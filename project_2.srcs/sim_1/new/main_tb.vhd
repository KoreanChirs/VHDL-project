-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.11.2022 11:44:23 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_main_code is
end tb_main_code;

architecture tb of tb_main_code is

    component main_code
        port (Clk    : in std_logic;
              Start  : in std_logic;
              Done   : out std_logic;
              A      : in std_logic_vector (3 downto 0);
              B      : in std_logic_vector (3 downto 0);
              Sel    : in std_logic_vector (1 downto 0);
              a_to_g : out std_logic_vector (7 downto 0);
              an     : out std_logic_vector (7 downto 0));
    end component;

    signal Clk    : std_logic;
    signal Start  : std_logic;
    signal Done   : std_logic;
    signal A      : std_logic_vector (3 downto 0);
    signal B      : std_logic_vector (3 downto 0);
    signal Sel    : std_logic_vector (1 downto 0);
    signal a_to_g : std_logic_vector (7 downto 0);
    signal an     : std_logic_vector (7 downto 0);
  

begin

    dut : main_code
    port map (Clk    => Clk,
              Start  => Start,
              Done   => Done,
              A      => A,
              B      => B,
              Sel    => Sel,
              a_to_g => a_to_g,
              an     => an);
  clock_process :process
begin
     clk <= '0';
     wait for 5 ps;
     clk <= '1';
     wait for 5 ps;
end process;

inpt : process
begin        
a <= "1111";
b <= "0111";
sel <= "00";
    wait for 100 ps;
a <= "1111";
b <= "0111";
sel <= "01";
    wait for 100 ps;
a <= "1111";
b <= "0111";
sel <= "10";
    wait for 100 ps;
a <= "0001";
b <= "1111";
sel <= "11";
    wait;    
end process;
    stim_proc: process
begin        
   -- hold reset state for 100 ns.
   start <= '0';
   wait for 20 ps;    
    start <= '1';
   wait;
end process;
end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_main_code of tb_main_code is
    for tb
    end for;
end cfg_tb_main_code;