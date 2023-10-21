
-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 23.11.2022 09:48:08 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_answer_add_sub is
end tb_answer_add_sub;

architecture tb of tb_answer_add_sub is

    component answer_add_sub
        port (a          : in std_logic_vector (3 downto 0);
              b          : in std_logic_vector (3 downto 0);
              select_sig : in std_logic;
              bcd_10     : out std_logic_vector (3 downto 0);
              bcd_1      : out std_logic_vector (3 downto 0);
              sign       : out std_logic_vector (3 downto 0));
    end component;

    signal a          : std_logic_vector (3 downto 0);
    signal b          : std_logic_vector (3 downto 0);
    signal select_sig : std_logic;
    signal bcd_10     : std_logic_vector (3 downto 0);
    signal bcd_1      : std_logic_vector (3 downto 0);
    signal sign       : std_logic_vector (3 downto 0);

begin

    dut : answer_add_sub
    port map (a          => a,
              b          => b,
              select_sig => select_sig,
              bcd_10     => bcd_10,
              bcd_1      => bcd_1,
              sign       => sign);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a <= "1100";
        b <= "1010";
        select_sig <= '0';

        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_answer_add_sub of tb_answer_add_sub is
    for tb
    end for;
end cfg_tb_answer_add_sub;