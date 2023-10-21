library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity myseven_segments is
   Port (
        x:in std_logic_vector(31 downto 0);
        clk: in std_logic;
        clr: std_logic;
        a_to_g: out std_logic_vector(7 downto 0);
        an: out std_logic_vector(7 downto 0)
         );
end myseven_segments;

architecture Behavioral of myseven_segments is
   signal digit_select: std_logic_vector(2 downto 0);
   signal digit:std_logic_vector(3 downto 0);
   signal clkdiv: std_logic_vector(20 downto 0);
begin
 digit_select<=clkdiv(20 downto 18);
process(digit_select,x)
 begin
 case digit_select is
  when "000"=>digit<=x(3 downto 0);
  when "001"=>digit<=x(7 downto 4);
  when "010"=>digit<=x(11 downto 8);
  when"011"=>digit<=x(15 downto 12);
  when "100"=>digit<=x(19 downto 16);
  when "101"=>digit<=x(23 downto 20);
  when "110"=>digit<=x(27 downto 24);
  when others=>digit<=x(31 downto 28);
 end case;
end process;
-- 7 segment decoder
process(digit)
begin
  case digit is
   when "0000"=>a_to_g<="00111111";    --0
   when "0001"=>a_to_g<="00000110";    --1
   when "0010"=>a_to_g<="01011011";    --2
   when "0011"=>a_to_g<="01001111";    --3
   when "0100"=>a_to_g<="01100110";    --4
   when "0101"=>a_to_g<="01101101";    --5
   when "0110"=>a_to_g<="01111101";    --6
   when "0111"=>a_to_g<="00000111";    --7
   when"1000"=>a_to_g<="01111111";    --8
   when "1001"=>a_to_g<="01101111";    --9
   when "1010"=>a_to_g<="11110111";    -- A.   addition
   when "1011"=>a_to_g<="11101101";    -- S.   substraction
   when "1100"=>a_to_g<="10110111";    -- M.    multiplication  
   when "1101"=>a_to_g<="01000000";    -- -     negative sign     
   when "1110"=>a_to_g<="00111111";    --     positive sign   
   when others =>a_to_g<="00000000";    --F
  end case;
 end process;

 process(digit_select)
 begin
 case digit_select is 
  when "000"=>an<="00000001";
  when "001"=>an<="00000010";
  when "010"=>an<="00000100";
  when "011"=>an<="00001000";
  when "100"=>an<="00010000";
  when "101"=>an<="00100000";
  when "110"=>an<="01000000";
  when others=>an<="10000000";
 end case;
end process;
-- Clock divider
process(clk,clr)
 begin
  if clr='0' then
    clkdiv<=(others=>'0');
    elsif clk'event and clk='1' then --Rising edge of clck
    clkdiv<=clkdiv+1;
  end if;
end process;
  
end Behavioral;
