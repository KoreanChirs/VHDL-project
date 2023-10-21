-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.11.2022 08:04:00 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_input_a_b_trans is
end tb_input_a_b_trans;

architecture tb of tb_input_a_b_trans is

    component input_a_b_trans
        port (a     : in std_logic_vector (3 downto 0);
              b     : in std_logic_vector (3 downto 0);
              sin_a : out std_logic_vector (3 downto 0);
              sin_b : out std_logic_vector (3 downto 0);
              bc_da : out std_logic_vector (3 downto 0);
              bc_db : out std_logic_vector (3 downto 0));
    end component;

    signal a     : std_logic_vector (3 downto 0);
    signal b     : std_logic_vector (3 downto 0);
    signal sin_a : std_logic_vector (3 downto 0);
    signal sin_b : std_logic_vector (3 downto 0);
    signal bc_da : std_logic_vector (3 downto 0);
    signal bc_db : std_logic_vector (3 downto 0);

begin

    dut : input_a_b_trans
    port map (a     => a,
              b     => b,
              sin_a => sin_a,
              sin_b => sin_b,
              bc_da => bc_da,
              bc_db => bc_db);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a <= "1010";
        b <= "0101";

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_input_a_b_trans of tb_input_a_b_trans is
    for tb
    end for;
end cfg_tb_input_a_b_trans;