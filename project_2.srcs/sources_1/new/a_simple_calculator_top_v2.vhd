library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity main_code is
      port(Clk: in std_logic;
		   Start: in std_logic;
		   Done: out std_logic;
		   A: in std_logic_vector(3 downto 0);
		   B:in std_logic_vector (3 downto 0);
		   Sel: in std_logic_vector(1 downto 0);
           a_to_g:out std_logic_vector(7 downto 0);
           an:out std_logic_vector(7 downto 0)
			  );

end main_code;

architecture Behavioral of main_code is

component input_a_b_trans
port(
a,b : in std_logic_vector(3 downto 0);
sin_a, sin_b ,bc_da,bc_db : out std_logic_vector(3 downto 0)
);
end component;

component answer_add_sub 
    port( a, b : in std_logic_vector(3 downto 0);
        select_sig : in std_logic; 
        bcd_10,bcd_1,sign : out std_logic_vector(3 downto 0));   
end component;

component eight_bcd 
    port(
    ans : in std_logic_vector(7 downto 0);
    bcd_10, bcd_1 : out std_logic_vector(3 downto 0)
    );
end component;

component real_ans_registor 
port(
    a,b : in std_logic_vector(3 downto 0);
    clk, reset : in std_logic;
    done : out std_logic;
    st : out std_logic_vector(2 downto 0);
    answer : out std_logic_vector(7 downto 0);
    sign : out std_logic_vector(3 downto 0)
    );
end component;

component myseven_segments 
   Port (
        x:in std_logic_vector(31 downto 0);
        clk: in std_logic;
        clr: std_logic;
        a_to_g: out std_logic_vector(7 downto 0);
        an: out std_logic_vector(7 downto 0)
         );
end component;

  signal s_clk: std_logic;
  signal s_start: std_logic;
  signal not_start : std_logic;
  signal s_calculation_done: std_logic;
  signal candidate_add_sub_bcd_10 :std_logic_vector(3 downto 0);
  signal candidate_add_sub_bcd_1 :std_logic_vector(3 downto 0);
  signal candidate_add_sub_sign : std_logic_vector(3 downto 0);
  signal candidate_mul_bcd_10 :std_logic_vector(3 downto 0);
  signal candidate_mul_bcd_1 :std_logic_vector(3 downto 0);
  signal candidate_mul_sign : std_logic_vector(3 downto 0);
  signal candidate_mul_done : std_logic;
  signal mul_answer :  std_logic_vector(7 downto 0);
  signal state : std_logic_vector(2 downto 0);
  signal s_output_x: std_logic_vector(31 downto 0);
  signal aofsign :  std_logic_vector(3 downto 0);
  signal to_te : std_logic_vector(3 downto 0);
  signal tt_ty,ts_tf,n_s : std_logic_vector(3 downto 0);
begin
s_clk 		<= Clk;
s_start 	<= Start;
not_start <= not(Start);
u1 : input_a_b_trans port map(a => A, b => B, sin_a =>to_te, sin_b => tt_ty,bc_da => ts_tf, bc_db => n_s);
u2 : answer_add_sub port map(a => A, b => B, select_sig => Sel(0),bcd_10 => candidate_add_sub_bcd_10, bcd_1 => candidate_add_sub_bcd_1, sign =>candidate_add_sub_sign ); 
u3 : real_ans_registor port map(a => A, b => B,clk => s_clk, reset => not_start, done => candidate_mul_done, st => state, answer => mul_answer, sign => candidate_mul_sign );
u4 : eight_bcd port map(ans => mul_answer, bcd_10 => candidate_mul_bcd_10 , bcd_1 =>  candidate_mul_bcd_1);

process(clk,Sel,Start,candidate_mul_done,s_output_x,s_output_x, candidate_add_sub_sign,candidate_add_sub_bcd_10,candidate_add_sub_bcd_1,candidate_mul_sign,candidate_mul_bcd_10,candidate_mul_bcd_1)
begin
if(Start = '0') then
    s_output_x <= "00000000000000000000000000000000";
    Done <= '0';
elsif (rising_edge(clk)) then
if(Sel(1) = '0') then
    Done <= '1';
        if(Sel = "00") then
        s_output_x(15 downto 12) <= "1010";
        s_output_x(11 downto 8) <= candidate_add_sub_sign;
        s_output_x(7 downto 4) <= candidate_add_sub_bcd_10;
        s_output_x(3 downto 0) <= candidate_add_sub_bcd_1;
        s_output_x(31 downto 28) <= to_te;
        s_output_x(23 downto 20) <= tt_ty;
        s_output_x(27 downto 24) <= ts_tf;
        s_output_x(19 downto 16) <= n_s;
    elsif(Sel = "01") then
        s_output_x(15 downto 12) <= "1011"; 
        s_output_x(11 downto 8) <= candidate_add_sub_sign;
        s_output_x(7 downto 4) <= candidate_add_sub_bcd_10;
        s_output_x(3 downto 0) <= candidate_add_sub_bcd_1;
        s_output_x(31 downto 28) <= to_te;
        s_output_x(23 downto 20) <= tt_ty;
        s_output_x(27 downto 24) <= ts_tf;
        s_output_x(19 downto 16) <= n_s;
    end if;
elsif(Sel(1) = '1') then
    if(Sel = "10") then
        s_output_x(15 downto 12) <= "1100";
        s_output_x(11 downto 8) <= candidate_mul_sign;
        s_output_x(7 downto 4) <= candidate_mul_bcd_10;
        s_output_x(3 downto 0) <= candidate_mul_bcd_1;
        s_output_x(31 downto 28) <= to_te;
        s_output_x(23 downto 20) <= tt_ty;
        s_output_x(27 downto 24) <= ts_tf;
        s_output_x(19 downto 16) <= n_s;
        Done <=  candidate_mul_done;
    elsif(Sel = "11") then
        s_output_x(15 downto 12) <= "1111";
        s_output_x(11 downto 8) <= "0000";
        s_output_x(7 downto 4) <= "0000";
        s_output_x(3 downto 0) <= "0000";
        s_output_x(31 downto 28) <= to_te;
        s_output_x(23 downto 20) <= tt_ty;
        s_output_x(27 downto 24) <= ts_tf;
        s_output_x(19 downto 16) <= n_s;
        Done <= '0';
    end if;
end if;
end if;
end process;

DiplayOut: myseven_segments port map
 (	x		=> s_output_x, 
	clk		=> s_clk, 
	clr		=> s_start,
	a_to_g	=> a_to_g,
	an		=> an);
end Behavioral;