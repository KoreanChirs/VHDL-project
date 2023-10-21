-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.11.2022 08:45:30 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_eight_bcd is
end tb_eight_bcd;

architecture tb of tb_eight_bcd is

    component eight_bcd
        port (ans    : in std_logic_vector (7 downto 0);
              bcd_10 : out std_logic_vector (3 downto 0);
              bcd_1  : out std_logic_vector (3 downto 0));
    end component;

    signal ans    : std_logic_vector (7 downto 0);
    signal bcd_10 : std_logic_vector (3 downto 0);
    signal bcd_1  : std_logic_vector (3 downto 0);

begin

    dut : eight_bcd
    port map (ans    => ans,
              bcd_10 => bcd_10,
              bcd_1  => bcd_1);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        ans <= "00111111";

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_eight_bcd of tb_eight_bcd is
    for tb
    end for;
end cfg_tb_eight_bcd;
