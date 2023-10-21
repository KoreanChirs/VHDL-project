-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 21.11.2022 07:12:16 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_mul_trans_b is
end tb_mul_trans_b;

architecture tb of tb_mul_trans_b is

    component mul_trans_b
        port (a    : in std_logic_vector (3 downto 0);
              b    : in std_logic_vector (3 downto 0);
              t_a  : out std_logic_vector (3 downto 0);
              t_b  : out std_logic_vector (3 downto 0);
              sign : out std_logic_vector (3 downto 0));
    end component;

    signal a    : std_logic_vector (3 downto 0);
    signal b    : std_logic_vector (3 downto 0);
    signal t_a  : std_logic_vector (3 downto 0);
    signal t_b  : std_logic_vector (3 downto 0);
    signal sign : std_logic_vector (3 downto 0);

begin

    dut : mul_trans_b
    port map (a    => a,
              b    => b,
              t_a  => t_a,
              t_b  => t_b,
              sign => sign);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a <= "0001";
        b <= "1011";
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mul_trans_b of tb_mul_trans_b is
    for tb
    end for;
end cfg_tb_mul_trans_b;
