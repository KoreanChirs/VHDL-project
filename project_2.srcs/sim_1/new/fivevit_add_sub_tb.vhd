
library ieee;
use ieee.std_logic_1164.all;

entity tb_fivebit_add_sub is
end tb_fivebit_add_sub;

architecture tb of tb_fivebit_add_sub is

    component fivebit_add_sub
        port (a          : in std_logic_vector (3 downto 0);
              b          : in std_logic_vector (3 downto 0);
              select_sig : in std_logic;
              sum        : out std_logic_vector (4 downto 0));
    end component;

    signal a          : std_logic_vector (3 downto 0);
    signal b          : std_logic_vector (3 downto 0);
    signal select_sig : std_logic;
    signal sum        : std_logic_vector (4 downto 0);

begin

    dut : fivebit_add_sub
    port map (a          => a,
              b          => b,
              select_sig => select_sig,
              sum        => sum);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        a <= "0100";
        b <= "1000";
        select_sig <= '0';
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_fivebit_add_sub of tb_fivebit_add_sub is
    for tb
    end for;
end cfg_tb_fivebit_add_sub;
